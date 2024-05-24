import 'package:arte_persa/src/core/exceptions/service_exception.dart';
import 'package:arte_persa/src/core/fp/either.dart';
import 'package:arte_persa/src/core/providers/application_providers.dart';
import 'package:arte_persa/src/model/cliente_pf_model.dart';
import 'package:arte_persa/src/model/endereco_model.dart';
import 'package:arte_persa/src/pages/cadastro_pf/cadastro_pf_state.dart';
import 'package:asyncstate/asyncstate.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cadastro_pf_vm.g.dart';

@riverpod
class CadastroPfVm extends _$CadastroPfVm {
  @override
  CadastroPfState build() => CadastroPfState.initial();

  Future<void> loadData() async {}

  Future<ClientePfModel?> register({
    required Map<String, dynamic> enderecoJson,
  }) async {
    final loaderHandler = AsyncLoaderHandler()..start();

    final ClientePfModel cliente = state.cliente!;
    cliente.endereco = EnderecoModel.fromJson(enderecoJson);

    state = state.copyWith(cliente: cliente);

    // if (cliente.id == null) {
    //   Either<ServiceException, ClientePfModel> response = await ref
    //       .read(cadastroClientePfServiceProvider)
    //       .execute(cliente: cliente);
    // } else {}

    Either<ServiceException, ClientePfModel> response = await ref
        .read(cadastroClientePfServiceProvider)
        .execute(cliente: cliente);

    switch (response) {
      case Success():
        state = state.copyWith(
          status: CadastroPfStatus.success,
          message: 'Cliente cadastrado com sucesso',
          cliente: response.right,
        );

        return response.right;

      case Failure(exception: ServiceException(:final message)):
        state = state.copyWith(
          status: CadastroPfStatus.error,
          message: message,
        );

        return null;
    }
  }

  Future<void> updateStateCliente({
    required Map<String, dynamic> clienteJson,
  }) async {
    ClientePfModel cliente = ClientePfModel.fromJson(
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
    ClientePfModel cliente = state.cliente!;
    cliente.endereco = EnderecoModel.fromJson(enderecoJson);

    state = state.copyWith(cliente: cliente);
  }
}
