import 'package:arte_persa/src/database/daos/cliente_dao.dart';
import 'package:arte_persa/src/model/cliente_model.dart';
import 'package:arte_persa/src/pages/vizualizar_cliente/vizualizar_cliente_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'vizualizar_cliente_vm.g.dart';

@riverpod
class VisualizarClienteVm extends _$VisualizarClienteVm {
  VisualizarClienteState build() => VisualizarClienteState.initial();

  Future<void> loadData(Map<String, dynamic> data) async {
    ClienteModel? cliente = await ClienteDao.getById(data['id']);

    if (cliente != null) {
      state = state.copyWith(
          status: VisualizarClienteStateStatus.loaded, cliente: cliente);
    } else {
      state = state.copyWith(
        message: 'Cliente não encontrado',
        status: VisualizarClienteStateStatus.error,
      );
    }
  }
}
