import 'dart:io';

import 'package:arte_persa/src/core/ui/widgets/drawer/custom_drawer.dart';
import 'package:arte_persa/src/routes/route_generator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part './components.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final formKey = GlobalKey<FormBuilderState>();

  // Future<void> testes() async {
  //   List<ClienteModel> clientes = [];
  //   FirebaseFirestore fireStore = FirebaseFirestore.instance;
  //   final collectionCliente = fireStore.collection('clientes');
  //   QuerySnapshot<Map<String, dynamic>> snapshotCliente =
  //       await collectionCliente.get();

  //   for (var docCliente in snapshotCliente.docs) {
  //     ClienteModel cliente = ClienteModel.fromJson(docCliente.data());

  //     QuerySnapshot<Map<String, dynamic>> snapshotEndereco =
  //         await docCliente.reference.collection('enderecos').limit(1).get();

  //     if (snapshotEndereco.docs.isNotEmpty) {
  //       EnderecoModel endereco =
  //           EnderecoModel.fromJson(snapshotEndereco.docs.first.data());
  //       cliente.endereco = endereco;
  //     }

  //     clientes.add(cliente);
  //   }
  // }

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
            onPressed: () {
              Navigator.of(context).pushNamed(
                RouteGeneratorKeys.visulizarCliente,
                arguments: {
                  'id': 'YsauVJUpzBSjCmX9nHdc',
                },
              );
            },
            icon: const Icon(
              Icons.notifications_none,
              color: Colors.white,
              size: 24,
            ),
          )
        ],
      ),
      body: const Column(
        children: [],
      ),
    );
  }
}
