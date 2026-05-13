import 'package:flutter/material.dart';

enum ServicosTab {
  pendentes,
  concluidos,
}

enum ServicoActionType {
  aprovar,
  acompanhar,
  verDetalhes,
  faturar,
  confirmar,
  recibo,
}

class ServicoActionData {
  const ServicoActionData({
    required this.label,
    required this.icon,
    required this.type,
  });

  final String label;
  final IconData icon;
  final ServicoActionType type;
}

class ServicoData {
  const ServicoData({
    required this.category,
    required this.clientName,
    required this.orderLabel,
    required this.orderNumber,
    required this.startDate,
    required this.lastNotification,
    required this.pieceLabel,
    required this.statusLabel,
    required this.statusBackgroundColor,
    required this.statusTextColor,
    required this.actions,
  });

  final ServicosTab category;
  final String clientName;
  final String orderLabel;
  final String orderNumber;
  final String startDate;
  final String lastNotification;
  final String pieceLabel;
  final String statusLabel;
  final Color statusBackgroundColor;
  final Color statusTextColor;
  final List<ServicoActionData> actions;
}

sealed class ServicosMockData {
  static const _goldStatus = Color(0xFFC98B20);
  static const _brownStatus = Color(0xFF8A4F18);
  static const _lightStatus = Color(0xFFF1E1C9);

  static const services = <ServicoData>[
    ServicoData(
      category: ServicosTab.pendentes,
      clientName: 'Roberto Souza',
      orderLabel: 'OS-043',
      orderNumber: '043',
      startDate: '12/10/2023',
      lastNotification: '14/10/2023',
      pieceLabel: 'Tapete Persa,\nR\$ 50,00',
      statusLabel: 'Aguardando aprovação',
      statusBackgroundColor: _goldStatus,
      statusTextColor: Colors.white,
      actions: [
        ServicoActionData(
          label: 'Aprovar',
          icon: Icons.check_circle_outline_rounded,
          type: ServicoActionType.aprovar,
        ),
        ServicoActionData(
          label: 'Ver Detalhes',
          icon: Icons.calendar_month_outlined,
          type: ServicoActionType.verDetalhes,
        ),
      ],
    ),
    ServicoData(
      category: ServicosTab.pendentes,
      clientName: 'Maria Oliveira',
      orderLabel: 'OS-043',
      orderNumber: '043',
      startDate: '15/10/2023',
      lastNotification: '16/10/2023',
      pieceLabel: 'Tapete Persa,\nR\$ 32,00',
      statusLabel: 'Em andamento',
      statusBackgroundColor: _brownStatus,
      statusTextColor: Colors.white,
      actions: [
        ServicoActionData(
          label: 'Acompanhar',
          icon: Icons.play_circle_outline_rounded,
          type: ServicoActionType.acompanhar,
        ),
        ServicoActionData(
          label: 'Ver Detalhes',
          icon: Icons.calendar_month_outlined,
          type: ServicoActionType.verDetalhes,
        ),
      ],
    ),
    ServicoData(
      category: ServicosTab.pendentes,
      clientName: 'Lucas Ferreira',
      orderLabel: 'OS-043',
      orderNumber: '043',
      startDate: '18/10/2023',
      lastNotification: '19/10/2023',
      pieceLabel: 'Tapete Persa,\nR\$ 38,00',
      statusLabel: 'Aguardando pagamento',
      statusBackgroundColor: _lightStatus,
      statusTextColor: Color(0xFF593514),
      actions: [
        ServicoActionData(
          label: 'Faturar',
          icon: Icons.payments_outlined,
          type: ServicoActionType.faturar,
        ),
      ],
    ),
    ServicoData(
      category: ServicosTab.pendentes,
      clientName: 'Ana Santos',
      orderLabel: 'OS-043',
      orderNumber: '043',
      startDate: '20/10/2023',
      lastNotification: '21/10/2023',
      pieceLabel: 'Tapete Persa,\nR\$ 38,00',
      statusLabel: 'Aguardando Retirada',
      statusBackgroundColor: Color(0xFFD1A35D),
      statusTextColor: Colors.white,
      actions: [
        ServicoActionData(
          label: 'Confirmar',
          icon: Icons.check_circle_outline_rounded,
          type: ServicoActionType.confirmar,
        ),
      ],
    ),
    ServicoData(
      category: ServicosTab.concluidos,
      clientName: 'Júlia Prado',
      orderLabel: 'OS-052',
      orderNumber: '052',
      startDate: '02/11/2023',
      lastNotification: '05/11/2023',
      pieceLabel: 'Tapete Clássico,\nR\$ 75,00',
      statusLabel: 'Concluído',
      statusBackgroundColor: Color(0xFFEEE0CA),
      statusTextColor: Color(0xFF5A3515),
      actions: [
        ServicoActionData(
          label: 'Recibo',
          icon: Icons.receipt_long_outlined,
          type: ServicoActionType.recibo,
        ),
        ServicoActionData(
          label: 'Ver Detalhes',
          icon: Icons.calendar_month_outlined,
          type: ServicoActionType.verDetalhes,
        ),
      ],
    ),
    ServicoData(
      category: ServicosTab.concluidos,
      clientName: 'Patrícia Lima',
      orderLabel: 'OS-053',
      orderNumber: '053',
      startDate: '07/11/2023',
      lastNotification: '09/11/2023',
      pieceLabel: 'Tapete Oriental,\nR\$ 62,00',
      statusLabel: 'Entregue',
      statusBackgroundColor: Color(0xFF8A4F18),
      statusTextColor: Colors.white,
      actions: [
        ServicoActionData(
          label: 'Recibo',
          icon: Icons.receipt_long_outlined,
          type: ServicoActionType.recibo,
        ),
        ServicoActionData(
          label: 'Ver Detalhes',
          icon: Icons.calendar_month_outlined,
          type: ServicoActionType.verDetalhes,
        ),
      ],
    ),
    ServicoData(
      category: ServicosTab.concluidos,
      clientName: 'Carlos Mendonça',
      orderLabel: 'OS-054',
      orderNumber: '054',
      startDate: '10/11/2023',
      lastNotification: '13/11/2023',
      pieceLabel: 'Tapeçaria Nobre,\nR\$ 120,00',
      statusLabel: 'Finalizado e pago',
      statusBackgroundColor: Color(0xFFC78D2F),
      statusTextColor: Colors.white,
      actions: [
        ServicoActionData(
          label: 'Recibo',
          icon: Icons.receipt_long_outlined,
          type: ServicoActionType.recibo,
        ),
      ],
    ),
  ];
}
