import 'package:arte_persa/src/screens/autenticacao/autenticacao_screen_state.dart';
import 'package:arte_persa/src/screens/autenticacao/autenticacao_screen_vm.dart';
import 'package:arte_persa/src/screens/autenticacao/widgets/widgets.dart';
import 'package:arte_persa/src/shared/infra/routes/route_generator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

  void _showUnavailableMessage(String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
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

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: const Color(0xFFF6F0E8),
        systemNavigationBarDividerColor: Colors.transparent,
      ),
      child: Scaffold(
        backgroundColor: AuthStyles.backgroundColor,
        body: AuthBackgroundScaffold(
          child: Column(
            children: [
              const AuthBrandHeader(title: 'Boas-vindas'),
              const SizedBox(height: 28),
              AuthCard(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      AuthInputField(
                        controller: _usuarioController,
                        hintText: 'E-mail',
                        icon: Icons.email_outlined,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'E-mail é obrigatório';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 14),
                      AuthInputField(
                        controller: _senhaController,
                        hintText: 'Senha',
                        icon: Icons.key_outlined,
                        obscureText: !autenticacaoState.showPassword,
                        suffixIcon: IconButton(
                          onPressed: autenticacaoVm.toogleShowPassword,
                          icon: Icon(
                            autenticacaoState.showPassword
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            color: AuthStyles.fieldBorderColor,
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Senha é obrigatória';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 18),
                      AuthPrimaryButton(
                        label: 'Entrar',
                        isLoading: autenticacaoState.status ==
                            AutenticacaoScreenStatus.loading,
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
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 36),
              AuthTextAction(
                label: 'Esqueceu a senha?',
                onTap: () {
                  _showUnavailableMessage(
                    'Recuperação de senha ainda não disponível.',
                  );
                },
              ),
              const SizedBox(height: 18),
              AuthTextAction(
                label: 'Criar nova conta',
                onTap: () {
                  _showUnavailableMessage(
                    'Criação de conta ainda não disponível.',
                  );
                },
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}
