import 'package:arte_persa/src/screens/autenticacao/autenticacao_screen_state.dart';
import 'package:arte_persa/src/screens/autenticacao/autenticacao_screen_vm.dart';
import 'package:arte_persa/src/shared/infra/routes/route_generator.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AutenticacaoScreen extends ConsumerStatefulWidget {
  const AutenticacaoScreen({super.key});

  @override
  ConsumerState<AutenticacaoScreen> createState() => _AutenticacaoScreenState();
}

class _AutenticacaoScreenState extends ConsumerState<AutenticacaoScreen> {
  final _formKey = GlobalKey<FormState>();
  final _usuarioController = TextEditingController();
  final _senhaController = TextEditingController();

  @override
  void dispose() {
    _usuarioController.dispose();
    _senhaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final autenticacaoState = ref.watch(autenticacaoScreenVmProvider);
    final autenticacaoVm = ref.read(autenticacaoScreenVmProvider.notifier);

    ref.listen<AutenticacaoScreenState>(autenticacaoScreenVmProvider, (
      _,
      state,
    ) {
      if (state.status == AutenticacaoScreenStatus.error &&
          state.message != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(state.message!)),
        );
      }

      if (state.status == AutenticacaoScreenStatus.success) {
        Navigator.of(context).pushNamedAndRemoveUntil(
          RouteGeneratorKeys.painel,
          (_) => false,
        );
      }
    });

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF0D1F33),
              Color(0xFF24486D),
              Color(0xFFE7D2A6),
            ],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 420),
                child: Card(
                  elevation: 12,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Entrar',
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium
                                ?.copyWith(fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Use qualquer usuário e senha para acessar o ambiente local.',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          const SizedBox(height: 24),
                          TextFormField(
                            controller: _usuarioController,
                            decoration: const InputDecoration(
                              labelText: 'Usuário',
                              hintText: 'Digite seu usuário',
                            ),
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Usuário é obrigatório';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 16),
                          TextFormField(
                            controller: _senhaController,
                            obscureText: !autenticacaoState.showPassword,
                            decoration: InputDecoration(
                              labelText: 'Senha',
                              hintText: 'Digite sua senha',
                              suffixIcon: IconButton(
                                onPressed: autenticacaoVm.toogleShowPassword,
                                icon: Icon(
                                  autenticacaoState.showPassword
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                ),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Senha é obrigatória';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 24),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: autenticacaoState.status ==
                                      AutenticacaoScreenStatus.loading
                                  ? null
                                  : () async {
                                      if (!_formKey.currentState!.validate()) {
                                        return;
                                      }

                                      await autenticacaoVm.handleSignIn({
                                        'usuario': _usuarioController.text,
                                        'senha': _senhaController.text,
                                      });
                                    },
                              child: autenticacaoState.status ==
                                      AutenticacaoScreenStatus.loading
                                  ? const SizedBox(
                                      height: 20,
                                      width: 20,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                        color: Colors.white,
                                      ),
                                    )
                                  : const Text('Acessar'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
