import 'dart:async';
import 'package:arte_persa/src/core/providers/application_providers.dart';

import 'package:arte_persa/src/core/ui/widgets/drawer/custom_drawer.dart';
import 'package:arte_persa/src/routes/route_generator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final formKey = GlobalKey<FormBuilderState>();

  Future<void> buscarCoordenadasPorEndereco() async {
    try {
      final repository = ref.read(convertAddressesRepositoryProvider);
      final response = await repository.convertAddressesToGeolocation(
        endereco:
            "Rua Leandro Martins Costa, 89, Limoeiro, Caratinga, MG, 3530-010, Brasil",
      );
      final batata = '';
    } catch (e) {
      // Trate qualquer outro tipo de erro que possa ocorrer
      print("Ocorreu um erro inesperado: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(currentPage: 0),
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(
                RouteGeneratorKeys.ordemDeServicoPage,
              );
            },
            icon: const Icon(
              Icons.assignment_add,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications_none,
              color: Colors.white,
              size: 24,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              IconButton(
                onPressed: () async {
                  await buscarCoordenadasPorEndereco();
                },
                icon: const Icon(
                  Icons.build_circle_outlined,
                  color: Colors.white,
                  size: 124,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
