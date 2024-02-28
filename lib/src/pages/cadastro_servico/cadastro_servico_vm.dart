import 'package:arte_persa/src/core/exceptions/service_exception.dart';
import 'package:arte_persa/src/core/fp/either.dart';
import 'package:arte_persa/src/core/providers/application_providers.dart';
import 'package:arte_persa/src/model/usuario_model.dart';
import 'package:arte_persa/src/model/servico_model.dart';
import 'package:arte_persa/src/pages/cadastro_servico/cadastro_servico_state.dart';
import 'package:asyncstate/asyncstate.dart';
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
}
