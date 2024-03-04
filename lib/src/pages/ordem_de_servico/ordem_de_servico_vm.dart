import 'package:arte_persa/src/model/image_model.dart';
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

  calcularValorDoServico({
    required ServicoModel servico,
    required bool valueCheck,
    Map<String, bool>? lado,
  }) {
    ServicoModel servicoData = servico;
    List<ServicoModel> servicos = state.servicos!;
    int servicoIndex = servicos.indexOf(servico);
    final ItemForm item = state.itemForm!;
    double largura = item.largura!;
    double comprimento = item.comprimento!;
    double areaTotal = largura * comprimento;
    double valorCalculo = 0;
    servicoData.valor = servicoData.valor ?? 0;

    if (servicoData.metroQuadrado == true) {
      valorCalculo = valorCalculo + (servicoData.valor! * areaTotal);
    }

    if (servicoData.metroLinear == true && lado != null) {
      if (lado['ambos_os_comprimentos'] == true &&
          lado['apenas_um_comprimento'] == false) {
        valorCalculo = valorCalculo + (servicoData.valor! * (comprimento * 2));
      }

      if (lado['apenas_um_comprimento'] == true &&
          lado['ambos_os_comprimentos'] == false) {
        valorCalculo = valorCalculo + (servicoData.valor! * comprimento);
      }

      if (lado['ambas_as_larguras'] == true && lado['apenas_uma_largura'] == false) {
        valorCalculo = valorCalculo + (servicoData.valor! * (largura * 2));
      }

      if (lado['apenas_uma_largura'] == true && lado['ambas_as_larguras'] == false) {
        valorCalculo = valorCalculo + (servicoData.valor! * largura);
      }
    }

    if (servicoData.valorFixo == true) {
      valorCalculo = valorCalculo + (servicoData.valor!);
    }

    if (servicoData.porcentagemServico == true) {
      //Todo pensar em uma forma de fazer esse calculo.
      // servico.servicoSelecionando
    }

    servicos[servicoIndex] = servicoData.copyWith(
      valorCalculo: valorCalculo,
    );

    state = state.copyWith(
      itemForm: item.copyWith(
        servicos: servicos,
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
    final itemFormUpdate = state.itemForm;
    final observacoes = itemFormUpdate?.observacoes ?? state.observacoesForm;

    observacoes?.add(
      ObservacaoForm(
        observacao: null,
        image: null,
      ),
    );

    state = state.copyWith(
      itemForm: itemFormUpdate?.copyWith(
        observacoes: observacoes,
      ),
    );
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
      final itemForm = state.itemForm;
      final observacoes = itemForm?.observacoes;
      final observacao = observacoes?[index];

      final observacaoForm = observacao!.copyWith(
        image: image,
      );
      observacoes?[index] = observacaoForm;

      state = state.copyWith(
        itemForm: itemForm?.copyWith(
          observacoes: observacoes,
        ),
        image: null,
      );
    }
  }

  cadastroObservacoes(Map<String, dynamic> dataItem) {
    final itemForm = state.itemForm;
    final observacoes = itemForm?.observacoes;

    if (observacoes != null) {
      for (int index = 0; index < observacoes.length; index++) {
        final observacaoForm = observacoes[index].copyWith(
          observacao: dataItem['observacao[$index]'],
        );

        observacoes[index] = observacaoForm;
      }
      state = state.copyWith(
        itemForm: itemForm?.copyWith(
          observacoes: observacoes,
        ),
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

  Future<void> loadDataServicos() async {
    final loaderHandler = AsyncLoaderHandler()..start();

    List<ServicoModel> servicos = [];
    FirebaseFirestore fireStore = FirebaseFirestore.instance;

    final collection = fireStore.collection('servicos');

    QuerySnapshot<Map<String, dynamic>> snapshot = await collection.get();

    for (var servico in snapshot.docs) {
      servicos.add(ServicoModel.fromJson(servico.data()));
    }

    servicos.sort((a, b) => a.nomeDoServico.compareTo(b.nomeDoServico));

    state = state.copyWith(
      servicos: servicos,
      status: OrdemDeServicoStateStatus.loaded,
    );

    loaderHandler.close();
  }

  Future<void> loadDataClientes() async {
    List<ClienteModel> clientes = [];
    FirebaseFirestore fireStore = FirebaseFirestore.instance;

    final collection = fireStore.collection('clientes');

    QuerySnapshot<Map<String, dynamic>> snapshot = await collection.get();

    for (var servico in snapshot.docs) {
      clientes.add(ClienteModel.fromJson(servico.data()));
    }

    state = state.copyWith(
      clientes: clientes,
      status: OrdemDeServicoStateStatus.loaded,
    );
  }
}
