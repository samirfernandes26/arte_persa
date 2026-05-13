class OrdemServicoDraft {
  const OrdemServicoDraft({
    this.clientName = '',
    this.clientItemLabel = '',
    this.serviceTypeName = '',
    this.itemName = '',
    this.comprimento = '',
    this.largura = '',
    this.observacaoProducao = '',
    this.observacaoTecnicaUm = '',
    this.observacaoTecnicaDois = '',
    this.selectedServices = const <String>{},
    this.restaurarValue = 0,
    this.custoValue = 0,
    this.paymentMethod = '',
  });

  final String clientName;
  final String clientItemLabel;
  final String serviceTypeName;
  final String itemName;
  final String comprimento;
  final String largura;
  final String observacaoProducao;
  final String observacaoTecnicaUm;
  final String observacaoTecnicaDois;
  final Set<String> selectedServices;
  final double restaurarValue;
  final double custoValue;
  final String paymentMethod;

  OrdemServicoDraft copyWith({
    String? clientName,
    String? clientItemLabel,
    String? serviceTypeName,
    String? itemName,
    String? comprimento,
    String? largura,
    String? observacaoProducao,
    String? observacaoTecnicaUm,
    String? observacaoTecnicaDois,
    Set<String>? selectedServices,
    double? restaurarValue,
    double? custoValue,
    String? paymentMethod,
  }) {
    return OrdemServicoDraft(
      clientName: clientName ?? this.clientName,
      clientItemLabel: clientItemLabel ?? this.clientItemLabel,
      serviceTypeName: serviceTypeName ?? this.serviceTypeName,
      itemName: itemName ?? this.itemName,
      comprimento: comprimento ?? this.comprimento,
      largura: largura ?? this.largura,
      observacaoProducao: observacaoProducao ?? this.observacaoProducao,
      observacaoTecnicaUm: observacaoTecnicaUm ?? this.observacaoTecnicaUm,
      observacaoTecnicaDois:
          observacaoTecnicaDois ?? this.observacaoTecnicaDois,
      selectedServices: selectedServices ?? this.selectedServices,
      restaurarValue: restaurarValue ?? this.restaurarValue,
      custoValue: custoValue ?? this.custoValue,
      paymentMethod: paymentMethod ?? this.paymentMethod,
    );
  }
}
