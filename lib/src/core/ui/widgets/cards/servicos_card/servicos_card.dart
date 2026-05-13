import 'package:arte_persa/src/core/ui/widgets/components/painel_styles/painel_styles.dart';
import 'package:arte_persa/src/screens/servicos/servicos_mock_data.dart';
import 'package:flutter/material.dart';

class ServicosCard extends StatelessWidget {
  const ServicosCard({
    super.key,
    required this.data,
    required this.onActionTap,
  });

  final ServicoData data;
  final ValueChanged<ServicoActionData> onActionTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.96),
        borderRadius: BorderRadius.circular(26),
        border: Border.all(
          color: const Color(0xFFC9A976).withValues(alpha: 0.88),
          width: 1.2,
        ),
        boxShadow: [
          BoxShadow(
            color: PainelStyles.shadowColor.withValues(alpha: 0.18),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      padding: const EdgeInsets.fromLTRB(18, 16, 18, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      fontSize: 19,
                      color: Colors.black,
                      height: 1.08,
                    ),
                    children: [
                      const TextSpan(
                        text: 'Cliente: ',
                        style: TextStyle(fontWeight: FontWeight.w800),
                      ),
                      TextSpan(
                        text: data.clientName,
                        style: const TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Text(
                'N°.-${data.orderNumber}',
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          LayoutBuilder(
            builder: (context, constraints) {
              final compact = constraints.maxWidth < 430;

              if (compact) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _ServicosCardLeftInfo(data: data),
                    const SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerRight,
                      child: _ServicosCardRightInfo(data: data),
                    ),
                  ],
                );
              }

              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: _ServicosCardLeftInfo(data: data),
                  ),
                  const SizedBox(width: 18),
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 200),
                    child: _ServicosCardRightInfo(data: data),
                  ),
                ],
              );
            },
          ),
          const SizedBox(height: 12),
          LayoutBuilder(
            builder: (context, constraints) {
              final compact = constraints.maxWidth < 440;

              if (compact) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _StatusPill(data: data),
                    const SizedBox(height: 12),
                    Wrap(
                      alignment: WrapAlignment.end,
                      spacing: 18,
                      runSpacing: 12,
                      children: data.actions
                          .map(
                            (action) => _ServicosCardAction(
                              data: action,
                              onTap: () => onActionTap(action),
                            ),
                          )
                          .toList(),
                    ),
                  ],
                );
              }

              return Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: _StatusPill(data: data),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: data.actions
                        .map(
                          (action) => Padding(
                            padding: const EdgeInsets.only(left: 18),
                            child: _ServicosCardAction(
                              data: action,
                              onTap: () => onActionTap(action),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

class _ServicosCardLeftInfo extends StatelessWidget {
  const _ServicosCardLeftInfo({
    required this.data,
  });

  final ServicoData data;

  @override
  Widget build(BuildContext context) {
    return Text(
      'Nº OS: ${data.orderLabel}\n'
      'Início: ${data.startDate}\n'
      'Última notificação: ${data.lastNotification}',
      style: const TextStyle(
        fontSize: 17,
        color: Colors.black,
        fontWeight: FontWeight.w500,
        height: 1.18,
      ),
    );
  }
}

class _ServicosCardRightInfo extends StatelessWidget {
  const _ServicosCardRightInfo({
    required this.data,
  });

  final ServicoData data;

  @override
  Widget build(BuildContext context) {
    return Text(
      'Peça: ${data.pieceLabel}',
      textAlign: TextAlign.right,
      style: const TextStyle(
        fontSize: 17,
        color: Colors.black,
        fontWeight: FontWeight.w500,
        height: 1.18,
      ),
    );
  }
}

class _StatusPill extends StatelessWidget {
  const _StatusPill({
    required this.data,
  });

  final ServicoData data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: data.statusBackgroundColor,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Text(
        data.statusLabel,
        style: TextStyle(
          color: data.statusTextColor,
          fontSize: 17,
          fontWeight: FontWeight.w500,
          height: 1,
        ),
      ),
    );
  }
}

class _ServicosCardAction extends StatelessWidget {
  const _ServicosCardAction({
    required this.data,
    required this.onTap,
  });

  final ServicoActionData data;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(18),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                data.icon,
                size: 34,
                color: const Color(0xFF9E742E),
              ),
              const SizedBox(height: 2),
              Text(
                data.label,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 12.5,
                  color: Color(0xFF2B241D),
                  fontWeight: FontWeight.w500,
                  height: 1.1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
