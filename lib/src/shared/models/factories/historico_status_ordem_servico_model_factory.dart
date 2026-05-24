import 'factory_helpers.dart';

sealed class HistoricoStatusOrdemServicoModelFactory {
  static HistoricoStatusOrdemServicoModel make({
    String? id,
    String? ordemServicoId,
    String? usuarioId,
    StatusOrdemServicoModel? statusOrigem,
    StatusOrdemServicoModel? statusDestino,
    String? motivo,
    Map<String, dynamic>? metadados,
    bool? ativo,
    DateTime? dataCriacao,
    DateTime? dataAtualizacao,
    DateTime? dataExclusao,
    OrdemServicoModel? ordemServico,
    UsuarioModel? usuario,
  }) {
    final model = HistoricoStatusOrdemServicoModel(
      id: id ?? makeFakeId(),
      ordemServicoId: ordemServicoId ?? makeFakeId(),
      usuarioId: usuarioId ?? makeFakeId(),
      statusOrigem:
          statusOrigem ?? makeFakeEnum(StatusOrdemServicoModel.values),
      statusDestino:
          statusDestino ?? makeFakeEnum(StatusOrdemServicoModel.values),
      motivo: motivo ?? faker.lorem.sentence(),
      metadados: metadados ?? makeFakeMap(label: 'metadados'),
      ativo: ativo ?? true,
      dataCriacao: dataCriacao ?? makeFakeDateTime(),
      dataAtualizacao: dataAtualizacao ?? makeFakeDateTime(),
      dataExclusao: dataExclusao,
      ordemServico: ordemServico,
      usuario: usuario,
    );

    return model;
  }
}
