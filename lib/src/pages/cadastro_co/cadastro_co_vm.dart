import 'package:arte_persa/src/core/exceptions/service_exception.dart';
import 'package:arte_persa/src/core/fp/either.dart';
import 'package:arte_persa/src/core/providers/application_providers.dart';
import 'package:arte_persa/src/model/usuario_model.dart';
import 'package:arte_persa/src/pages/cadastro_co/cadastro_co_state.dart';
import 'package:asyncstate/asyncstate.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cadastro_co_vm.g.dart';

@riverpod
class CadastroCoVm extends _$CadastroCoVm {
  @override
  CadastroCoState build() => CadastroCoState.initial();

  int teste = 0;

  Future<UsuarioModel?> salvaUsuario(Map<String, dynamic> user) async {
    final loaderHandler = AsyncLoaderHandler()..start();
    late Either<ServiceException, UsuarioModel> response;

    String dataNascimento = DateFormat('yyyy-MM-dd')
        .format(
          DateFormat('dd/MM/yyyy').parse(
            user['data_nascimento'],
          ),
        )
        .toString();

    if (user['id'] == null) {
      response = await ref.read(cadastroServiceProvider).execute(
        userJson: {
          ...user,
          'contato_um_whatsapp': state.telefoneContatoUmWhatsapp,
          'contato_dois_whatsapp': state.telefoneContatoDoisWhatsapp,
          'data_nascimento': dataNascimento,
          'created_at': DateFormat('y-MM-dd HH:mm:ss').format(DateTime.now()),
          'updated_at': DateFormat('y-MM-dd HH:mm:ss').format(DateTime.now()),
        },
      );
    } else {
      // chamo a função de update de usuario
    }

    switch (response) {
      case Success(value: final usuario):
        state = state.copyWith(
          status: CadastroCoStatus.success,
          message: 'Usuário cadastrado com sucesso',
          usuario: usuario,
        );
        loaderHandler.close();
        return usuario;
      case Failure(exception: ServiceException(:final message)):
        state = state.copyWith(
          status: CadastroCoStatus.error,
          message: message,
        );
        loaderHandler.close();
        return null;
    }
  }

  updateContatoWhatsapp({
    required int tipoContato,
    required bool whatsapp,
  }) {
    switch (tipoContato) {
      case 1:
        state = state.copyWith(
          telefoneContatoUmWhatsapp: !whatsapp,
        );
        break;
      case 2:
        state = state.copyWith(
          telefoneContatoDoisWhatsapp: !whatsapp,
        );
        break;
      default:
        state = state.copyWith(
          telefoneContatoUmWhatsapp: false,
          telefoneContatoDoisWhatsapp: false,
        );
        break;
    }
  }
}
