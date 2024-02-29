import 'package:arte_persa/src/model/cliente_model.dart';
import 'package:arte_persa/src/model/servico_model.dart';
import 'package:arte_persa/src/pages/ordem_de_servico/ordem_de_servico_state.dart';
import 'package:asyncstate/asyncstate.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ordem_de_servico_vm.g.dart';

@riverpod
class OrdemDeServicoVm extends _$OrdemDeServicoVm {
  @override
  OrdemDeServicoState build() => OrdemDeServicoState.initial();

  Future<void> teste(ServicoModel? servico, bool checkbox) async {
    const double largura = 2.69;
    const double comprimento = 6.9;
    const double area = largura * comprimento;

    List<ServicoModel>? servicos = state.servicos;

    int index = servicos!.indexOf(servico!);

    if (servico.metroQuadrado! == true &&
        servico.valor != null &&
        checkbox == true) {
      servico.valorCalculo = area * servico.valor!;
    } else {
      servico.valorCalculo = null;
    }

    servicos[index] = servico;
    state = state.copyWith(
      servicos: servicos,
    );
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

  updateStatePagers(int page, Map<String, dynamic> data) {
    switch (page) {
      case 1:
        state = state.copyWith(
          paginaUm: data,
        );
        break;
      case 2:
        state = state.copyWith(
          paginaDois: data,
        );
        break;
      case 3:
        state = state.copyWith(
          paginatres: data,
        );
        break;
      case 4:
        state = state.copyWith(
          paginaquatro: data,
        );
        break;
    }
  }
}
