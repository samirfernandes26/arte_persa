import 'package:arte_persa/src/pages/cadastro/cadastro_page.dart';
import 'package:arte_persa/src/pages/cadastro_cliente/cadastro_cliente_endereco_page.dart';
import 'package:arte_persa/src/pages/cadastro_cliente/cadastro_cliente_page.dart';
import 'package:arte_persa/src/pages/cadastro_servico/cadastro_servico_page.dart';
import 'package:arte_persa/src/pages/home/home_page.dart';
import 'package:arte_persa/src/pages/login/login_page.dart';
import 'package:arte_persa/src/pages/ordem_de_servico/ordem_de_servico_fatura_page.dart';
import 'package:arte_persa/src/pages/ordem_de_servico/ordem_de_servico_servicos_page.dart';
import 'package:arte_persa/src/pages/ordem_de_servico/ordem_de_servico_observacao_page.dart';
import 'package:arte_persa/src/pages/ordem_de_servico/ordem_de_servico_page.dart';
import 'package:arte_persa/src/pages/servicos/servicos_page.dart';
import 'package:arte_persa/src/pages/splash/splash_page.dart';
// import 'package:arte_persa/src/pages/home/home_page.dart';
// import 'package:arte_persa/src/pages/splash/splash_page.dart';
import 'package:flutter/material.dart';

sealed class RouteGeneratorKeys {
  static const path = '/';
  static const authLogin = '/auth/login';
  static const home = '/home';
  static const cadastrar = '/cadastrar';
  static const cadastroServico = '/cadastroServico';
  static const servicos = '/servicos';
  static const cadastroCliente = '/cadastroCliente';
  static const cadastroClienteEndereco = '/cadastroClienteEndereco';
  static const ordemDeServicoPage = '/ordemDeServicoPage';
  static const ordemDeServicoObservacao = '/ordemDeServicoObservacao';
  static const ordemDeServicoServicosPage = '/OrdemDeServicoServicosPage';
  static const ordemDeServicoFaturaPage = '/ordemDeServicoFaturaPage';
  
}

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteGeneratorKeys.path:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const Splash(),
        );
      case RouteGeneratorKeys.authLogin:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const LoginPage(),
        );
      case RouteGeneratorKeys.cadastrar:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const CadastroPage(),
        );
      case RouteGeneratorKeys.home:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const HomePage(),
        );
      case RouteGeneratorKeys.cadastroServico:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const CadastroServicoPage(),
        );
      case RouteGeneratorKeys.servicos:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const ServicosPage(),
        );

      case RouteGeneratorKeys.cadastroCliente:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const CadastroClientePage(),
        );

      case RouteGeneratorKeys.cadastroClienteEndereco:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const CadastroClienteEnderecoPage(),
        );

      case RouteGeneratorKeys.ordemDeServicoPage:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const OrdemDeServico(),
        );

      case RouteGeneratorKeys.ordemDeServicoObservacao:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const OrdemDeServicoObservacao(),
        );

      case RouteGeneratorKeys.ordemDeServicoServicosPage:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const OrdemDeServicoServicosPage(),
        );

      case RouteGeneratorKeys.ordemDeServicoFaturaPage:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const OrdemDeServicoFaturaPage(),
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
