import 'package:arte_persa/src/shared/infra/routes/route_generator.dart';
import 'package:flutter/material.dart';

enum PainelDrawerItem {
  inicio,
  servicos,
  clientes,
  agendas,
  perfil,
}

extension PainelDrawerItemExtension on PainelDrawerItem {
  String get label => switch (this) {
        PainelDrawerItem.inicio => 'Início',
        PainelDrawerItem.servicos => 'Serviços',
        PainelDrawerItem.clientes => 'Clientes',
        PainelDrawerItem.agendas => 'Agendas',
        PainelDrawerItem.perfil => 'Perfil',
      };

  IconData get icon => switch (this) {
        PainelDrawerItem.inicio => Icons.home_rounded,
        PainelDrawerItem.servicos => Icons.handyman_outlined,
        PainelDrawerItem.clientes => Icons.groups_2_outlined,
        PainelDrawerItem.agendas => Icons.calendar_month_outlined,
        PainelDrawerItem.perfil => Icons.person_outline_rounded,
      };

  String get routeName => switch (this) {
        PainelDrawerItem.inicio => RouteGeneratorKeys.painel,
        PainelDrawerItem.servicos => RouteGeneratorKeys.servicos,
        PainelDrawerItem.clientes => RouteGeneratorKeys.clientes,
        PainelDrawerItem.agendas => RouteGeneratorKeys.agendas,
        PainelDrawerItem.perfil => RouteGeneratorKeys.perfil,
      };

  String get placeholderDescription => switch (this) {
        PainelDrawerItem.inicio =>
          'A dashboard principal fica disponível nesta área.',
        PainelDrawerItem.servicos =>
          'O módulo de serviços será conectado nas próximas etapas.',
        PainelDrawerItem.clientes =>
          'O módulo de clientes será conectado nas próximas etapas.',
        PainelDrawerItem.agendas =>
          'O módulo de agendas será conectado nas próximas etapas.',
        PainelDrawerItem.perfil =>
          'O módulo de perfil será conectado nas próximas etapas.',
      };
}
