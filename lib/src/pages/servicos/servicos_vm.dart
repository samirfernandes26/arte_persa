import 'dart:developer';

import 'package:arte_persa/src/model/cadastro_servico_model.dart';
import 'package:arte_persa/src/pages/servicos/servicos_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'servicos_vm.g.dart';

@riverpod
class ServicosVm extends _$ServicosVm {
  @override
  ServicosState build() => ServicosState.initial();

  Future<void> loadData(
    Map<String, dynamic> dadosCadastraisServico,
  ) async {
    List<CadastroServicoModel> servicos = [];
    FirebaseFirestore fireStore = FirebaseFirestore.instance;
    final collection = fireStore.collection('servicos');

    QuerySnapshot<Map<String, dynamic>> snapshot = await collection. get();

    for (var servico in snapshot.docs) {
      log('');
      servicos.add(CadastroServicoModel.fromJson(servico.data()));
    }
    final batata = 1;

    // state = state.copyWith(
    //   servicos: servicos,
    //   status: ServicosStateStatus.loaded,
    // );
  }
}
