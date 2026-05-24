import 'enum_model_base.dart';

class StatusOrdemServicoModel extends EnumModelBase {
  const StatusOrdemServicoModel._({
    required super.valor,
    required super.descricao,
  });

  static const aberta = StatusOrdemServicoModel._(
    valor: 'aberta',
    descricao: 'Aberta',
  );
  static const aguardandoColeta = StatusOrdemServicoModel._(
    valor: 'aguardando_coleta',
    descricao: 'Aguardando coleta',
  );
  static const coletada = StatusOrdemServicoModel._(
    valor: 'coletada',
    descricao: 'Coletada',
  );
  static const emHigienizacao = StatusOrdemServicoModel._(
    valor: 'em_higienizacao',
    descricao: 'Em higienizacao',
  );
  static const emManutencao = StatusOrdemServicoModel._(
    valor: 'em_manutencao',
    descricao: 'Em manutencao',
  );
  static const controleQualidade = StatusOrdemServicoModel._(
    valor: 'controle_qualidade',
    descricao: 'Controle de qualidade',
  );
  static const prontaParaEntrega = StatusOrdemServicoModel._(
    valor: 'pronta_para_entrega',
    descricao: 'Pronta para entrega',
  );
  static const entregue = StatusOrdemServicoModel._(
    valor: 'entregue',
    descricao: 'Entregue',
  );
  static const cancelada = StatusOrdemServicoModel._(
    valor: 'cancelada',
    descricao: 'Cancelada',
  );

  static const values = [
    aberta,
    aguardandoColeta,
    coletada,
    emHigienizacao,
    emManutencao,
    controleQualidade,
    prontaParaEntrega,
    entregue,
    cancelada,
  ];
  static const valuesByValor = {
    'aberta': aberta,
    'aguardando_coleta': aguardandoColeta,
    'coletada': coletada,
    'em_higienizacao': emHigienizacao,
    'em_manutencao': emManutencao,
    'controle_qualidade': controleQualidade,
    'pronta_para_entrega': prontaParaEntrega,
    'entregue': entregue,
    'cancelada': cancelada,
  };

  static StatusOrdemServicoModel fromValor(String valor) =>
      valuesByValor[valor] ??
      (throw FormatException('StatusOrdemServicoModel invalido: $valor.'));
}
