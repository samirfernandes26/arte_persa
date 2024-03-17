import 'package:arte_persa/src/model/faturamento_model.dart';
import 'package:arte_persa/src/model/image_model.dart';
import 'package:arte_persa/src/model/item_model.dart';
import 'package:arte_persa/src/model/observacao_model.dart';
import 'package:asyncstate/asyncstate.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:arte_persa/src/model/cliente_model.dart';
import 'package:arte_persa/src/model/servico_model.dart';
import 'package:arte_persa/src/pages/ordem_de_servico/ordem_de_servico_state.dart';

part 'ordem_de_servico_vm.g.dart';

@riverpod
class OrdemDeServicoVm extends _$OrdemDeServicoVm {
  @override
  OrdemDeServicoState build() => OrdemDeServicoState.initial();

  Future<void> loadData() async {
    final loaderHandler = AsyncLoaderHandler()..start();

    List<ServicoModel> servicos = [];
    List<ClienteModel> clientes = [];
    FirebaseFirestore fireStore = FirebaseFirestore.instance;

    final collectionServicos = fireStore.collection('servicos');
    final collectionCliente = fireStore.collection('clientes');

    QuerySnapshot<Map<String, dynamic>> snapshotServico =
        await collectionServicos.get();
    QuerySnapshot<Map<String, dynamic>> snapshotCliente =
        await collectionCliente.get();

    for (var servico in snapshotServico.docs) {
      servicos.add(ServicoModel.fromJson(servico.data()));
    }

    for (var servico in snapshotCliente.docs) {
      clientes.add(ClienteModel.fromJson(servico.data()));
    }

    servicos.sort((a, b) => a.nomeDoServico.compareTo(b.nomeDoServico));

    state = state.copyWith(
      servicos: servicos,
      clientes: clientes,
      status: OrdemDeServicoStateStatus.loaded,
    );

    loaderHandler.close();
  }

  calcularValorDoServico({
    required ServicoModel servico,
    required bool valueCheck,
    Map<String, bool>? lado,
  }) {
    final ServicoModel servicoData = servico;
    final List<ServicoModel> servicos = state.servicos!;
    final int servicoIndex = servicos.indexOf(servico);
    final ItemForm item = state.itemForm!;
    final double largura = item.largura!;
    final double comprimento = item.comprimento!;
    final double areaTotal = largura * comprimento;
    double valorCalculo = 0;
    servicoData.valor = servicoData.valor ?? 0;
    List<String> nomeDosServicos = item.nomeDosServicos ?? [];

    if (valueCheck == true) {
      if (servicoData.metroQuadrado == true) {
        valorCalculo = valorCalculo + (servicoData.valor! * areaTotal);
      }

      if (servicoData.metroLinear == true && lado != null) {
        if (lado['ambos_os_comprimentos'] == true &&
            lado['apenas_um_comprimento'] == false) {
          valorCalculo =
              valorCalculo + (servicoData.valor! * (comprimento * 2));
        }

        if (lado['apenas_um_comprimento'] == true &&
            lado['ambos_os_comprimentos'] == false) {
          valorCalculo = valorCalculo + (servicoData.valor! * comprimento);
        }

        if (lado['ambas_as_larguras'] == true &&
            lado['apenas_uma_largura'] == false) {
          valorCalculo = valorCalculo + (servicoData.valor! * (largura * 2));
        }

        if (lado['apenas_uma_largura'] == true &&
            lado['ambas_as_larguras'] == false) {
          valorCalculo = valorCalculo + (servicoData.valor! * largura);
        }
      }

      if (servicoData.valorFixo == true) {
        valorCalculo = valorCalculo + (servicoData.valor!);
      }
    }

    servicos[servicoIndex] = servicoData.copyWith(
      valorCalculo: valorCalculo,
    );

    if (valueCheck == true) {
      if (!nomeDosServicos.contains(servicoData.nomeDoServico)) {
        nomeDosServicos.add(servicoData.nomeDoServico);
      }
    } else {
      nomeDosServicos.remove(servicoData.nomeDoServico);
    }

    state = state.copyWith(
      itemForm: item.copyWith(
        servicos: servicos,
        nomeDosServicos: nomeDosServicos,
      ),
      servicos: servicos,
    );
  }

  cadastroDeItem(Map<String, dynamic> dataItem) {
    final itemForm = ItemForm.fromJson(dataItem);

    state = state.copyWith(
      itemForm: itemForm.copyWith(fotoProduto: state.image),
      image: null,
    );

    final fotoProduto = state.itemForm?.fotoProduto;

    state = state.copyWith(fotoProduto: fotoProduto);
  }

  Future<void> selectImageProdo({
    required String tipoFoto,
    required String source,
    required String fileName,
  }) async {
    ImagePicker imagePicker = ImagePicker();
    late XFile? resImage;
    if (source == 'Camera') {
      resImage = await imagePicker.pickImage(
        source: ImageSource.camera,
        maxWidth: 2000,
        maxHeight: 2000,
        imageQuality: 90,
      );
    }

    if (source == 'Galeria') {
      resImage = await imagePicker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 2000,
        maxHeight: 2000,
        imageQuality: 90,
      );
    }

