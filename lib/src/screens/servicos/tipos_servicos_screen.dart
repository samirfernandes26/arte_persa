import 'package:arte_persa/src/core/ui/widgets/cards/tipo_servico_card/tipo_servico_card.dart';
import 'package:arte_persa/src/core/ui/widgets/components/painel_background_scaffold/painel_background_scaffold.dart';
import 'package:arte_persa/src/core/ui/widgets/components/painel_page_scaffold/painel_page_scaffold.dart';
import 'package:arte_persa/src/core/ui/widgets/components/painel_styles/painel_styles.dart';
import 'package:arte_persa/src/core/ui/widgets/headers/painel_brand_header/painel_brand_header.dart';
import 'package:arte_persa/src/core/ui/widgets/search/painel_search_field/painel_search_field.dart';
import 'package:arte_persa/src/screens/painel/painel_navigation.dart';
import 'package:arte_persa/src/screens/painel/painel_session.dart';
import 'package:arte_persa/src/screens/servicos/cadastro_tipo_servico_screen.dart';
import 'package:arte_persa/src/screens/servicos/tipos_servicos_mock_data.dart';
import 'package:flutter/material.dart';

class TiposServicosScreen extends StatefulWidget {
  const TiposServicosScreen({super.key});

  @override
  State<TiposServicosScreen> createState() => _TiposServicosScreenState();
}

class _TiposServicosScreenState extends State<TiposServicosScreen> {
  late final Future<String> _usernameFuture;
  late final TextEditingController _searchController;
  late final List<TipoServicoData> _services;

  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _usernameFuture = PainelSession.loadUsername();
    _searchController = TextEditingController();
    _services = List<TipoServicoData>.from(TiposServicosMockData.services);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<TipoServicoData> _filteredServices() {
    final query = _searchQuery.trim().toLowerCase();
    if (query.isEmpty) {
      return _services;
    }

    return _services.where((service) {
      final searchable = [
        service.name,
        service.description,
        service.category.label,
        service.calcType.label,
      ].join(' ').toLowerCase();
      return searchable.contains(query);
    }).toList();
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  Future<void> _openCreateScreen() async {
    await Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => const CadastroTipoServicoScreen(),
      ),
    );
  }

  Future<void> _openEditScreen(TipoServicoData service) async {
    await Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => CadastroTipoServicoScreen(initialData: service),
      ),
    );
  }

  void _deleteService(TipoServicoData service) {
    setState(() {
      _services.removeWhere((item) => item.id == service.id);
    });

    _showMessage('${service.name.replaceAll('\n', ' ')} removido da lista.');
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
          floatingActionButton: Padding(
            padding: const EdgeInsets.only(bottom: 8, right: 4),
            child: _FloatingAddButton(onTap: _openCreateScreen),
          ),
          body: PainelBackgroundScaffold(
            maxWidth: 720,
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 112),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                PainelBrandHeader(username: username),
                const SizedBox(height: 10),
                Text(
                  'Lista de Serviços',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        fontSize: 34,
                        color: PainelStyles.accentDark,
                        fontWeight: FontWeight.w400,
                      ),
                ),
                const SizedBox(height: 22),
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
                const SizedBox(height: 18),
                if (services.isEmpty)
                  _EmptyTiposServicosState(query: _searchQuery)
                else ...[
                  for (final service in services) ...[
                    TipoServicoCard(
                      data: service,
                      onEditTap: () => _openEditScreen(service),
                      onDeleteTap: () => _deleteService(service),
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

class _FloatingAddButton extends StatelessWidget {
  const _FloatingAddButton({
    required this.onTap,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(22),
        child: Container(
          width: 76,
          height: 76,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFFE2BC70),
                Color(0xFFD0A34C),
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFFC79A52).withValues(alpha: 0.30),
                blurRadius: 18,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: const Center(
            child: Text(
              '+',
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.w300,
                height: 1,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _EmptyTiposServicosState extends StatelessWidget {
  const _EmptyTiposServicosState({
    required this.query,
  });

  final String query;

  @override
  Widget build(BuildContext context) {
    final description = query.trim().isEmpty
        ? 'Nenhum serviço cadastrado foi encontrado.'
        : 'Nenhum serviço cadastrado corresponde à busca "$query".';

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
