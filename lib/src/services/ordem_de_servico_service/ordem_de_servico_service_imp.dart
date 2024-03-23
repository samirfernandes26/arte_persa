import 'dart:developer';
import 'dart:io';

import 'package:arte_persa/src/core/exceptions/service_exception.dart';
import 'package:arte_persa/src/core/fp/either.dart';
import 'package:arte_persa/src/model/faturamento_model.dart';
import 'package:arte_persa/src/model/image_model.dart';
import 'package:arte_persa/src/model/item_model.dart';
import 'package:arte_persa/src/model/ordem_de_servico_model.dart';
import 'package:arte_persa/src/services/ordem_de_servico_service/ordem_de_servico_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class OrdemDeServicoServiceImp extends OrdemDeServicoService {
  @override
  Future<Either<ServiceException, OrdemDeServicoModel>> execute(
    OrdemDeServicoModel ordeDeServico,
  ) async {
    try {
      FirebaseFirestore fireStore = FirebaseFirestore.instance;
      final collection = fireStore.collection('ordemDeServicos');

      OrdemDeServicoModel ordeDeServicoRest = ordeDeServico;
      List<ItemModel> itens = ordeDeServico.itens;
      List<ItemModel> itensAtualizados = [];
      ImageModel? assinaturaCliente = ordeDeServico.assinaturaCliente;
      ImageModel? fotoAutorizacaoCliente = ordeDeServico.fotoAltorizacaoCliente;
      FaturamentoModel fatura = ordeDeServico.fatura;

      // Informações básicas da OS
      final ordemDeServicosRef = await collection.add({
        'cliente_id': ordeDeServico.clienteId,
        'numero_pedido': ordeDeServico.numeroPedido,
        'created_at': DateTime.now(),
        'updated_at': DateTime.now(),
      });

      // Adiciona o ID ao documento da OS
      await collection.doc(ordemDeServicosRef.id).update({
        'id': ordemDeServicosRef.id,
      });
      ordeDeServicoRest.id = ordemDeServicosRef.id;

      // Salva a assinatura do cliente
      if (assinaturaCliente != null) {
        final String pathServiceAssinatura =
            'clientes/${ordeDeServico.clienteId}/ordem_de_servicos/${ordemDeServicosRef.id}/autorizacao';

        ImageModel assinaturaClienteRef = await upload(
          file: File(assinaturaCliente.pathLocal!),
          fileName: 'assinatura_cliente_${ordeDeServico.numeroPedido}',
          pathService: pathServiceAssinatura,
        );

        await ordemDeServicosRef.collection('assinaturas_clientes').add({
          'path_local': assinaturaCliente.pathLocal,
          'path_download_image': assinaturaClienteRef.pathDownloadImage,
          'path_service': assinaturaClienteRef.pathService,
          'file_name': assinaturaClienteRef.fileName,
        });
      }

      // Salva a foto de autorização do cliente
      if (fotoAutorizacaoCliente != null) {
        final String pathServiceAutorizacao =
            'clientes/${ordeDeServico.clienteId}/ordem_de_servicos/${ordemDeServicosRef.id}/autorizacao';

        ImageModel fotoAutorizacaoClienteRef = await upload(
          file: File(fotoAutorizacaoCliente.pathLocal!),
          fileName: 'altorizacao_do_cliente_${ordeDeServico.numeroPedido}',
          pathService: pathServiceAutorizacao,
        );

        await ordemDeServicosRef.collection('fotos_autorizacao').add({
          'path_local': fotoAutorizacaoCliente.pathLocal,
          'path_download_image': fotoAutorizacaoClienteRef.pathDownloadImage,
          'path_service': fotoAutorizacaoClienteRef.pathService,
          'file_name': fotoAutorizacaoClienteRef.fileName,
        });
      }

      final faturaRef = await ordemDeServicosRef.collection('fatura').add({
        'cliente_id': fatura.clienteId,
        'ordem_de_servico_id': ordemDeServicosRef.id,
        'desconto_aplicado': fatura.descontoAplicado,
        'valor_final_da_nota': fatura.valorFinalDaNota,
        'total_bruto': fatura.totalBruto,
        'adiantamento': fatura.adiantamento,
        'forma_de_pagamento': fatura.formaDePagamento,
        'status_do_pagamento': fatura.statusDoPagamento,
        'comprovante_pagamento': fatura.comprovantePagamento
      });

      final faturaDoc =
          ordemDeServicosRef.collection('fatura').doc(faturaRef.id);
      await faturaDoc.update({'id': faturaRef.id});
      fatura.id = faturaRef.id;

      // Salva todos os itens um a um
      for (var item in itens) {
        final itensRef = await ordemDeServicosRef.collection('itens').add({
          'tipo_item': item.tipoItem,
          'nome_do_item': item.nomeDoItem,
          'comprimento': item.comprimento,
          'largura': item.largura,
          'nome_dos_servicos': item.nomeDosServicos,
          'total': item.total,
        });

        final itemDoc = ordemDeServicosRef.collection('itens').doc(itensRef.id);
        await itemDoc.update({'id': itensRef.id});

        item.id = itensRef.id;
        itensAtualizados.add(item);

        if (item.servicos != null) {
          for (var servico in item.servicos!) {
            await itensRef.collection('servicos').add({
              'valor': servico.valor,
              'user_id': servico.userId,
              'valor_calculo': servico.valorCalculo,
              'nome_do_servico': servico.nomeDoServico,
              'categoria_selecionada': servico.categoriaSelecionada,
              'metro_quadrado': servico.metroQuadrado,
              'metro_linear': servico.metroLinear,
              'valor_fixo': servico.valorFixo,
              'valor_manual': servico.valorManual,
              'created_at': servico.createdAt,
              'updated_at': servico.updatedAt
            });
          }
        }

        // Salva a foto do item
        if (item.fotoProduto != null) {
          final ImageModel fotoDoProduto = item.fotoProduto!;
          final String pathServiceProduto =
              'clientes/${ordeDeServico.clienteId}/ordem_de_servicos/${ordemDeServicosRef.id}/itens/${itensRef.id}/foto_do_produto';

          ImageModel fotoProdutoRef = await upload(
            file: File(fotoDoProduto.pathLocal!),
            fileName:
                'foto_do_produto_${ordeDeServico.numeroPedido}_${itensRef.id}',
            pathService: pathServiceProduto,
          );

          await itensRef.collection('foto_produto').add({
            'path_local': fotoDoProduto.pathLocal,
            'path_download_image': fotoProdutoRef.pathDownloadImage,
            'path_service': fotoProdutoRef.pathService,
            'file_name': fotoProdutoRef.fileName,
          });
        }

        // Salva observações do item, se existirem
        if (item.observacoes != null) {
          for (var observacao in item.observacoes!) {
            final observacoesRef =
                await itensRef.collection('observacoes').add({
              'id': observacao.id,
              'observacao': observacao.observacao,
            });

            final itemDoc =
                itensRef.collection('observacoes').doc(observacoesRef.id);
            await itemDoc.update({'id': observacoesRef.id});

            // Salva a imagem da observação, se existir
            if (observacao.image != null) {
              final ImageModel fotoObservacao = observacao.image!;
              final String pathServiceObservacao =
                  'clientes/${ordeDeServico.clienteId}/ordem_de_servicos/${ordemDeServicosRef.id}/itens/${itensRef.id}/${observacoesRef.id}';

              ImageModel fotoObservacaoRef = await upload(
                file: File(fotoObservacao.pathLocal!),
                fileName:
                    'foto_observacao_${ordeDeServico.numeroPedido}_${itensRef.id}_${observacoesRef.id}',
                pathService: pathServiceObservacao,
              );

              await observacoesRef.collection('imagens').add({
                'path_local': fotoObservacao.pathLocal,
                'path_download_image': fotoObservacaoRef.pathDownloadImage,
                'path_service': fotoObservacaoRef.pathService,
                'file_name': fotoObservacaoRef.fileName,
              });
            }
          }
        }
      }

      ordeDeServicoRest.itens = itensAtualizados;
      ordeDeServicoRest.fatura = fatura;
      ordeDeServicoRest.assinaturaCliente = assinaturaCliente;
      ordeDeServicoRest.fotoAltorizacaoCliente = fotoAutorizacaoCliente;

      return Success(ordeDeServicoRest);
    } catch (e) {
      log('Erro ao cadastrar OS', error: e);
      return Failure(
        ServiceException(
          message: 'Ouve um problema para cadastrar uma ordem de serviço',
        ),
      );
    }
  }

  Future<ImageModel> upload({
    required File file,
    required String fileName,
    required String pathService,
  }) async {
    final FirebaseStorage firebaseStorage = FirebaseStorage.instance;

    final rest = await firebaseStorage
        .ref(
          "$pathService/$fileName.png",
        )
        .putFile(
          file,
        );

    final image = ImageModel(
      pathLocal: rest.ref.fullPath,
      pathService: rest.ref.parent!.fullPath,
      fileName: rest.metadata!.name,
    );

    return image;
  }

  @override
  Future<String> getDownLoadUrlByFileName({
    required String pathService,
    required String fileName,
  }) async {
    final FirebaseStorage firebaseStorage = FirebaseStorage.instance;
    final rest =
        await firebaseStorage.ref("$pathService/$fileName").getDownloadURL();

    return rest;
  }
}
