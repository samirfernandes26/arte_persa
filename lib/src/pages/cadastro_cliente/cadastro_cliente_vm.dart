import 'package:arte_persa/src/core/exceptions/service_exception.dart';
import 'package:arte_persa/src/core/fp/either.dart';
import 'package:arte_persa/src/core/providers/application_providers.dart';
import 'package:arte_persa/src/model/cliente_model.dart';
import 'package:arte_persa/src/model/endereco_model.dart';
import 'package:arte_persa/src/pages/cadastro_cliente/cadastro_cliente_state.dart';
import 'package:asyncstate/asyncstate.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cadastro_cliente_vm.g.dart';

@Riverpod(keepAlive: true)
class CadastroClienteVm extends _$CadastroClienteVm {
  @override
  CadastroClienteState build() => CadastroClienteState.initial();

  void invalidateState() {
    ref.invalidateSelf();
  }

  Future<ClienteModel?> registerCliente(Map<String, dynamic> endereco) async {
    final loaderHandler = AsyncLoaderHandler()..start();
    late Either<ServiceException, ClienteModel> response;
    final EnderecoModel dadosEnderecoForm = EnderecoModel.fromJson(endereco);
    final ClienteModel dadosClienteForm = state.clienteForm!;

    dadosClienteForm.endereco = dadosEnderecoForm;

    state = state.copyWith(
      enderecoForm: dadosEnderecoForm,
      clienteForm: dadosClienteForm,
    );

    if (dadosClienteForm.id == null) {
      response = await ref
          .read(cadastroClienteServiceProvider)
          .execute(cliente: dadosClienteForm);
    } else {}

    switch (response) {
      case Success():
        state = state.copyWith(
          status: CadastroClienteStateStatus.success,
          message: 'Cliente cadastrado com sucesso',
          clienteSalva: response.right,
        );
        loaderHandler.close();
        return response.right;

      case Failure(exception: ServiceException(:final message)):
        state = state.copyWith(
          status: CadastroClienteStateStatus.error,
          message: message,
        );
        loaderHandler.close();
        return null;
    }
    // return
  }

  Future<void> updateStateCliente(Map<String, dynamic> cliente) async {
    ClienteModel dadosClienteForm = ClienteModel.fromJson(
      {
        ...cliente,
        'telefone_contato_um_Whatsapp': cliente['telefone_contato_um'] != null
            ? state.telefoneContatoUmWhatsapp
            : false,
        'telefone_contato_dois_Whatsapp':
            cliente['telefone_contato_dois'] != null
                ? state.telefoneContatoDoisWhatsapp
                : false,
      },
    );

    state = state.copyWith(
      clienteForm: dadosClienteForm,
      telefoneContatoUmWhatsapp: dadosClienteForm.telefoneContatoUm != null
          ? state.telefoneContatoUmWhatsapp
          : false,
      telefoneContatoDoisWhatsapp: dadosClienteForm.telefoneContatoDois != null
          ? state.telefoneContatoDoisWhatsapp
          : false,
    );
  }

  Future<void> updateStateEndereco(Map<String, dynamic> endereco) async {
    EnderecoModel dadosEnderecoForm = EnderecoModel.fromJson(endereco);
    state = state.copyWith(
      enderecoForm: dadosEnderecoForm,
      enderecoJson: endereco,
    );
  }

  updateStatePessoaFisicaJuridica(int? value) {
    switch (value) {
      case 1:
        state = state.copyWith(
          radioPF: true,
          radioPJ: false,
        );
        break;
      case 2:
        state = state.copyWith(
          radioPF: false,
          radioPJ: true,
        );
        break;
      default:
        state = state.copyWith(
          radioPF: false,
          radioPJ: false,
        );
        break;
    }
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
}
