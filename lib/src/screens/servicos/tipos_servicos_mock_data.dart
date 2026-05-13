import 'package:flutter/material.dart';

enum TipoCalculoServico {
  metroQuadrado('m²'),
  metro('metro'),
  fixo('fixo');

  const TipoCalculoServico(this.label);
  final String label;
}

enum CategoriaServicoTipo {
  tapete('Tapete'),
  estofado('Estofado'),
  restauracao('Restauração');

  const CategoriaServicoTipo(this.label);
  final String label;
}

class TipoServicoData {
  const TipoServicoData({
    required this.id,
    required this.name,
    required this.description,
    required this.calcType,
    required this.category,
    required this.basePrice,
    required this.extraPrice,
    required this.allowMasterDiscount,
    required this.icon,
  });

  final String id;
  final String name;
  final String description;
  final TipoCalculoServico calcType;
  final CategoriaServicoTipo category;
  final double basePrice;
  final double extraPrice;
  final bool allowMasterDiscount;
  final IconData icon;

  String get displayPrice {
    switch (calcType) {
      case TipoCalculoServico.metroQuadrado:
        return 'R\$ ${_formatPrice(basePrice)} / m²';
      case TipoCalculoServico.metro:
        return 'R\$ ${_formatPrice(basePrice)} / metro';
      case TipoCalculoServico.fixo:
        return 'R\$ ${_formatPrice(basePrice)} (fixo)';
    }
  }

  TipoServicoData copyWith({
    String? id,
    String? name,
    String? description,
    TipoCalculoServico? calcType,
    CategoriaServicoTipo? category,
    double? basePrice,
    double? extraPrice,
    bool? allowMasterDiscount,
    IconData? icon,
  }) {
    return TipoServicoData(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      calcType: calcType ?? this.calcType,
      category: category ?? this.category,
      basePrice: basePrice ?? this.basePrice,
      extraPrice: extraPrice ?? this.extraPrice,
      allowMasterDiscount: allowMasterDiscount ?? this.allowMasterDiscount,
      icon: icon ?? this.icon,
    );
  }
}

String _formatPrice(double value) {
  final normalized = value.toStringAsFixed(2);
  return normalized.replaceAll('.', ',');
}

sealed class TiposServicosMockData {
  static final services = <TipoServicoData>[
    const TipoServicoData(
      id: '1',
      name: 'Limpeza Profunda\nTapete Persa',
      description: 'Lavagem especializada com finalização delicada.',
      calcType: TipoCalculoServico.metroQuadrado,
      category: CategoriaServicoTipo.tapete,
      basePrice: 450,
      extraPrice: 380,
      allowMasterDiscount: true,
      icon: Icons.cleaning_services_outlined,
    ),
    const TipoServicoData(
      id: '2',
      name: 'Restauração de\nFranja',
      description: 'Restauração manual de franja e acabamento refinado.',
      calcType: TipoCalculoServico.metro,
      category: CategoriaServicoTipo.restauracao,
      basePrice: 120,
      extraPrice: 95,
      allowMasterDiscount: false,
      icon: Icons.content_cut_outlined,
    ),
    const TipoServicoData(
      id: '3',
      name: 'Lavagem de\nEstofado',
      description: 'Higienização profunda para peças de estofado.',
      calcType: TipoCalculoServico.fixo,
      category: CategoriaServicoTipo.estofado,
      basePrice: 380,
      extraPrice: 320,
      allowMasterDiscount: true,
      icon: Icons.weekend_outlined,
    ),
  ];
}
