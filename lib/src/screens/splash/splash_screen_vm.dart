import 'package:shared_preferences/shared_preferences.dart';

enum SplashState { auth, logged }

class SplashScreenVm {
  static const _loggedInKey = 'session.logged_in';

  Future<SplashState> loadInitialState() async {
    await Future<void>.delayed(const Duration(milliseconds: 900));

    final preferences = await SharedPreferences.getInstance();
    final isLoggedIn = preferences.getBool(_loggedInKey) ?? false;

    return isLoggedIn ? SplashState.logged : SplashState.auth;
  }
}
