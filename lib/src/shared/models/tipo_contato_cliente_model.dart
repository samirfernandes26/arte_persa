import 'enum_model_base.dart';

class TipoContatoClienteModel extends EnumModelBase {
  const TipoContatoClienteModel._({
    required super.valor,
    required super.descricao,
  });

  static const telefone = TipoContatoClienteModel._(
    valor: 'telefone',
    descricao: 'Telefone',
  );
  static const celular = TipoContatoClienteModel._(
    valor: 'celular',
    descricao: 'Celular',
  );
  static const whatsapp = TipoContatoClienteModel._(
    valor: 'whatsapp',
    descricao: 'WhatsApp',
  );
  static const email = TipoContatoClienteModel._(
    valor: 'email',
    descricao: 'Email',
  );
  static const outro = TipoContatoClienteModel._(
    valor: 'outro',
    descricao: 'Outro',
  );

  static const values = [telefone, celular, whatsapp, email, outro];
  static const valuesByValor = {
    'telefone': telefone,
    'celular': celular,
    'whatsapp': whatsapp,
    'email': email,
    'outro': outro,
  };

  static TipoContatoClienteModel fromValor(String valor) =>
      valuesByValor[valor] ??
      (throw FormatException('TipoContatoClienteModel invalido: $valor.'));
}
