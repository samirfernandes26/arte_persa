import 'factory_helpers.dart';

sealed class UsuarioModelFactory {
  static UsuarioModel make({
    String? id,
    String? nome,
    String? email,
    PerfilUsuarioModel? perfil,
    bool? ativo,
    DateTime? ultimoLoginEm,
    DateTime? dataCriacao,
    DateTime? dataAtualizacao,
    DateTime? dataExclusao,
  }) {
    final model = UsuarioModel(
      id: id ?? makeFakeId(),
      nome: nome ?? faker.person.name(),
      email: email ?? faker.internet.email(),
      perfil: perfil ?? makeFakeEnum(PerfilUsuarioModel.values),
      ativo: ativo ?? true,
      ultimoLoginEm: ultimoLoginEm ?? makeFakeDateTime(),
      dataCriacao: dataCriacao ?? makeFakeDateTime(),
      dataAtualizacao: dataAtualizacao ?? makeFakeDateTime(),
      dataExclusao: dataExclusao,
    );

    return model;
  }
}
