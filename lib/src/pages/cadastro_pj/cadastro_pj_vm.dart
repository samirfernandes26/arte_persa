import 'package:arte_persa/src/core/exceptions/service_exception.dart';
import 'package:arte_persa/src/core/fp/either.dart';
import 'package:arte_persa/src/core/providers/application_providers.dart';
import 'package:arte_persa/src/model/cliente_pj_model.dart';
import 'package:arte_persa/src/model/endereco_model.dart';
import 'package:arte_persa/src/pages/cadastro_pj/cadastro_pj_state.dart';
import 'package:asyncstate/asyncstate.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cadastro_pj_vm.g.dart';

@riverpod
class CadastroPjVm extends _$CadastroPjVm {
  @override
  CadastroPjState build() => CadastroPjState.initial();

  Future<void> loadData() async {}

  Future<void> register({
    required Map<String, dynamic> enderecoJson,
  }) async {
    final loaderHandler = AsyncLoaderHandler()..start();

    Either<ServiceException, ClientePjModel> response;

    final ClientePjModel cliente = state.cliente!;
    cliente.endereco = EnderecoModel.fromJson(enderecoJson);

    state = state.copyWith(cliente: cliente);

    if (cliente.id == null) {
      response = await ref
          .read(cadastroClientePjServiceProvider)
          .execute(cliente: cliente);
    } else {}

    // switch (response) {
    //   case Success():
    //     state = state.copyWith(
    //       status: CadastroClienteStateStatus.success,
    //       message: 'Cliente cadastrado com sucesso',
    //       clienteSalva: response.right,
    //     );
    loaderHandler.close();
    //     return response.right;

    //   case Failure(exception: ServiceException(:final message)):
    //     state = state.copyWith(
    //       status: CadastroClienteStateStatus.error,
    //       message: message,
    //     );
    //     loaderHandler.close();
    //     return null;
    // }
    // return
  }

  Future<void> updateStateCliente({
    required Map<String, dynamic> clienteJson,
  }) async {
    ClientePjModel cliente = ClientePjModel.fromJson(
      {
        ...clienteJson,
        'telefone_contato_um_Whatsapp':
            clienteJson['telefone_contato_um'] != null
                ? state.telefoneContatoUmWhatsapp
                : false,
        'telefone_contato_dois_Whatsapp':
            clienteJson['telefone_contato_dois'] != null
                ? state.telefoneContatoDoisWhatsapp
                : false,
      },
    );

    state = state.copyWith(
      cliente: cliente,
      telefoneContatoUmWhatsapp: state.telefoneContatoUmWhatsapp,
      telefoneContatoDoisWhatsapp: cliente.telefoneContatoDois != null
          ? state.telefoneContatoDoisWhatsapp
          : false,
    );
  }

  updateContatoWhatsapp({
    required int tipoContato,
    required bool whatsapp,
  }) {
    switch (tipoContato) {
      case 1:
        state = state.copyWith(
          telefoneContatoUmWhatsapp: whatsapp,
        );
        break;
      case 2:
        state = state.copyWith(
          telefoneContatoDoisWhatsapp: whatsapp,
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

  Future<void> updateStateEndereco({
    required Map<String, dynamic> enderecoJson,
  }) async {
    ClientePjModel cliente = state.cliente!;
    cliente.endereco = EnderecoModel.fromJson(enderecoJson);

    state = state.copyWith(cliente: cliente);
  }
}
