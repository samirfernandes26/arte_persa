

import 'package:arte_persa/src/pages/servicos/servicos_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'servicos_vm.g.dart';
@riverpod
class ServicosVm extends _$ServicosVm {
  @override
  ServicosStateStatus build() => ServicosStateStatus.initial;

  Future<void> loadData(
    Map<String, dynamic> dadosCadastraisServico,
  ) async {
    // late Either<ServiceException, CadastroServicoModel> response;

    // if(dadosCadastraisServico['id'] == null){
    //   response = await ref.read(cadastroServicoServiceProvider).execute(dadosCadastraisServico);
    // }else{

    // }
  }
}
