import 'package:arte_persa/src/core/ui/widgets/cards/painel_action_card/painel_action_card.dart';
import 'package:arte_persa/src/core/ui/widgets/cards/painel_schedule_card/painel_schedule_card.dart';
import 'package:arte_persa/src/core/ui/widgets/components/painel_background_scaffold/painel_background_scaffold.dart';
import 'package:arte_persa/src/core/ui/widgets/components/painel_page_scaffold/painel_page_scaffold.dart';
import 'package:arte_persa/src/core/ui/widgets/components/painel_styles/painel_styles.dart';
import 'package:arte_persa/src/core/ui/widgets/headers/painel_overview_header/painel_overview_header.dart';
import 'package:arte_persa/src/screens/ordens_servico/nova_ordem_servico_item_screen.dart';
import 'package:arte_persa/src/screens/painel/painel_mock_data.dart';
import 'package:arte_persa/src/screens/painel/painel_navigation.dart';
import 'package:arte_persa/src/screens/painel/painel_session.dart';
import 'package:arte_persa/src/shared/infra/routes/route_generator.dart';
import 'package:flutter/material.dart';

class PainelScreen extends StatefulWidget {
  const PainelScreen({super.key});

  @override
  State<PainelScreen> createState() => _PainelScreenState();
}

class _PainelScreenState extends State<PainelScreen> {
  late final Future<String> _usernameFuture;

  @override
  void initState() {
    super.initState();
    _usernameFuture = PainelSession.loadUsername();
  }

  void _showUnavailableMessage(String label) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$label ainda não está disponível nesta versão.'),
      ),
    );
  }

  void _handleActionTap(PainelActionData action) {
    switch (action.type) {
      case PainelActionType.novoServico:
        Navigator.of(context).push(
          MaterialPageRoute<void>(
            builder: (_) => const NovaOrdemServicoItemScreen(),
          ),
        );
      case PainelActionType.cadastroClientes:
        Navigator.of(context).pushNamed(RouteGeneratorKeys.cadastroCliente);
      case PainelActionType.meusClientes:
        Navigator.of(context).pushNamed(RouteGeneratorKeys.clientes);
      case PainelActionType.cadastroColaborador:
        Navigator.of(context).pushNamed(RouteGeneratorKeys.cadastroColaborador);
      default:
        _showUnavailableMessage(action.label.replaceAll('\n', ' '));
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: _usernameFuture,
      builder: (context, snapshot) {
        final username = snapshot.data ?? 'Visitante';

        return PainelPageScaffold(
          selectedItem: PainelDrawerItem.inicio,
          username: username,
          body: PainelBackgroundScaffold(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PainelOverviewHeader(
                  username: username,
                  metrics: PainelMockData.metrics,
                ),
                const SizedBox(height: 22),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: PainelMockData.actions.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 14,
                    mainAxisSpacing: 14,
                    childAspectRatio: 0.78,
                  ),
                  itemBuilder: (context, index) {
                    final action = PainelMockData.actions[index];

                    return PainelActionCard(
                      data: action,
                      onTap: () => _handleActionTap(action),
                    );
                  },
                ),
                const SizedBox(height: 28),
                Text(
                  'Próximos Agendamentos',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w800,
                        color: PainelStyles.textPrimary,
                      ),
                ),
                const SizedBox(height: 14),
                for (final appointment in PainelMockData.appointments) ...[
                  PainelScheduleCard(data: appointment),
                  const SizedBox(height: 12),
                ],
              ],
            ),
          ),
        );
      },
    );
  }
}
