import 'package:arte_persa/src/core/ui/widgets/buttons/painel_add_action_button/painel_add_action_button.dart';
import 'package:arte_persa/src/core/ui/widgets/buttons/painel_two_state_toggle/painel_two_state_toggle.dart';
import 'package:arte_persa/src/core/ui/widgets/cards/servicos_card/servicos_card.dart';
import 'package:arte_persa/src/core/ui/widgets/components/painel_background_scaffold/painel_background_scaffold.dart';
import 'package:arte_persa/src/core/ui/widgets/components/painel_page_scaffold/painel_page_scaffold.dart';
import 'package:arte_persa/src/core/ui/widgets/components/painel_styles/painel_styles.dart';
import 'package:arte_persa/src/core/ui/widgets/headers/painel_brand_header/painel_brand_header.dart';
import 'package:arte_persa/src/core/ui/widgets/search/painel_search_field/painel_search_field.dart';
import 'package:arte_persa/src/screens/ordens_servico/nova_ordem_servico_item_screen.dart';
import 'package:arte_persa/src/screens/painel/painel_navigation.dart';
import 'package:arte_persa/src/screens/painel/painel_session.dart';
import 'package:arte_persa/src/screens/servicos/servicos_mock_data.dart';
import 'package:flutter/material.dart';

class ServicosScreen extends StatefulWidget {
  const ServicosScreen({super.key});

  @override
  State<ServicosScreen> createState() => _ServicosScreenState();
}

class _ServicosScreenState extends State<ServicosScreen> {
  late final Future<String> _usernameFuture;
  late final TextEditingController _searchController;

  ServicosTab _selectedTab = ServicosTab.pendentes;
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _usernameFuture = PainelSession.loadUsername();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  List<ServicoData> _filteredServices() {
    final query = _searchQuery.trim().toLowerCase();

    return ServicosMockData.services.where((service) {
      if (service.category != _selectedTab) {
        return false;
      }

      if (query.isEmpty) {
        return true;
      }

      final searchable = [
        service.clientName,
        service.orderLabel,
        service.orderNumber,
        service.pieceLabel,
        service.statusLabel,
        service.startDate,
        service.lastNotification,
      ].join(' ').toLowerCase();

      return searchable.contains(query);
    }).toList();
  }

  void _handleAction(ServicoActionData action, ServicoData service) {
    switch (action.type) {
      case ServicoActionType.aprovar:
        _showMessage(
            'Aprovação de ${service.orderLabel} ainda não disponível.');
      case ServicoActionType.acompanhar:
        _showMessage(
          'Acompanhamento de ${service.orderLabel} ainda não disponível.',
        );
      case ServicoActionType.verDetalhes:
        _showMessage(
            'Detalhes de ${service.orderLabel} ainda não disponíveis.');
      case ServicoActionType.faturar:
        _showMessage(
            'Faturamento de ${service.orderLabel} ainda não disponível.');
      case ServicoActionType.confirmar:
        _showMessage(
            'Confirmação de ${service.orderLabel} ainda não disponível.');
      case ServicoActionType.recibo:
        _showMessage('Recibo de ${service.orderLabel} ainda não disponível.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: _usernameFuture,
      builder: (context, snapshot) {
        final username = snapshot.data ?? 'Visitante';
        final services = _filteredServices();

        return PainelPageScaffold(
          selectedItem: PainelDrawerItem.servicos,
          username: username,
          showDrawerButton: false,
          body: PainelBackgroundScaffold(
            maxWidth: 700,
            padding: const EdgeInsets.fromLTRB(14, 16, 14, 28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                PainelBrandHeader(
                  username: username,
                  leading: PainelAddActionButton(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute<void>(
                          builder: (_) => const NovaOrdemServicoItemScreen(),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 18),
                PainelSearchField(
                  controller: _searchController,
                  hintText: 'Pesquisar serviços',
                  iconAlignment: PainelSearchIconAlignment.trailing,
                  onChanged: (value) {
                    setState(() {
                      _searchQuery = value;
                    });
                  },
                ),
                const SizedBox(height: 16),
                PainelTwoStateToggle(
                  firstLabel: 'Pendentes',
                  secondLabel: 'Concluídos',
                  selectedIndex: _selectedTab == ServicosTab.pendentes ? 0 : 1,
                  onChanged: (index) {
                    setState(() {
                      _selectedTab = index == 0
                          ? ServicosTab.pendentes
                          : ServicosTab.concluidos;
                    });
                  },
                ),
                const SizedBox(height: 20),
                if (services.isEmpty)
                  _ServicosEmptyState(tab: _selectedTab, query: _searchQuery)
                else ...[
                  for (final service in services) ...[
                    ServicosCard(
                      data: service,
                      onActionTap: (action) => _handleAction(action, service),
                    ),
                    const SizedBox(height: 18),
                  ],
                ],
              ],
            ),
          ),
        );
      },
    );
  }
}

class _ServicosEmptyState extends StatelessWidget {
  const _ServicosEmptyState({
    required this.tab,
    required this.query,
  });

  final ServicosTab tab;
  final String query;

  @override
  Widget build(BuildContext context) {
    final tabLabel = tab == ServicosTab.pendentes ? 'pendentes' : 'concluídos';
    final description = query.trim().isEmpty
        ? 'Nenhum serviço $tabLabel foi encontrado nesta lista.'
        : 'Nenhum serviço $tabLabel corresponde à busca "$query".';

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.90),
        borderRadius: BorderRadius.circular(28),
        border: Border.all(
          color: PainelStyles.borderColor.withValues(alpha: 0.75),
        ),
        boxShadow: [
          BoxShadow(
            color: PainelStyles.shadowColor.withValues(alpha: 0.20),
            blurRadius: 24,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          const Icon(
            Icons.search_off_rounded,
            size: 40,
            color: PainelStyles.accentDark,
          ),
          const SizedBox(height: 14),
          Text(
            'Nenhum serviço encontrado',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: PainelStyles.textPrimary,
                  fontWeight: FontWeight.w700,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: PainelStyles.textSecondary,
                  height: 1.4,
                ),
          ),
        ],
      ),
    );
  }
}
