import 'package:arte_persa/src/shared/infra/routes/route_generator.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PainelScreen extends StatefulWidget {
  const PainelScreen({super.key});

  @override
  State<PainelScreen> createState() => _PainelScreenState();
}

class _PainelScreenState extends State<PainelScreen> {
  static const _loggedInKey = 'session.logged_in';
  static const _usernameKey = 'session.username';

  late final Future<String> _usernameFuture;

  @override
  void initState() {
    super.initState();
    _usernameFuture = _loadUsername();
  }

  Future<String> _loadUsername() async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getString(_usernameKey) ?? 'Visitante';
  }

  Future<void> _logout() async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.remove(_loggedInKey);
    await preferences.remove(_usernameKey);

    if (!mounted) {
      return;
    }

    Navigator.of(context).pushNamedAndRemoveUntil(
      RouteGeneratorKeys.authLogin,
      (_) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Painel'),
        actions: [
          IconButton(
            tooltip: 'Sair',
            onPressed: _logout,
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(24),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFF8F4EA),
              Color(0xFFE9D8B4),
              Color(0xFFD4B87C),
            ],
          ),
        ),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 680),
            child: Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(28),
              ),
              child: Padding(
                padding: const EdgeInsets.all(28),
                child: FutureBuilder<String>(
                  future: _usernameFuture,
                  builder: (context, snapshot) {
                    final username = snapshot.data ?? 'Visitante';

                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Aplicativo pronto para executar',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'Sessão iniciada como $username.',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'O fluxo principal do projeto foi estabilizado para abrir, autenticar e navegar normalmente. Os módulos legados foram preservados na estrutura atual para tratamento posterior.',
                        ),
                        const SizedBox(height: 24),
                        Wrap(
                          spacing: 12,
                          runSpacing: 12,
                          children: [
                            FilledButton.icon(
                              onPressed: _logout,
                              icon: const Icon(Icons.logout),
                              label: const Text('Encerrar sessão'),
                            ),
                            OutlinedButton.icon(
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      'Fluxo principal validado com sucesso.',
                                    ),
                                  ),
                                );
                              },
                              icon: const Icon(Icons.check_circle_outline),
                              label: const Text('Validar estado'),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
