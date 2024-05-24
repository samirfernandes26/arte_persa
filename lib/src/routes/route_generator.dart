// Flutter Framework
import 'package:arte_persa/src/pages/cadastro_pf/cadastro_pf_endereco_page.dart';
import 'package:arte_persa/src/pages/cadastro_pf/cadastro_pf_page.dart';
import 'package:arte_persa/src/pages/cadastro_pj/cadastro_pj_endereco_page.dart';
import 'package:flutter/material.dart';

// Páginas de Autenticação e Inicialização
import 'package:arte_persa/src/pages/login/login_page.dart';
import 'package:arte_persa/src/pages/splash/splash_page.dart';

// Páginas de Cadastro
import 'package:arte_persa/src/pages/cadastro_co/cadastro_co_page.dart';
import 'package:arte_persa/src/pages/cadastro_servico/cadastro_servico_page.dart';

// Página Principal
import 'package:arte_persa/src/pages/home/home_page.dart';

// Páginas de Serviços e Ordem de Serviço
import 'package:arte_persa/src/pages/servicos/servicos_page.dart';
import 'package:arte_persa/src/pages/ordem_de_servico/ordem_de_servico_page.dart';
import 'package:arte_persa/src/pages/ordem_de_servico/ordem_de_servico_fatura_page.dart';
import 'package:arte_persa/src/pages/ordem_de_servico/ordem_de_servico_servicos_page.dart';
import 'package:arte_persa/src/pages/ordem_de_servico/ordem_de_servico_observacao_page.dart';
import 'package:arte_persa/src/pages/ordem_de_servico/ordem_de_servico_termo_assinatura.dart';

// Páginas de Visualização
import 'package:arte_persa/src/pages/visulizar_ordem_de_servico/visulizar_ordem_de_servico.dart';

sealed class RouteGeneratorKeys {
  static const path = '/';
  static const authLogin = '/auth/login';
  static const home = '/home';
  static const cadastrar = '/cadastrar';
  static const cadastroServico = '/cadastroServico';
  static const servicos = '/servicos';
  static const cadastroClientePf = '/cadastroClientePf';
  static const cadastroClientePj = '/cadastroClientePj';
  static const cadastroEnderecoPf = '/cadastroEnderecoPf';
  static const cadastroEnderecoPj = '/cadastroEnderecoPj';
  static const ordemDeServicoPage = '/ordemDeServicoPage';
  static const ordemDeServicoObservacao = '/ordemDeServicoObservacao';
  static const ordemDeServicoServicosPage = '/OrdemDeServicoServicosPage';
  static const ordemDeServicoFaturaPage = '/ordemDeServicoFaturaPage';
  static const ordemDeServicoTermoAssinatura = '/ordemDeServicoTermoAssinatura';
  static const visulizarOrdemDeServico = '/visulizarOrdemDeServico';
  static const visulizarCliente = '/visulizarCliente';
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
          builder: (context) => const CadastroCoPage(),
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

      case RouteGeneratorKeys.cadastroClientePf:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const CadastroPfPage(),
        );

      case RouteGeneratorKeys.cadastroClientePj:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const CadastroPfPage(),
        );

      case RouteGeneratorKeys.cadastroEnderecoPf:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const CadastroPfEnderecoPage(),
        );

      case RouteGeneratorKeys.cadastroEnderecoPj:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const CadastroPjEnderecoPage(),
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

      case RouteGeneratorKeys.ordemDeServicoTermoAssinatura:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const OrdemDeServicoTermoAssinatura(),
        );

      case RouteGeneratorKeys.visulizarOrdemDeServico:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const VisulizarOrdemDeServico(),
        );

      // case RouteGeneratorKeys.visulizarCliente:
      //   return MaterialPageRoute(
      //     settings: settings,
      //     builder: (context) => const vizualizarClientePage(),
      //   );

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
