import 'enum_model_base.dart';

class CanalEntradaOrdemServicoModel extends EnumModelBase {
  const CanalEntradaOrdemServicoModel._({
    required super.valor,
    required super.descricao,
  });

  static const whatsapp = CanalEntradaOrdemServicoModel._(
    valor: 'whatsapp',
    descricao: 'WhatsApp',
  );
  static const telefone = CanalEntradaOrdemServicoModel._(
    valor: 'telefone',
    descricao: 'Telefone',
  );
  static const email = CanalEntradaOrdemServicoModel._(
    valor: 'email',
    descricao: 'Email',
  );
  static const site = CanalEntradaOrdemServicoModel._(
    valor: 'site',
    descricao: 'Site',
  );
  static const presencial = CanalEntradaOrdemServicoModel._(
    valor: 'presencial',
    descricao: 'Presencial',
  );
  static const marketplace = CanalEntradaOrdemServicoModel._(
    valor: 'marketplace',
    descricao: 'Marketplace',
  );
  static const outro = CanalEntradaOrdemServicoModel._(
    valor: 'outro',
    descricao: 'Outro',
  );

  static const values = [
    whatsapp,
    telefone,
    email,
    site,
    presencial,
    marketplace,
    outro,
  ];
  static const valuesByValor = {
    'whatsapp': whatsapp,
    'telefone': telefone,
    'email': email,
    'site': site,
    'presencial': presencial,
    'marketplace': marketplace,
    'outro': outro,
  };

  static CanalEntradaOrdemServicoModel fromValor(String valor) =>
      valuesByValor[valor] ??
      (throw FormatException(
        'CanalEntradaOrdemServicoModel invalido: $valor.',
      ));
}
