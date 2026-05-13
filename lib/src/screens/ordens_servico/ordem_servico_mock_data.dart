import 'package:flutter/material.dart';

class OrdemServicoAvailableService {
  const OrdemServicoAvailableService({
    required this.label,
    required this.price,
  });

  final String label;
  final double price;
}

class OrdemServicoPreviewImageData {
  const OrdemServicoPreviewImageData({
    required this.backgroundColor,
    required this.icon,
  });

  final Color backgroundColor;
  final IconData icon;
}

sealed class OrdemServicoMockData {
  static const availableServices = <OrdemServicoAvailableService>[
    OrdemServicoAvailableService(label: 'Lavagem Industrial', price: 140),
    OrdemServicoAvailableService(label: 'Lavagem Especial', price: 110),
    OrdemServicoAvailableService(label: 'Lavagem Padrão', price: 78),
    OrdemServicoAvailableService(label: 'Anti-derrapante', price: 44),
    OrdemServicoAvailableService(label: 'Cordão', price: 35),
    OrdemServicoAvailableService(label: 'Franja Algodão', price: 52),
    OrdemServicoAvailableService(label: 'Franja Lã', price: 68),
    OrdemServicoAvailableService(label: 'Raspagem Revitalização', price: 95),
  ];

  static const paymentMethods = <String>[
    'Pix',
    'Cartão de Crédito',
    'Cartão de Débito',
    'Dinheiro',
    'Transferência',
  ];

  static const previewImages = <OrdemServicoPreviewImageData>[
    OrdemServicoPreviewImageData(
      backgroundColor: Color(0xFFD7C0A1),
      icon: Icons.texture_rounded,
    ),
    OrdemServicoPreviewImageData(
      backgroundColor: Color(0xFFCDAA7C),
      icon: Icons.auto_awesome_mosaic_rounded,
    ),
    OrdemServicoPreviewImageData(
      backgroundColor: Color(0xFFB58B63),
      icon: Icons.design_services_rounded,
    ),
  ];

  static const assinaturaTexto =
      'A oficina de tapetes orientais LTDA confirma que os itens '
      'descritos nesta Ordem de Serviço foram recebidos para avaliação, '
      'limpeza, restauração e demais procedimentos técnicos conforme a '
      'necessidade de cada peça.\n\n'
      'Os tapetes exigem análise individual. Variações de cor, desgaste, '
      'franjas, bordas, fibras naturais e pontos de restauração podem '
      'alterar prazo, custo e resultado estético final.\n\n'
      'Todo tratamento será executado conforme critérios técnicos da '
      'oficina, preservando a integridade do material e registrando as '
      'etapas relevantes da execução.\n\n'
      'Ao assinar, o cliente declara estar ciente das observações, dos '
      'serviços selecionados, dos valores previstos e das condições gerais '
      'da presente Ordem de Serviço.';
}
