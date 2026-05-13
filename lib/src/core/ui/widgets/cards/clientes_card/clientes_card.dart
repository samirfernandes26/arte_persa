import 'package:arte_persa/src/core/ui/widgets/buttons/clientes_card_action_button/clientes_card_action_button.dart';
import 'package:arte_persa/src/core/ui/widgets/components/painel_styles/painel_styles.dart';
import 'package:arte_persa/src/screens/clientes/clientes_mock_data.dart';
import 'package:flutter/material.dart';

class ClientesCard extends StatelessWidget {
  const ClientesCard({
    super.key,
    required this.data,
    required this.onNewServiceTap,
    required this.onProfileTap,
    required this.onContactTap,
  });

  final ClienteData data;
  final VoidCallback onNewServiceTap;
  final VoidCallback onProfileTap;
  final VoidCallback onContactTap;

  @override
  Widget build(BuildContext context) {
    final palette = data.palette;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.96),
        borderRadius: BorderRadius.circular(28),
        border: Border.all(
          color: palette.borderColor.withValues(alpha: 0.92),
          width: 1.3,
        ),
        boxShadow: [
          BoxShadow(
            color: PainelStyles.shadowColor.withValues(alpha: 0.20),
            blurRadius: 22,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _ClientesCardHeader(data: data),
            Padding(
              padding: const EdgeInsets.fromLTRB(18, 16, 18, 18),
              child: Column(
                children: [
                  LayoutBuilder(
                    builder: (context, constraints) {
                      if (constraints.maxWidth < 360) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _ClientesCardInfoLeft(data: data),
                            const SizedBox(height: 14),
                            Divider(
                              color:
                                  palette.borderColor.withValues(alpha: 0.55),
                              height: 1,
                            ),
                            const SizedBox(height: 14),
                            _ClientesCardInfoRight(data: data),
                          ],
                        );
                      }

                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: _ClientesCardInfoLeft(data: data),
                          ),
                          Container(
                            width: 1,
                            margin: const EdgeInsets.symmetric(horizontal: 18),
                            color: palette.borderColor.withValues(alpha: 0.50),
                          ),
                          Expanded(
                            child: _ClientesCardInfoRight(data: data),
                          ),
                        ],
                      );
                    },
                  ),
                  const SizedBox(height: 18),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(999),
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: palette.statusGradient,
                      ),
                    ),
                    child: Text(
                      'Status: ${data.statusLabel}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: palette.statusTextColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),
                  Row(
                    children: [
                      Expanded(
                        child: ClientesCardActionButton(
                          label: 'Nova OS',
                          icon: Icons.settings_suggest_outlined,
                          iconBackgroundColor: palette.iconBackgroundColor,
                          iconColor: palette.iconColor,
                          onTap: onNewServiceTap,
                        ),
                      ),
                      Expanded(
                        child: ClientesCardActionButton(
                          label: 'Perfil',
                          icon: Icons.account_circle_outlined,
                          iconBackgroundColor: palette.iconBackgroundColor,
                          iconColor: palette.iconColor,
                          onTap: onProfileTap,
                        ),
                      ),
                      Expanded(
                        child: ClientesCardActionButton(
                          label: 'Contato',
                          icon: Icons.call_rounded,
                          iconBackgroundColor: palette.iconBackgroundColor,
                          iconColor: palette.iconColor,
                          onTap: onContactTap,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ClientesCardHeader extends StatelessWidget {
  const _ClientesCardHeader({
    required this.data,
  });

  final ClienteData data;

  @override
  Widget build(BuildContext context) {
    final palette = data.palette;

    return Container(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 15),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: palette.headerGradient,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: RichText(
              text: TextSpan(
                style: TextStyle(
                  color: palette.textColor,
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  height: 1.15,
                ),
                children: [
                  const TextSpan(text: 'Cliente: '),
                  TextSpan(
                    text: data.name,
                    style: const TextStyle(fontWeight: FontWeight.w800),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 12),
          Text(
            'N°.${data.idLabel}',
            style: TextStyle(
              color: palette.textColor,
              fontSize: 17,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class _ClientesCardInfoLeft extends StatelessWidget {
  const _ClientesCardInfoLeft({
    required this.data,
  });

  final ClienteData data;

  @override
  Widget build(BuildContext context) {
    return _ClientesDetailBlock(
      children: [
        _ClientesDetailText(
          title: 'Contato:',
          value: data.phone,
        ),
        const SizedBox(height: 14),
        _ClientesDetailText(
          title: 'E-mail:',
          value: data.email,
        ),
      ],
    );
  }
}

class _ClientesCardInfoRight extends StatelessWidget {
  const _ClientesCardInfoRight({
    required this.data,
  });

  final ClienteData data;

  @override
  Widget build(BuildContext context) {
    return _ClientesDetailBlock(
      children: [
        _ClientesDetailText(
          title: 'Totais:',
          value: data.totalServicesLabel,
        ),
        const SizedBox(height: 10),
        _ClientesDetailText(
          title: 'Média Gasto:',
          value: data.averageSpendLabel,
        ),
        const SizedBox(height: 10),
        _ClientesDetailText(
          title: 'Localização:',
          value: data.location,
        ),
      ],
    );
  }
}

class _ClientesDetailBlock extends StatelessWidget {
  const _ClientesDetailBlock({
    required this.children,
  });

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: const TextStyle(
        color: Color(0xFF15110E),
        fontSize: 16.5,
        fontWeight: FontWeight.w700,
        height: 1.05,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }
}

class _ClientesDetailText extends StatelessWidget {
  const _ClientesDetailText({
    required this.title,
    required this.value,
  });

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: const TextStyle(
          color: Color(0xFF15110E),
          fontSize: 16.5,
          fontWeight: FontWeight.w700,
          height: 1.18,
        ),
        children: [
          TextSpan(text: '$title\n'),
          TextSpan(
            text: value,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
