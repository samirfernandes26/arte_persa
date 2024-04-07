import 'dart:async';
import 'package:arte_persa/src/core/providers/application_providers.dart';

import 'package:arte_persa/src/core/ui/widgets/drawer/custom_drawer.dart';
import 'package:arte_persa/src/model/cliente_model.dart';
import 'package:arte_persa/src/model/endereco_model.dart';
import 'package:arte_persa/src/routes/route_generator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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

  Future<void> testes() async {
    try {
      List<ClienteModel> clientes = [];
      FirebaseFirestore fireStore = FirebaseFirestore.instance;
      final collectionCliente = fireStore.collection('clientes');
      QuerySnapshot<Map<String, dynamic>> snapshotCliente =
          await collectionCliente.get();

      for (var docCliente in snapshotCliente.docs) {
        ClienteModel cliente = ClienteModel.fromJson(docCliente.data());

        QuerySnapshot<Map<String, dynamic>> snapshotEndereco =
            await docCliente.reference.collection('enderecos').limit(1).get();

        if (snapshotEndereco.docs.isNotEmpty) {
          EnderecoModel endereco =
              EnderecoModel.fromJson(snapshotEndereco.docs.first.data());
          cliente.endereco = endereco;
        }

        clientes.add(cliente);
      }

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
            children: [
              Center(
                child: IconButton(
                  onPressed: () async {
                    await testes();
                  },
                  icon: const Icon(
                    Icons.adb_outlined,
                    color: Colors.white,
                    size: 124,
                  ),
                ),
              ),
              const SizedBox(
                height: 64,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade600,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 3,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(16),
                child: Expanded(
                  child: Row(
                    children: [
                      Text(
                        'titulo',
                        style: TextStyle(
                          color: Colors.grey.shade900,
                          fontWeight: FontWeight.w900,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      const Text(
                        'conteudo',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
