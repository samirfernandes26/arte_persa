import 'package:arte_persa/src/core/exceptions/service_exception.dart';
import 'package:arte_persa/src/core/fp/either.dart';
import 'package:arte_persa/src/core/providers/application_providers.dart';
import 'package:arte_persa/src/model/usuario_model.dart';
import 'package:arte_persa/src/model/servico_model.dart';
import 'package:arte_persa/src/pages/cadastro_servico/cadastro_servico_state.dart';
import 'package:asyncstate/asyncstate.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cadastro_servico_vm.g.dart';

@riverpod
class CadastroServicoVm extends _$CadastroServicoVm {
  @override
  CadastroServicoState build() => CadastroServicoState.initial();

  Future<UsuarioModel?> registerServico(
    Map<String, dynamic> dadosCadastraisServico,
  ) async {
    final loaderHandler = AsyncLoaderHandler()..start();
    late Either<ServiceException, ServicoModel> response;

    if (dadosCadastraisServico['id'] == null) {
      response = await ref
          .read(cadastroServicoServiceProvider)
          .execute(dadosCadastraisServico);
    } else {}

    loaderHandler.close();
    switch (response) {
      case Success():
        state = state.copyWith(
          status: CadastroServicoStateStatus.success,
          message: 'Servço Cadastrado com sucesso!',
        );

      case Failure(exception: ServiceException(:final message)):
        state = state.copyWith(
          status: CadastroServicoStateStatus.error,
          message: message,
        );
    }

    return null;
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
      status: CadastroServicoStateStatus.loaded,
    );

    loaderHandler.close();
  }
}
