import 'package:arte_persa/src/screens/autenticacao/autenticacao_screen_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final autenticacaoScreenVmProvider =
    StateNotifierProvider<AutenticacaoScreenVm, AutenticacaoScreenState>((ref) {
  return AutenticacaoScreenVm();
});

class AutenticacaoScreenVm extends StateNotifier<AutenticacaoScreenState> {
  AutenticacaoScreenVm() : super(const AutenticacaoScreenState.initial());

  static const _loggedInKey = 'session.logged_in';
  static const _usernameKey = 'session.username';

  void toogleShowPassword() {
    state = state.copyWith(showPassword: !state.showPassword);
  }

  Future<void> handleSignIn(Map<String, dynamic> form) async {
    final usuario = (form['usuario'] ?? '').toString().trim();
    final senha = (form['senha'] ?? '').toString().trim();

    if (usuario.isEmpty || senha.isEmpty) {
      state = state.copyWith(
        status: AutenticacaoScreenStatus.error,
        message: 'Informe usuário e senha para continuar.',
      );
      return;
    }

    state = state.copyWith(
      status: AutenticacaoScreenStatus.loading,
      message: null,
    );

    final preferences = await SharedPreferences.getInstance();
    await preferences.setBool(_loggedInKey, true);
    await preferences.setString(_usernameKey, usuario);

    state = state.copyWith(
      status: AutenticacaoScreenStatus.success,
      message: 'Login realizado com sucesso.',
    );
  }
}
