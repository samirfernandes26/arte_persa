import 'package:arte_persa/src/core/exceptions/service_exception.dart';
import 'package:arte_persa/src/core/fp/either.dart';
import 'package:arte_persa/src/core/providers/application_providers.dart';
import 'package:arte_persa/src/model/usuario_model.dart';
import 'package:arte_persa/src/pages/cadastro/cadastro_state.dart';
import 'package:asyncstate/asyncstate.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cadastro_vm.g.dart';

@riverpod
class CadastroVm extends _$CadastroVm {
  @override
  CadastroState build() => CadastroState.initial();

  int teste = 0;

  soma(int a, int b) {
    teste += a + b;
  }

  Future<CadastroModel?> salvaUsuario(Map<String, dynamic> user) async {
    final loaderHandler = AsyncLoaderHandler()..start();
    late Either<ServiceException, CadastroModel> response;

    if (user['id'] == null) {
      response = await ref.read(cadastroServiceProvider).execute(user);
    } else {
      // chamo a função de update de usuario
    }

    switch (response) {
      case Success(value: final usuario):
        state = state.copyWith(
          status: CadastroStatus.success,
          message: 'Usuário cadastrado com sucesso',
          usuario: usuario,
        );
        loaderHandler.close();
        return usuario;
      case Failure(exception: ServiceException(:final message)):
        state = state.copyWith(
          status: CadastroStatus.error,
          message: message,
        );
        loaderHandler.close();
        return null;
    }
  }
}
