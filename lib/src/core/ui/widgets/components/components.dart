export 'auth_background_scaffold/auth_background_scaffold.dart';
export 'auth_styles/auth_styles.dart';
export 'painel_background_scaffold/painel_background_scaffold.dart';
export 'painel_page_scaffold/painel_page_scaffold.dart';
export 'painel_styles/painel_styles.dart';
export 'painel_user_avatar/painel_user_avatar.dart';

import 'package:flutter/material.dart';

Row labelRow(
  BuildContext context, {
  required String label,
  String? description,
}) => Row(
  children: [
    Text(
      label,
      style: context.theme.textTheme.bodyMedium?.copyWith(
        fontWeight: FontWeight.w500,
      ),
    ),
    const SizedBox(width: 8),
    Text(
      description ?? 'Não informado',
      style: context.theme.textTheme.bodyLarge,
    ),
  ],
);

Column labelColumn(
  BuildContext context, {
  required String label,
  String? description,
}) => Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Text(
      label,
      style: context.theme.textTheme.bodyMedium?.copyWith(
        fontWeight: FontWeight.w500,
      ),
    ),
    Text(
      description ?? 'Não informado',
      style: context.theme.textTheme.bodyLarge,
    ),
  ],
);

Row headerRow(
  CondicaoMoradia? condicaoMoradia,
  CdsDomicilio imovel,
  Endereco endereco,
  BuildContext context,
) => Row(
  children: [
    ImovelIcon(
      situacaoRua: condicaoMoradia?.situacaoMoradiaId == 7,
      tipoImovelId: imovel.tipoImovelId,
      rounded: true,
    ),
    const SizedBox(width: 8),
    Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(tipoLogradouro(endereco.tipoLogradouro)),
          Text(
            '${endereco.logradouro}, ${endereco.numero ?? 'S/N'}',
            overflow: TextOverflow.ellipsis,
            style: context.theme.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          if (endereco.complemento != null) Text('${endereco.complemento}'),
          Text('BAIRRO ${endereco.bairro}'),
        ],
      ),
    ),
  ],
);

Row contatoRow(
  BuildContext context, {
  required CdsDomicilio imovel,
  List<Contato>? contatos,
}) {
  final telefoneResidencial = contatos
      ?.where((element) => element.tipoContatoId == 1)
      .firstOrNull;
  final telefoneContato = contatos
      ?.where((element) => element.tipoContatoId == 2)
      .firstOrNull;

  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Icon(Icons.phone, color: Colors.blueAccent),
      const SizedBox(width: 8),
      if (imovel.tipoImovelId == 1)
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: GestureDetector(
            onLongPress: () async {
              if (telefoneResidencial?.descricao != null) {
                await callPhoneNumber(telefoneResidencial!.descricao);
              }
            },
            child: labelColumn(
              context,
              label: 'Residêncial',
              description: telefoneResidencial?.descricao.toPhoneNumber,
            ),
          ),
        ),
      GestureDetector(
        onLongPress: () async {
          if (telefoneContato?.descricao != null) {
            await callPhoneNumber(telefoneContato!.descricao);
          }
        },
        child: labelColumn(
          context,
          label: 'Contato',
          description: telefoneContato?.descricao.toPhoneNumber,
        ),
      ),
    ],
  );
}

Row labelIcon(
  BuildContext context, {
  IconData? icon,
  required String label,
  required String description,
}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Icon(icon ?? Icons.tag, color: Colors.blueAccent),
      const SizedBox(width: 8),
      labelColumn(context, label: label, description: description),
    ],
  );
}
