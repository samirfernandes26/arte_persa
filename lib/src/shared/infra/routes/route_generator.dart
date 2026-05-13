import 'package:arte_persa/src/screens/autenticacao/autenticacao_screen.dart';
import 'package:arte_persa/src/screens/clientes/clientes_screen.dart';
import 'package:arte_persa/src/screens/painel/painel_navigation.dart';
import 'package:arte_persa/src/screens/painel/painel_placeholder_screen.dart';
import 'package:arte_persa/src/screens/painel/painel_screen.dart';
import 'package:arte_persa/src/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';

sealed class RouteGeneratorKeys {
  static const path = '/';
  static const authLogin = '/auth/login';
  static const painel = '/painel';
  static const servicos = '/painel/servicos';
  static const clientes = '/painel/clientes';
  static const agendas = '/painel/agendas';
  static const perfil = '/painel/perfil';
}

sealed class RouteGenerator {
  static MaterialPageRoute<T> _materialPageRoute<T>(
    RouteSettings settings,
    Widget widget,
  ) {
    return MaterialPageRoute<T>(
      settings: settings,
      builder: (_) => widget,
    );
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteGeneratorKeys.path:
        return _materialPageRoute(settings, const SplashScreen());
      case RouteGeneratorKeys.authLogin:
        return _materialPageRoute(settings, const AutenticacaoScreen());
      case RouteGeneratorKeys.painel:
        return _materialPageRoute(settings, const PainelScreen());
      case RouteGeneratorKeys.servicos:
        return _materialPageRoute(
          settings,
          const PainelPlaceholderScreen(item: PainelDrawerItem.servicos),
        );
      case RouteGeneratorKeys.clientes:
        return _materialPageRoute(settings, const ClientesScreen());
      case RouteGeneratorKeys.agendas:
        return _materialPageRoute(
          settings,
          const PainelPlaceholderScreen(item: PainelDrawerItem.agendas),
        );
      case RouteGeneratorKeys.perfil:
        return _materialPageRoute(
          settings,
          const PainelPlaceholderScreen(item: PainelDrawerItem.perfil),
        );
      default:
        return _errorRoute(settings);
    }
  }

  static Route<dynamic> _errorRoute(RouteSettings settings) {
    return MaterialPageRoute<void>(
      settings: settings,
      builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Página não encontrada'),
            centerTitle: true,
          ),
          body: const Center(
            child: Text('A rota solicitada não existe neste app.'),
          ),
        );
      },
    );
  }
}
