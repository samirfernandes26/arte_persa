import 'package:flutter/material.dart';

class PainelMetricData {
  const PainelMetricData({
    required this.label,
    required this.value,
    required this.backgroundColor,
  });

  final String label;
  final String value;
  final Color backgroundColor;
}

class PainelActionData {
  const PainelActionData({
    required this.type,
    required this.label,
    required this.icon,
    required this.backgroundColor,
  });

  final PainelActionType type;
  final String label;
  final IconData icon;
  final Color backgroundColor;
}

enum PainelActionType {
  novoServico,
  cadastroClientes,
  meusClientes,
  agendamentos,
  cadastroColaborador,
  controleFinanceiro,
}

class PainelAppointmentData {
  const PainelAppointmentData({
    required this.clientName,
    required this.scheduleText,
    required this.serviceTitle,
    required this.serviceSubtitle,
  });

  final String clientName;
  final String scheduleText;
  final String serviceTitle;
  final String serviceSubtitle;
}

sealed class PainelMockData {
  static const metrics = <PainelMetricData>[
    PainelMetricData(
      label: 'Total de Clientes',
      value: '128',
      backgroundColor: Color(0xFFE9D1B0),
    ),
    PainelMetricData(
      label: 'Serviços Hoje',
      value: '15',
      backgroundColor: Color(0xFFF7F0E6),
    ),
    PainelMetricData(
      label: 'Receita',
      value: 'R\$ 5,200',
      backgroundColor: Color(0xFFF9F2E6),
    ),
  ];

  static const actions = <PainelActionData>[
    PainelActionData(
      type: PainelActionType.novoServico,
      label: 'Novo\nserviço',
      icon: Icons.add_circle_outline_rounded,
      backgroundColor: Color(0xFFF8F0D7),
    ),
    PainelActionData(
      type: PainelActionType.cadastroClientes,
      label: 'Cadastro de\nclientes',
      icon: Icons.person_add_alt_1_outlined,
      backgroundColor: Color(0xFFFFFFFF),
    ),
    PainelActionData(
      type: PainelActionType.meusClientes,
      label: 'Meus\nclientes',
      icon: Icons.groups_2_outlined,
      backgroundColor: Color(0xFFE2D8C8),
    ),
    PainelActionData(
      type: PainelActionType.agendamentos,
      label: 'Agendamentos',
      icon: Icons.event_outlined,
      backgroundColor: Color(0xFFE7DDD0),
    ),
    PainelActionData(
      type: PainelActionType.cadastroColaborador,
      label: 'Cadastro de\ncolaborador',
      icon: Icons.group_add_outlined,
      backgroundColor: Color(0xFFF7F0D7),
    ),
    PainelActionData(
      type: PainelActionType.controleFinanceiro,
      label: 'Controle\nFinanceiro',
      icon: Icons.account_balance_wallet_outlined,
      backgroundColor: Color(0xFFE8CBA5),
    ),
  ];

  static const appointments = <PainelAppointmentData>[
    PainelAppointmentData(
      clientName: 'David Eftekhari',
      scheduleText: '23/06/2024, 18:00',
      serviceTitle: 'Toixo',
      serviceSubtitle: 'Serviço',
    ),
    PainelAppointmentData(
      clientName: 'Marora Eftekhari',
      scheduleText: '23/06/2024, 19:00',
      serviceTitle: 'Toixo',
      serviceSubtitle: 'Serviço',
    ),
    PainelAppointmentData(
      clientName: 'Samajia Eftekhari',
      scheduleText: '24/06/2024, 09:30',
      serviceTitle: 'Toixo',
      serviceSubtitle: 'Serviço',
    ),
  ];
}
