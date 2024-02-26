import 'package:arte_persa/src/core/exceptions/service_exception.dart';
import 'package:arte_persa/src/core/fp/either.dart';
import 'package:arte_persa/src/core/providers/application_providers.dart';
import 'package:arte_persa/src/model/usuario_model.dart';
import 'package:arte_persa/src/model/servico_model.dart';
import 'package:arte_persa/src/pages/cadastro_servico/cadastro_servico_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cadastro_servico_vm.g.dart';

@riverpod
class CadastroServicoVm extends _$CadastroServicoVm {
  @override
  CadastroServicoState build() => CadastroServicoState.initial();

  Future<UsuarioModel?> salvarNovoServico(
    Map<String, dynamic> dadosCadastraisServico,
  ) async {
    late Either<ServiceException, ServicoModel> response;

    if(dadosCadastraisServico['id'] == null){
      response = await ref.read(cadastroServicoServiceProvider).execute(dadosCadastraisServico);
    }else{

    }
    
    return null;
  }
}
