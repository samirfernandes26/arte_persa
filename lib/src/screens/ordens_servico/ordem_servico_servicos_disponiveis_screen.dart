import 'package:arte_persa/src/core/ui/widgets/buttons/cadastro_action_buttons/cadastro_action_buttons.dart';
import 'package:arte_persa/src/core/ui/widgets/components/cadastro_form_panel/cadastro_form_panel.dart';
import 'package:arte_persa/src/core/ui/widgets/components/painel_background_scaffold/painel_background_scaffold.dart';
import 'package:arte_persa/src/core/ui/widgets/components/painel_page_scaffold/painel_page_scaffold.dart';
import 'package:arte_persa/src/core/ui/widgets/headers/ordem_servico_flow_header/ordem_servico_flow_header.dart';
import 'package:arte_persa/src/core/ui/widgets/tile/ordem_servico_option_tile/ordem_servico_option_tile.dart';
import 'package:arte_persa/src/screens/ordens_servico/ordem_servico_draft.dart';
import 'package:arte_persa/src/screens/ordens_servico/ordem_servico_mock_data.dart';
import 'package:arte_persa/src/screens/ordens_servico/ordem_servico_resumo_screen.dart';
import 'package:arte_persa/src/screens/painel/painel_navigation.dart';
import 'package:arte_persa/src/screens/painel/painel_session.dart';
import 'package:flutter/material.dart';

class OrdemServicoServicosDisponiveisScreen extends StatefulWidget {
  const OrdemServicoServicosDisponiveisScreen({
    super.key,
    required this.draft,
  });

  final OrdemServicoDraft draft;

  @override
  State<OrdemServicoServicosDisponiveisScreen> createState() =>
      _OrdemServicoServicosDisponiveisScreenState();
}

class _OrdemServicoServicosDisponiveisScreenState
    extends State<OrdemServicoServicosDisponiveisScreen> {
  late final Future<String> _usernameFuture;
  late final Set<String> _selectedServices;
  late final TextEditingController _restaurarController;
  late final TextEditingController _custoController;

  @override
  void initState() {
    super.initState();
    _usernameFuture = PainelSession.loadUsername();
    _selectedServices = widget.draft.selectedServices.isEmpty
        ? {
            'Lavagem Industrial',
            'Lavagem Especial',
            'Lavagem Padrão',
          }
        : Set<String>.from(widget.draft.selectedServices);
    _restaurarController = TextEditingController(
      text: _formatMoney(widget.draft.restaurarValue),
    );
    _custoController = TextEditingController(
      text: _formatMoney(_computedCost()),
    );
  }

  @override
  void dispose() {
    _restaurarController.dispose();
    _custoController.dispose();
    super.dispose();
  }

  double _computedCost() {
    final servicesTotal = OrdemServicoMockData.availableServices
        .where((service) => _selectedServices.contains(service.label))
        .fold<double>(0, (sum, item) => sum + item.price);
    final restore = double.tryParse(
          _restaurarController.text.replaceAll('R\$', '').replaceAll(',', '.'),
        ) ??
        0;
    return servicesTotal + restore;
  }

  void _toggleService(String label, bool selected) {
    setState(() {
      if (selected) {
        _selectedServices.add(label);
      } else {
        _selectedServices.remove(label);
      }
      _custoController.text = _formatMoney(_computedCost());
    });
  }

  void _goNext() {
    final restore = double.tryParse(
          _restaurarController.text.replaceAll('R\$', '').replaceAll(',', '.'),
        ) ??
        0;
    final total = double.tryParse(
          _custoController.text.replaceAll('R\$', '').replaceAll(',', '.'),
        ) ??
        _computedCost();

    final draft = widget.draft.copyWith(
      selectedServices: _selectedServices,
      restaurarValue: restore,
      custoValue: total,
    );

    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => OrdemServicoResumoScreen(draft: draft),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: _usernameFuture,
      builder: (context, snapshot) {
        final username = snapshot.data ?? 'Visitante';

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
                  title: 'Serviços Disponíveis',
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      for (final option
                          in OrdemServicoMockData.availableServices)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: OrdemServicoOptionTile(
                            label: option.label,
                            selected: _selectedServices.contains(option.label),
                            onChanged: (selected) =>
                                _toggleService(option.label, selected),
                          ),
                        ),
                      const SizedBox(height: 6),
                      _ValueRow(
                        label: 'Restaurar',
                        controller: _restaurarController,
                      ),
                      const SizedBox(height: 12),
                      _ValueRow(
                        label: 'Custo',
                        controller: _custoController,
                      ),
                      const SizedBox(height: 26),
                      CadastroActionButtons(
                        secondaryLabel: 'Voltar',
                        primaryLabel: 'Próximo',
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

class _ValueRow extends StatelessWidget {
  const _ValueRow({
    required this.label,
    required this.controller,
  });

  final String label;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.96),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: const Color(0xFFCBAE8D),
          width: 1.2,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(width: 12),
          const Text(
            'R\$.',
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(width: 8),
          SizedBox(
            width: 86,
            child: TextField(
              controller: controller,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                isDense: true,
                filled: true,
                fillColor: const Color(0xFFF2E7DA),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                    color: Color(0xFFCBAE8D),
                    width: 1.0,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

String _formatMoney(double value) {
  return value.toStringAsFixed(2).replaceAll('.', ',');
}
