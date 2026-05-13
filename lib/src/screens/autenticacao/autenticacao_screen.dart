import 'dart:ui';

import 'package:arte_persa/src/core/ui/constants/images_constants.dart';
import 'package:arte_persa/src/screens/autenticacao/autenticacao_screen_state.dart';
import 'package:arte_persa/src/screens/autenticacao/autenticacao_screen_vm.dart';
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
        backgroundColor: const Color(0xFFF8F3EC),
        body: Stack(
          fit: StackFit.expand,
          children: [
            const ColoredBox(color: Color(0xFFF8F3EC)),
            Image.asset(
              ImagesConstants.splashBackground,
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            ),
            DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    const Color(0xFFF8F3EC).withValues(alpha: 0.30),
                    const Color(0xFFF8F3EC).withValues(alpha: 0.12),
                    const Color(0xFFF8F3EC).withValues(alpha: 0.26),
                  ],
                ),
              ),
            ),
            Positioned(
              top: -48,
              right: -72,
              child: _SoftShape(
                width: 220,
                height: 160,
                opacity: 0.28,
              ),
            ),
            Positioned(
              top: 280,
              left: -70,
              child: _SoftShape(
                width: 170,
                height: 230,
                opacity: 0.18,
              ),
            ),
            Positioned(
              bottom: -70,
              left: 24,
              child: _SoftShape(
                width: 320,
                height: 220,
                opacity: 0.20,
              ),
            ),
            SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 28,
                  vertical: 18,
                ),
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 520),
                    child: Column(
                      children: [
                        const SizedBox(height: 8),
                        Image.asset(
                          ImagesConstants.logo,
                          width: 250,
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(height: 18),
                        Text(
                          'Boas-vindas',
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge
                              ?.copyWith(
                                fontSize: 42,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                                letterSpacing: -0.8,
                              ),
                        ),
                        const SizedBox(height: 28),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(34),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(34),
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    const Color(
                                      0xFFF1DDC5,
                                    ).withValues(alpha: 0.92),
                                    const Color(
                                      0xFFF5E5D0,
                                    ).withValues(alpha: 0.88),
                                    const Color(
                                      0xFFF1DDC5,
                                    ).withValues(alpha: 0.82),
                                  ],
                                ),
                                border: Border.all(
                                  color: const Color(
                                    0xFFE6D4C0,
                                  ).withValues(alpha: 0.75),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(
                                      0xFFD7B890,
                                    ).withValues(alpha: 0.34),
                                    blurRadius: 30,
                                    offset: const Offset(0, 10),
                                  ),
                                ],
                              ),
                              child: Form(
                                key: _formKey,
                                child: Column(
                                  children: [
                                    _LoginField(
                                      controller: _usuarioController,
                                      hintText: 'E-mail',
                                      icon: Icons.email_outlined,
                                      keyboardType: TextInputType.emailAddress,
                                      validator: (value) {
                                        if (value == null ||
                                            value.trim().isEmpty) {
                                          return 'E-mail é obrigatório';
                                        }
                                        return null;
                                      },
                                    ),
                                    const SizedBox(height: 14),
                                    _LoginField(
                                      controller: _senhaController,
                                      hintText: 'Senha',
                                      icon: Icons.key_outlined,
                                      obscureText:
                                          !autenticacaoState.showPassword,
                                      suffixIcon: IconButton(
                                        onPressed:
                                            autenticacaoVm.toogleShowPassword,
                                        icon: Icon(
                                          autenticacaoState.showPassword
                                              ? Icons.visibility_off_outlined
                                              : Icons.visibility_outlined,
                                          color: const Color(0xFFB9987D),
                                        ),
                                      ),
                                      validator: (value) {
                                        if (value == null ||
                                            value.trim().isEmpty) {
                                          return 'Senha é obrigatória';
                                        }
                                        return null;
                                      },
                                    ),
                                    const SizedBox(height: 18),
                                    _LoginButton(
                                      isLoading: autenticacaoState.status ==
                                          AutenticacaoScreenStatus.loading,
                                      onPressed: autenticacaoState.status ==
                                              AutenticacaoScreenStatus.loading
                                          ? null
                                          : () async {
                                              if (!_formKey.currentState!
                                                  .validate()) {
                                                return;
                                              }

                                              await autenticacaoVm
                                                  .handleSignIn({
                                                'usuario':
                                                    _usuarioController.text,
                                                'senha': _senhaController.text,
                                              });
                                            },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 36),
                        _TextAction(
                          label: 'Esqueceu a senha?',
                          onTap: () {
                            _showUnavailableMessage(
                              'Recuperação de senha ainda não disponível.',
                            );
                          },
                        ),
                        const SizedBox(height: 18),
                        _TextAction(
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LoginField extends StatelessWidget {
  const _LoginField({
    required this.controller,
    required this.hintText,
    required this.icon,
    required this.validator,
    this.keyboardType,
    this.obscureText = false,
    this.suffixIcon,
  });

  final TextEditingController controller;
  final String hintText;
  final IconData icon;
  final String? Function(String?) validator;
  final TextInputType? keyboardType;
  final bool obscureText;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    const borderColor = Color(0xFFC9A98D);
    const hintColor = Color(0xFF9E978F);

    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: const BorderSide(color: borderColor, width: 1.4),
    );

    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      validator: validator,
      style: const TextStyle(
        fontSize: 16,
        color: Color(0xFF4C2E18),
      ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          color: hintColor,
          fontSize: 17,
          fontWeight: FontWeight.w400,
        ),
        prefixIcon: Icon(icon, color: borderColor, size: 24),
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: Colors.white.withValues(alpha: 0.88),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 15,
        ),
        enabledBorder: border,
        focusedBorder: border.copyWith(
          borderSide: const BorderSide(color: borderColor, width: 1.8),
        ),
        errorBorder: border.copyWith(
          borderSide: const BorderSide(color: Color(0xFFC24E4E), width: 1.4),
        ),
        focusedErrorBorder: border.copyWith(
          borderSide: const BorderSide(color: Color(0xFFC24E4E), width: 1.8),
        ),
      ),
    );
  }
}

class _LoginButton extends StatelessWidget {
  const _LoginButton({
    required this.onPressed,
    required this.isLoading,
  });

  final VoidCallback? onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Color(0xFF8A4814),
            Color(0xFFA55A1B),
            Color(0xFF8A4814),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF8A4814).withValues(alpha: 0.28),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(30),
          child: SizedBox(
            width: double.infinity,
            height: 66,
            child: Center(
              child: isLoading
                  ? const SizedBox(
                      height: 22,
                      width: 22,
                      child: CircularProgressIndicator(
                        strokeWidth: 2.4,
                        color: Colors.white,
                      ),
                    )
                  : const Text(
                      'Entrar',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}

class _TextAction extends StatelessWidget {
  const _TextAction({
    required this.label,
    required this.onTap,
  });

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(24),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Color(0xFF754621),
            fontSize: 25,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}

class _SoftShape extends StatelessWidget {
  const _SoftShape({
    required this.width,
    required this.height,
    required this.opacity,
  });

  final double width;
  final double height;
  final double opacity;

  @override
  Widget build(BuildContext context) {
    return ImageFiltered(
      imageFilter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: const Color(0xFFF3EADF).withValues(alpha: opacity),
          borderRadius: BorderRadius.circular(999),
        ),
      ),
    );
  }
}
