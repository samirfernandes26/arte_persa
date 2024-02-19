import 'package:arte_persa/src/core/exceptions/service_exception.dart';
import 'package:arte_persa/src/core/fp/either.dart';
import 'package:arte_persa/src/model/cadastro_model.dart';
import 'package:arte_persa/src/pages/cadastro/cadastro_state.dart';


class CadastroVm {
  CadastroState state = CadastroState.initial();

  int teste = 0;

  soma(int a, int b) {
    teste += a + b;
  }

  // Future<CadastroModel?> salvaUsuario(CadastroModel user) {
  //   late Either<ServiceException, CadastroModel> response;

  //   if (user.id == null) {
  //     // chamo a funçãoa de cadastrar usuario
  //   } else {
  //     // chamo a função de update de usuario
  //   }

    // switch (response) {
    //   case Success(value: final usuario):
    //     state = state.copyWith(
    //         status: CadastroStatus.success,
    //         message: 'Usuário cadastrado com sucesso');

    //     return usuario;
    //   case Failure(exception: ServiceException(:final message)):
    //     state = state.copyWith(status: CadastroStatus.error, message: message);

    //     return null;
    // }

    // return null;
  // }
}
