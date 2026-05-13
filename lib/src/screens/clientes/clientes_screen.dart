import 'package:arte_persa/src/core/ui/widgets/buttons/clientes_type_toggle/clientes_type_toggle.dart';
import 'package:arte_persa/src/core/ui/widgets/cards/clientes_card/clientes_card.dart';
import 'package:arte_persa/src/core/ui/widgets/components/painel_background_scaffold/painel_background_scaffold.dart';
import 'package:arte_persa/src/core/ui/widgets/components/painel_page_scaffold/painel_page_scaffold.dart';
import 'package:arte_persa/src/core/ui/widgets/components/painel_styles/painel_styles.dart';
import 'package:arte_persa/src/core/ui/widgets/headers/clientes_overview_header/clientes_overview_header.dart';
import 'package:arte_persa/src/core/ui/widgets/search/clientes_search_field/clientes_search_field.dart';
import 'package:arte_persa/src/screens/clientes/clientes_mock_data.dart';
import 'package:arte_persa/src/screens/painel/painel_navigation.dart';
import 'package:arte_persa/src/screens/painel/painel_session.dart';
import 'package:arte_persa/src/shared/infra/routes/route_generator.dart';
import 'package:flutter/material.dart';

class ClientesScreen extends StatefulWidget {
  const ClientesScreen({super.key});

  @override
  State<ClientesScreen> createState() => _ClientesScreenState();
}

class _ClientesScreenState extends State<ClientesScreen> {
  late final Future<String> _usernameFuture;
  late final TextEditingController _searchController;

  ClienteCategory _selectedCategory = ClienteCategory.pessoaFisica;
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

  List<ClienteData> _filteredClientes() {
    final normalizedQuery = _searchQuery.trim().toLowerCase();

    return ClientesMockData.clientes.where((cliente) {
      if (cliente.category != _selectedCategory) {
        return false;
      }

      if (normalizedQuery.isEmpty) {
        return true;
      }

      final searchableText = [
        cliente.name,
        cliente.email,
        cliente.phone,
        cliente.location,
        cliente.statusLabel,
        cliente.idLabel,
      ].join(' ').toLowerCase();

      return searchableText.contains(normalizedQuery);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: _usernameFuture,
      builder: (context, snapshot) {
        final username = snapshot.data ?? 'Visitante';
        final clientes = _filteredClientes();

        return PainelPageScaffold(
          selectedItem: PainelDrawerItem.clientes,
          username: username,
          showDrawerButton: false,
          body: PainelBackgroundScaffold(
            maxWidth: 680,
            padding: const EdgeInsets.fromLTRB(14, 16, 14, 28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ClientesOverviewHeader(
                  username: username,
                  onCreateTap: () {
                    Navigator.of(context).pushNamed(
                      RouteGeneratorKeys.cadastroCliente,
                    );
                  },
                ),
                const SizedBox(height: 20),
                ClientesSearchField(
                  controller: _searchController,
                  hintText: 'Pesquisar clientes',
                  onChanged: (value) {
                    setState(() {
                      _searchQuery = value;
                    });
                  },
                ),
                const SizedBox(height: 16),
                ClientesTypeToggle(
                  selectedCategory: _selectedCategory,
                  onChanged: (category) {
                    setState(() {
                      _selectedCategory = category;
                    });
                  },
                ),
                const SizedBox(height: 20),
                if (clientes.isEmpty)
                  _ClientesEmptyState(
                    category: _selectedCategory,
                    query: _searchQuery,
                  )
                else ...[
                  for (final cliente in clientes) ...[
                    ClientesCard(
                      data: cliente,
                      onNewServiceTap: () {
                        _showMessage(
                          'Nova OS para ${cliente.name} ainda não disponível.',
                        );
                      },
                      onProfileTap: () {
                        _showMessage(
                          'Perfil de ${cliente.name} ainda não disponível.',
                        );
                      },
                      onContactTap: () {
                        _showMessage(
                          'Contato rápido de ${cliente.name} ainda não disponível.',
                        );
                      },
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

class _ClientesEmptyState extends StatelessWidget {
  const _ClientesEmptyState({
    required this.category,
    required this.query,
  });

  final ClienteCategory category;
  final String query;

  @override
  Widget build(BuildContext context) {
    final categoryLabel = category == ClienteCategory.pessoaFisica
        ? 'Pessoa Física'
        : 'Pessoa Jurídica';

    final description = query.trim().isEmpty
        ? 'Nenhum cliente de $categoryLabel foi encontrado nesta lista.'
        : 'Nenhum cliente de $categoryLabel corresponde à busca "$query".';

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
            'Nenhum cliente encontrado',
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
