
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

  Future<void> teste(ServicoModel? servico, bool checkbox)async{

    const double largura = 2.69;
    const double comprimento = 6.9;
    const double area = largura * comprimento;

    List<ServicoModel>? servicos  = state.servicos;

    int index = servicos!.indexOf(servico!);

    if(servico.metroQuadrado! == true && servico.valor != null && checkbox == true ){
      servico.valorCalculo = area * servico.valor!;
    }else{
      servico.valorCalculo = null;
    }

    servicos[index] = servico;
    state = state.copyWith(
      servicos: servicos,
    );
  }

  Future<void> loadDataServicos() async{
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
      status: OrdemDeServicoStateStatus.loaded,
    );

    loaderHandler.close();
  }
}