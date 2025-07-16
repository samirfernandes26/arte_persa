import 'package:flutter/material.dart';

sealed class RouteGeneratorKeys {
  static const path = '/';
  static const home = '/home';
  static const mapa = '/mapa';
}

sealed class RouteGenerator {
  static MaterialPageRoute _materialPageRoute<T>(
    RouteSettings settings,
    Widget widget,
  ) => MaterialPageRoute<T>(settings: settings, builder: (_) => widget);

  static Route generateRoute<T>(RouteSettings settings) {
    switch (settings.name) {
      case RouteGeneratorKeys.path:
        return _errorRoute(); //_materialPageRoute<T>(settings, const SplashScreen());
      case RouteGeneratorKeys.home:
        return _errorRoute(); //_materialPageRoute(settings, const HomeScreen());

      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute<T>() {
    return MaterialPageRoute<T>(
      builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Página não encontrada'),
            centerTitle: true,
          ),
          body: const Center(child: Text('Página não encontrada')),
        );
      },
    );
  }
}
