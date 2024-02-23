import 'package:arte_persa/src/core/exceptions/service_exception.dart';
import 'package:arte_persa/src/core/fp/either.dart';
import 'package:arte_persa/src/core/providers/application_providers.dart';
import 'package:arte_persa/src/model/usuario_model.dart';
import 'package:arte_persa/src/pages/login/login_state.dart';
import 'package:asyncstate/asyncstate.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_vm.g.dart';

@riverpod
class LoginVm extends _$LoginVm {
  @override
  LoginState build() => LoginState.initial();

  Future<bool> login(String login, String senha) async {
    final loaderHandler = AsyncLoaderHandler()..start();
    late Either<ServiceException, CadastroModel> response;

    response = await ref.read(authServiceProvider).execute(login, senha);

    switch (response) {
      case Success(value: final usuario):
        state = state.copyWith(
          status: LoginStateStatus.success,
          message: 'Usuário cadastrado com sucesso',
          usuario: usuario,
        );
        loaderHandler.close();
        return true;

      case Failure(exception: ServiceException(:final message)):
        state = state.copyWith(
          status: LoginStateStatus.error,
          message: message,
        );
        loaderHandler.close();
        return false;
    }
  }
}
