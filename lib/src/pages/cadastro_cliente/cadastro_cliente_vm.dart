

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

  Future<void> salvarCiente(Map<String, dynamic> user) async {

  }
}