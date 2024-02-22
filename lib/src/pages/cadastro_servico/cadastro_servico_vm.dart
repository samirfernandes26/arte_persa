import 'package:arte_persa/src/model/cadastro_model.dart';
import 'package:arte_persa/src/pages/cadastro_servico/cadastro_servico_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cadastro_servico_vm.g.dart';

@riverpod
class CadastroServicoVm extends _$CadastroServicoVm {
  @override
  CadastroServicoState build() => CadastroServicoState.initial();

  

  Future<CadastroModel?> salvarNovoServico(Map<String, dynamic> user) async {
    return null;
  }
}
