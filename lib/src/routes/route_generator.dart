import 'package:arte_persa/src/pages/login/login_page.dart';
// import 'package:arte_persa/src/pages/home/home_page.dart';
// import 'package:arte_persa/src/pages/splash/splash_page.dart';
import 'package:flutter/material.dart';

sealed class RouteGeneratorKeys {
  static const path = '/';
  static const authLogin = '/auth/login';
  static const home = '/home';
}

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
    case RouteGeneratorKeys.authLogin:
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => const LoginPage(),
      );
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Página não encontrada'),
          centerTitle: true,
        ),
        body: const Center(
          child: Text('Página não encontrada'),
        ),
      );
    });
  }
}
