import 'package:flutter/material.dart';

enum ClienteCategory {
  pessoaFisica,
  pessoaJuridica,
}

class ClientePalette {
  const ClientePalette({
    required this.headerGradient,
    required this.statusGradient,
    required this.textColor,
    required this.statusTextColor,
    required this.iconBackgroundColor,
    required this.iconColor,
    required this.borderColor,
  });

  final List<Color> headerGradient;
  final List<Color> statusGradient;
  final Color textColor;
  final Color statusTextColor;
  final Color iconBackgroundColor;
  final Color iconColor;
  final Color borderColor;
}

class ClienteData {
  const ClienteData({
    required this.idLabel,
    required this.category,
    required this.name,
    required this.phone,
    required this.email,
    required this.totalServicesLabel,
    required this.averageSpendLabel,
    required this.location,
    required this.statusLabel,
    required this.palette,
  });

  final String idLabel;
  final ClienteCategory category;
  final String name;
  final String phone;
  final String email;
  final String totalServicesLabel;
  final String averageSpendLabel;
  final String location;
  final String statusLabel;
  final ClientePalette palette;
}

sealed class ClientesMockData {
  static const goldPalette = ClientePalette(
    headerGradient: [
      Color(0xFFF6E8D1),
      Color(0xFFE5C28A),
    ],
    statusGradient: [
      Color(0xFFBA8D25),
      Color(0xFFD2A74A),
    ],
    textColor: Color(0xFF27180E),
    statusTextColor: Colors.white,
    iconBackgroundColor: Color(0xFFD1AA63),
    iconColor: Color(0xFF7A4A1E),
    borderColor: Color(0xFFC8A470),
  );

  static const darkPalette = ClientePalette(
    headerGradient: [
      Color(0xFF51260D),
      Color(0xFF2F150A),
    ],
    statusGradient: [
      Color(0xFF5C2D10),
      Color(0xFF35170A),
    ],
    textColor: Colors.white,
    statusTextColor: Colors.white,
    iconBackgroundColor: Color(0xFF6F3B14),
    iconColor: Colors.white,
    borderColor: Color(0xFF8B603E),
  );

  static const softPalette = ClientePalette(
    headerGradient: [
      Color(0xFFF9F1E5),
      Color(0xFFEFD4AE),
    ],
    statusGradient: [
      Color(0xFFF5E4C7),
      Color(0xFFECC891),
    ],
    textColor: Color(0xFF241710),
    statusTextColor: Color(0xFF2B1B12),
    iconBackgroundColor: Color(0xFFF0D7AE),
    iconColor: Color(0xFF88501E),
    borderColor: Color(0xFFD4BB99),
  );

  static const clientes = <ClienteData>[
    ClienteData(
      idLabel: '043',
      category: ClienteCategory.pessoaFisica,
      name: 'Carlos Mendonça',
      phone: '(21) 98877-6655',
      email: 'carlos.m@provedor.com',
      totalServicesLabel: '8 Serviços',
      averageSpendLabel: 'R\$ 1.500,00',
      location: 'Ipanema, RJ',
      statusLabel: 'Cliente VIP',
      palette: goldPalette,
    ),
    ClienteData(
      idLabel: '044',
      category: ClienteCategory.pessoaFisica,
      name: 'Juliana Ferreira',
      phone: '(11) 97766-5544',
      email: 'juliana.f@mail.co',
      totalServicesLabel: '3 Serviços',
      averageSpendLabel: 'R\$ 900,00',
      location: 'Jardins, SP',
      statusLabel: 'Cliente Regular',
      palette: goldPalette,
    ),
    ClienteData(
      idLabel: '045',
      category: ClienteCategory.pessoaFisica,
      name: 'Marcos Oliveira',
      phone: '(19) 96655-4433',
      email: 'm.oliveira@uol.co',
      totalServicesLabel: '15 Serviços',
      averageSpendLabel: 'R\$ 3.200,00',
      location: 'Cambuí, Campinas',
      statusLabel: 'Cliente Inativo',
      palette: darkPalette,
    ),
    ClienteData(
      idLabel: '046',
      category: ClienteCategory.pessoaFisica,
      name: 'Patrícia Lima',
      phone: '(31) 95544-3322',
      email: 'p.lima@ig.co',
      totalServicesLabel: '1 Serviço',
      averageSpendLabel: 'R\$ 500,00',
      location: 'Lourdes, BH',
      statusLabel: 'Novo Cliente',
      palette: softPalette,
    ),
    ClienteData(
      idLabel: '081',
      category: ClienteCategory.pessoaJuridica,
      name: 'Ateliê Persa Design',
      phone: '(21) 4002-8899',
      email: 'contato@ateliepersa.com.br',
      totalServicesLabel: '23 Serviços',
      averageSpendLabel: 'R\$ 4.800,00',
      location: 'Leblon, RJ',
      statusLabel: 'Conta Premium',
      palette: goldPalette,
    ),
    ClienteData(
      idLabel: '082',
      category: ClienteCategory.pessoaJuridica,
      name: 'Cambuí Arquitetura Ltda',
      phone: '(19) 3251-7711',
      email: 'comercial@cambuiarq.com.br',
      totalServicesLabel: '11 Serviços',
      averageSpendLabel: 'R\$ 2.900,00',
      location: 'Cambuí, Campinas',
      statusLabel: 'Cliente Corporativo',
      palette: darkPalette,
    ),
    ClienteData(
      idLabel: '083',
      category: ClienteCategory.pessoaJuridica,
      name: 'Eventos Jardins Co.',
      phone: '(11) 3380-2290',
      email: 'agenda@eventosjardins.co',
      totalServicesLabel: '6 Serviços',
      averageSpendLabel: 'R\$ 1.750,00',
      location: 'Jardins, SP',
      statusLabel: 'Nova Conta',
      palette: softPalette,
    ),
  ];
}
