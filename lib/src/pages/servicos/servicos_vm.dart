import 'package:arte_persa/src/model/servico_model.dart';
import 'package:arte_persa/src/pages/servicos/servicos_state.dart';
import 'package:asyncstate/asyncstate.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'servicos_vm.g.dart';

@riverpod
class ServicosVm extends _$ServicosVm {
  @override
  ServicosState build() => ServicosState.initial();

  Future<void> loadData() async {
    final loaderHandler = AsyncLoaderHandler()..start();

    List<ServicoModel> servicos = [];
    FirebaseFirestore fireStore = FirebaseFirestore.instance;

    final collection = fireStore.collection('servicos');

    QuerySnapshot<Map<String, dynamic>> snapshot = await collection. get();

    for (var servico in snapshot.docs) {
      servicos.add(ServicoModel.fromJson(servico.data()));
    }

    state = state.copyWith(
      servicos: servicos,
      status: ServicosStateStatus.loaded,
    );

    loaderHandler.close();
  }
}
