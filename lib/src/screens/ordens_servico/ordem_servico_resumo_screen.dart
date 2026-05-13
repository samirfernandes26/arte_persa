import 'package:arte_persa/src/core/ui/widgets/buttons/cadastro_action_buttons/cadastro_action_buttons.dart';
import 'package:arte_persa/src/core/ui/widgets/cards/ordem_servico_summary_item_card/ordem_servico_summary_item_card.dart';
import 'package:arte_persa/src/core/ui/widgets/components/cadastro_form_panel/cadastro_form_panel.dart';
import 'package:arte_persa/src/core/ui/widgets/components/painel_background_scaffold/painel_background_scaffold.dart';
import 'package:arte_persa/src/core/ui/widgets/components/painel_page_scaffold/painel_page_scaffold.dart';
import 'package:arte_persa/src/core/ui/widgets/forms/fields/cadastro_select_field/cadastro_select_field.dart';
import 'package:arte_persa/src/core/ui/widgets/headers/ordem_servico_flow_header/ordem_servico_flow_header.dart';
import 'package:arte_persa/src/screens/ordens_servico/ordem_servico_assinatura_screen.dart';
import 'package:arte_persa/src/screens/ordens_servico/ordem_servico_draft.dart';
import 'package:arte_persa/src/screens/ordens_servico/ordem_servico_mock_data.dart';
import 'package:arte_persa/src/screens/painel/painel_navigation.dart';
import 'package:arte_persa/src/screens/painel/painel_session.dart';
import 'package:flutter/material.dart';

class OrdemServicoResumoScreen extends StatefulWidget {
  const OrdemServicoResumoScreen({
    super.key,
    required this.draft,
  });

  final OrdemServicoDraft draft;

  @override
  State<OrdemServicoResumoScreen> createState() =>
      _OrdemServicoResumoScreenState();
}

class _OrdemServicoResumoScreenState extends State<OrdemServicoResumoScreen> {
  late final Future<String> _usernameFuture;
  late String? _selectedPaymentMethod;

  @override
  void initState() {
    super.initState();
    _usernameFuture = PainelSession.loadUsername();
    _selectedPaymentMethod =
        widget.draft.paymentMethod.isEmpty ? null : widget.draft.paymentMethod;
  }

  double get _subtotal => widget.draft.custoValue;

  double get _discount => _subtotal * 0.20;

  double get _advance => (_subtotal - _discount) * 0.25;

  double get _total => _subtotal - _discount;

  void _goNext() {
    final draft = widget.draft.copyWith(
      paymentMethod: _selectedPaymentMethod ?? '',
    );

    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => OrdemServicoAssinaturaScreen(draft: draft),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: _usernameFuture,
      builder: (context, snapshot) {
        final username = snapshot.data ?? 'Visitante';
        final selectedServices = OrdemServicoMockData.availableServices
            .where((service) =>
                widget.draft.selectedServices.contains(service.label))
            .toList();

        return PainelPageScaffold(
          selectedItem: PainelDrawerItem.servicos,
          username: username,
          showDrawerButton: false,
          body: PainelBackgroundScaffold(
            maxWidth: 660,
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                OrdemServicoFlowHeader(
                  onBackTap: () => Navigator.of(context).pop(),
                ),
                const SizedBox(height: 12),
                CadastroFormPanel(
                  title: 'Resumo da OS',
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      OrdemServicoSummaryItemCard(
                        title: widget.draft.serviceTypeName.isEmpty
                            ? 'Babilônico'
                            : widget.draft.serviceTypeName,
                        subtitle: widget.draft.itemName.isEmpty
                            ? 'Tapete Babilônico'
                            : widget.draft.itemName,
                        quantityLabel: 'x2',
                        imageData: OrdemServicoMockData.previewImages[0],
                      ),
                      const SizedBox(height: 18),
                      OrdemServicoSummaryItemCard(
                        title: widget.draft.itemName.isEmpty
                            ? 'Tapete Persa'
                            : widget.draft.itemName,
                        subtitle: widget.draft.clientName.isEmpty
                            ? 'Tapete Persa'
                            : widget.draft.clientName,
                        quantityLabel: 'x2',
                        imageData: OrdemServicoMockData.previewImages[1],
                      ),
                      const SizedBox(height: 18),
                      const Divider(),
                      const SizedBox(height: 10),
                      _ResumoRow(
                        label: 'Sub-total',
                        value: _money(_subtotal),
                        large: true,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        widget.draft.itemName.isEmpty
                            ? 'Tapete Babilônico'
                            : widget.draft.itemName,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        selectedServices.isEmpty
                            ? 'Sem serviços adicionais selecionados.'
                            : selectedServices
                                .map((service) => '- ${service.label}')
                                .join('\n'),
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                          height: 1.2,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          _money(widget.draft.restaurarValue),
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black87,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(height: 18),
                      const Divider(),
                      const SizedBox(height: 10),
                      _ResumoRow(
                        label: 'Sub-total',
                        value: _money(_subtotal),
                        large: true,
                      ),
                      const SizedBox(height: 8),
                      _ResumoRow(
                        label: 'Desconto',
                        value: '20%',
                      ),
                      const SizedBox(height: 8),
                      _ResumoRow(
                        label: 'Avante pagamento',
                        value: _money(_advance),
                      ),
                      const SizedBox(height: 12),
                      _ResumoRow(
                        label: 'Total',
                        value: _money(_total),
                        veryLarge: true,
                      ),
                      const SizedBox(height: 18),
                      CadastroSelectField<String>(
                        value: _selectedPaymentMethod,
                        hintText: 'Forma de pagamento',
                        onChanged: (value) {
                          setState(() {
                            _selectedPaymentMethod = value;
                          });
                        },
                        items: OrdemServicoMockData.paymentMethods
                            .map(
                              (method) => DropdownMenuItem(
                                value: method,
                                child: Text(method),
                              ),
                            )
                            .toList(),
                      ),
                      const SizedBox(height: 24),
                      CadastroActionButtons(
                        secondaryLabel: 'Voltar',
                        primaryLabel: 'Finalizar',
                        onSecondaryTap: () => Navigator.of(context).pop(),
                        onPrimaryTap: _goNext,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _ResumoRow extends StatelessWidget {
  const _ResumoRow({
    required this.label,
    required this.value,
    this.large = false,
    this.veryLarge = false,
  });

  final String label;
  final String value;
  final bool large;
  final bool veryLarge;

  @override
  Widget build(BuildContext context) {
    final fontSize = veryLarge
        ? 22.0
        : large
            ? 18.0
            : 16.5;

    final weight = veryLarge || large ? FontWeight.w700 : FontWeight.w600;

    return Row(
      children: [
        Expanded(
          child: Text(
            label,
            style: TextStyle(
              fontSize: fontSize,
              color: Colors.black,
              fontWeight: weight,
            ),
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: fontSize,
            color: const Color(0xFF6D4722),
            fontWeight: weight,
          ),
        ),
      ],
    );
  }
}

String _money(double value) {
  return 'R\$ ${value.toStringAsFixed(2).replaceAll('.', ',')}';
}
