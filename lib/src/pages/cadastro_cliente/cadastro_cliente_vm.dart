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

  Future<void> registerCliente(Map<String, dynamic> endereco) async {
    final loaderHandler = AsyncLoaderHandler()..start();
    late Either<ServiceException, ClienteModel> response;
    late ClienteModel dadosClienteForm;
    late EnderecoModel dadosEnderecoForm;

    if (state.clienteForm != null) {
      dadosClienteForm = state.clienteForm!;
    }

    if (state.enderecoForm != null) {
      dadosEnderecoForm = state.enderecoForm!;
    } else {
      dadosEnderecoForm = EnderecoModel.fromJson(endereco);
      state = state.copyWith(
        enderecoForm: dadosEnderecoForm,
      );
    }

    if (dadosClienteForm.id == null) {
      response = await ref
          .read(cadastroClienteServiceProvider)
          .execute(state.clienteJson!, endereco);
    } else {}

    switch (response) {
      case Success():
        state = state.copyWith(
          status: CadastroClienteStateStatus.success,
          message: 'Cliente cadastrado com sucesso',
        );
        loaderHandler.close();

      case Failure(exception: ServiceException(:final message)):
        state = state.copyWith(
          status: CadastroClienteStateStatus.error,
          message: message,
        );
        loaderHandler.close();
    }
  }

  Future<void> updateStateCliente(Map<String, dynamic> cliente) async {
    ClienteModel dadosClienteForm = ClienteModel.fromJson(cliente);
    state = state.copyWith(
      clienteForm: dadosClienteForm,
      clienteJson: cliente,
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
}
