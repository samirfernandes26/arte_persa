import 'package:arte_persa/src/core/exceptions/service_exception.dart';
import 'package:arte_persa/src/core/fp/either.dart';
import 'package:arte_persa/src/core/providers/application_providers.dart';
import 'package:arte_persa/src/model/cliente_model.dart';
import 'package:arte_persa/src/model/endereco_model.dart';
import 'package:arte_persa/src/pages/cadastro_cliente/cadastro_cliente_state.dart';
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
          .execute(dadosClienteForm, dadosEnderecoForm);
    } else {}

    return null;
  }

  Future<void> updateStateCliente(Map<String, dynamic> cliente) async {
    ClienteModel dadosClienteForm = ClienteModel.fromJson(cliente);
    state = state.copyWith(
      clienteForm: dadosClienteForm,
    );
    final batata = state.clienteForm;
    final teste = '';
  }

  Future<void> updateStateEndereco(Map<String, dynamic> endereco) async {
    EnderecoModel dadosEnderecoForm = EnderecoModel.fromJson(endereco);
    state = state.copyWith(
      enderecoForm: dadosEnderecoForm,
    );
  }
}