    if (resImage != null) {
      ImageModel imagem = ImageModel(
        pathLocal: resImage.path,
        fileName: "$fileName${geradorDeNumeroDePedido()}",
      );

      state = state.copyWith(image: imagem);
    }
  }

  addObservacao() {
    final observacoes = state.observacoesModelList ?? [];

    final ObservacaoModel novaObservacao = ObservacaoModel(
      observacao: null,
      image: null,
    );

    observacoes.add(novaObservacao);

    state = state.copyWith(observacoesModelList: observacoes);
  }

  removerObservacao({required int index}) {
    final itemForm = state.itemForm;
    final obsevacoes = itemForm?.observacoes;

    if (obsevacoes != null) {
      obsevacoes.remove(obsevacoes[index]);

      state = state.copyWith(
        itemForm: itemForm?.copyWith(
          observacoes: obsevacoes,
        ),
      );
    }
  }

  Future<void> addFotoObservacao({
    required String tipoFoto,
    required String source,
    required String fileName,
    required int index,
  }) async {
    await selectImageProdo(
      tipoFoto: tipoFoto,
      source: source,
      fileName: fileName,
    );

    final image = state.image;

    if (image != null) {
      final List<ObservacaoModel>? observacoes = state.observacoesModelList;
      final observacao = observacoes?[index];

      final observacaoForm = observacao!.copyWith(
        image: image,
      );

      observacoes?[index] = observacaoForm;

      state = state.copyWith(
        observacoesModelList: observacoes,
        image: null,
      );
    }
  }

  cadastroObservacoes(Map<String, dynamic> dataItem) {
    final List<ObservacaoModel>? observacoes = state.observacoesModelList;

    if (observacoes != null) {
      for (int index = 0; index < observacoes.length; index++) {
        final observacoesModel = observacoes[index].copyWith(
          observacao: dataItem['observacao[$index]'],
        );

        observacoes[index] = observacoesModel;
      }
      state = state.copyWith(
        observacoesModelList: observacoes,
      );
    }
  }

  int geradorDeNumeroDePedido() {
    // Obter a data e hora atual
    DateTime now = DateTime.now();

    // Formatar a data e hora
    String formattedDateTime = DateFormat('yy-MM-dd HH:mm:ss').format(now);

    // Remover os caracteres especiais da data e hora formatada
    String cleanFormattedDateTime =
        formattedDateTime.replaceAll(RegExp(r'[-: ]'), '');

    // Converter para um número inteiro
    int concatenatedDateTime = int.parse(cleanFormattedDateTime);

    // Saída
    return concatenatedDateTime;
  }

  Future<void> finalizarCadastroItem() async {
    late List<ItemModel> itemModelList = [];
    final itemForm = state.itemForm!;
    late ItemModel itemModel;
    late FaturamentoModel? faturaOs;
    final observacoesModelList = state.observacoesModelList;

    double total = 0;

    for (ServicoModel servico in state.servicos!) {
      double valorCalculo = servico.valorCalculo ?? 0;
      total = total + valorCalculo;
    }

    itemForm.servicos = null;
    itemForm.fotoProduto = null;
    late Map<String, dynamic> itemFormJson = itemForm.toJson();
    itemModel = ItemModel.fromJson(itemFormJson);
    itemModel.servicos = state.servicos;

    if (state.faturaOs != null) {
      faturaOs = state.faturaOs;
      final valorAux = faturaOs?.totalBruto ?? 0;
      faturaOs?.totalBruto = valorAux + total;
    } else {
      faturaOs = FaturamentoModel(totalBruto: total);
    }

    itemModel = itemModel.copyWith(
      servicos: state.servicos,
      total: total,
      observacoes: observacoesModelList,
      fotoProduto: state.fotoProduto,
    );

    if (state.itens != null && state.itens!.isNotEmpty) {
      itemModelList = state.itens!;
    }

    itemModelList.add(itemModel);

    if (itemModelList.isNotEmpty) {
      state = state.copyWith(
        itens: itemModelList,
        faturaOs: faturaOs,
      );
      resetItem();
    }
  }

  resetItem() {
    ImageModel imagemNull = ImageModel(
      pathLocal: null,
      pathService: null,
      fileName: null,
      pathDownloadImage: null,
    );

    ObservacaoModel observacaoNull = ObservacaoModel(
      id: null,
      observacao: null,
      image: imagemNull,
    );

    List<String> nomeDosServicosNull = [];
    List<ObservacaoModel> observacoesNull = [];

    ItemForm itemForm = ItemForm(
      nomeDoItem: null,
      comprimento: null,
      largura: null,
      fotoProduto: imagemNull,
      nomeDosServicos: nomeDosServicosNull,
      observacoes: observacoesNull,
      tipoIdetem: null,
    );

    state = state.copyWith(
      observacao: observacaoNull,
      itemForm: itemForm,
      observacoesModelList: observacoesNull,
      image: imagemNull,
      fotoProduto: imagemNull,
    );
  }
}
