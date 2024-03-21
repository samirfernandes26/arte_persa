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
    FirebaseFirestore fireStore = FirebaseFirestore.instance;
    final collection = fireStore.collection('ordemDeServicos');

    List<ItemModel> itens = ordeDeServico.itens;
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

    // Salva a assinatura do cliente
    if (assinaturaCliente != null) {
      await upload(
        file: File(assinaturaCliente.pathLocal!),
        fileName: 'assinatura_cliente_${ordeDeServico.numeroPedido}',
        pathService:
            'clientes/${ordeDeServico.clienteId}/ordem_de_servicos/${ordemDeServicosRef.id}',
      );

      await ordemDeServicosRef.collection('assinaturas_clientes').add({
        'path_local': assinaturaCliente.pathLocal,
        'path_download_image': assinaturaCliente.pathDownloadImage,
        'path_service': assinaturaCliente.pathService,
        'file_name': assinaturaCliente.fileName,
      });
    }

    // Salva a foto de autorização do cliente
    if (fotoAutorizacaoCliente != null) {
      await ordemDeServicosRef.collection('fotos_autorizacao').add({
        'path_local': fotoAutorizacaoCliente.pathLocal,
        'path_download_image': fotoAutorizacaoCliente.pathDownloadImage,
        'path_service': fotoAutorizacaoCliente.pathService,
        'file_name': fotoAutorizacaoCliente.fileName,
      });
    }

    await ordemDeServicosRef.collection('fatura').add({
      'cliente_id': fatura.clienteId,
      'ordem_de_servico_id': fatura.ordemDeServicoId,
      'desconto_aplicado': fatura.descontoAplicado,
      'valor_final_da_nota': fatura.valorFinalDaNota,
      'total_bruto': fatura.totalBruto,
      'adiantamento': fatura.adiantamento,
      'forma_de_pagamento': fatura.formaDePagamento,
      'status_do_pagamento': fatura.statusDoPagamento,
      'comprovante_pagamento': fatura.comprovantePagamento
    });

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
        await itensRef.collection('foto_produto').add({
          'path_local': item.fotoProduto!.pathLocal,
          'path_download_image': item.fotoProduto!.pathDownloadImage,
          'path_service': item.fotoProduto!.pathService,
          'file_name': item.fotoProduto!.fileName,
        });
      }

      // Salva observações do item, se existirem
      if (item.observacoes != null) {
        for (var observacao in item.observacoes!) {
          final observacoesRef = await itensRef.collection('observacoes').add({
            'observacao': observacao.observacao,
          });

          // Salva a imagem da observação, se existir
          if (observacao.image != null) {
            await observacoesRef.collection('imagens').add({
              'path_local': observacao.image!.pathLocal,
              'path_download_image': observacao.image!.pathDownloadImage,
              'path_service': observacao.image!.pathService,
              'file_name': observacao.image!.fileName,
            });
          }
        }
      }
    }
    final batata = '';
    // TODO: implement execute
    throw UnimplementedError();
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

    String pathDownloadImage = await getDownLoadUrlByFileName(
      fileName: rest.metadata!.name,
      pathService: rest.ref.parent!.fullPath,
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
