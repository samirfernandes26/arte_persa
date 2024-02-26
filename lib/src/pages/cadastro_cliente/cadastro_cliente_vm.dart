

import 'package:arte_persa/src/pages/cadastro_cliente/cadastro_cliente_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cadastro_cliente_vm.g.dart';

@riverpod
class CadastroClienteVm extends _$CadastroClienteVm {
  @override
  CadastroClienteState build() => CadastroClienteState.initial();

  Future<void> salvarCiente(Map<String, dynamic> user) async {

  }
}