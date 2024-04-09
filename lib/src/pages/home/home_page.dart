import 'dart:async';
import 'dart:io';

import 'package:arte_persa/src/core/ui/constants.dart';
import 'package:arte_persa/src/core/ui/widgets/buttons/buttons.dart';
import 'package:arte_persa/src/core/ui/widgets/drawer/custom_drawer.dart';
import 'package:arte_persa/src/model/cliente_model.dart';
import 'package:arte_persa/src/model/endereco_model.dart';
import 'package:arte_persa/src/routes/route_generator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part './components.dart';

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
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 32),
          child: Column(
            children: [
              const SizedBox(
                height: 64,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                    child: Text(
                      'Samir Frenandes Lima',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 32,
                        height: 32,
                        child: Image.asset(
                          ImagesConstants.whatsapp,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      const Text(
                        '(33) 99928-8234',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Row(
                    children: [
                      Icon(
                        Icons.phone,
                        color: Colors.white,
                        size: 32,
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Text(
                        '(33) 97128-8421',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  const Text(
                    'Endereço',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  _renderLabel(
                    titulo: 'Estado:',
                    conteudo: 'Minas Gerais',
                  ),
                  _renderLabel(
                    titulo: 'Cidade:',
                    conteudo: 'Belo Horizonte',
                  ),
                  _renderLabel(
                    titulo: 'Bairro:',
                    conteudo: 'Centro',
                  ),
                  _renderLabel(
                    titulo: 'Logradoro:',
                    conteudo: 'Rua Sergipe',
                  ),
                  _renderLabel(
                    titulo: 'Numéro:',
                    conteudo: '1334',
                  ),
                  _renderLabel(
                    titulo: 'Complemento:',
                    conteudo: 'loja',
                  ),
                  _renderLabel(
                    titulo: 'Referência:',
                    conteudo: 'Proxima à avenida do contorno',
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  const Text(
                    'Detalhes',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  _renderLabel(
                    titulo: 'Cpf/Cnpj:',
                    conteudo: '119.317.836-32',
                  ),
                  _renderLabel(
                    titulo: 'Procurar por:',
                    conteudo: 'Bruna Lima',
                  ),
                  _renderLabel(
                    titulo: 'Informações adicionais:',
                    conteudo: 'Só aceita entraga entre 12:00 e 19:00',
                  ),
                  const SizedBox(
                    height: 16,
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
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          const Expanded(
                            child: Text(
                              'Avaliações',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                              ),
                            ),
                          ),
                          Avaliacao(
                            desable: true,
                            initialValue: 1,
                            onChanged: (value) {},
                          ),
                          const Text(
                            '(1)',
                            style: TextStyle(
                              color: Colors.amber,
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  SizedBox(
                    height: 300,
                    child: GoogleMap(
                      initialCameraPosition: const CameraPosition(
                        target: LatLng(
                          -19.9381385,
                          -43.9384428,
                        ),
                        zoom: 16,
                      ),
                      // Passa o conjunto de marcadores para o GoogleMap
                      markers: {
                        const Marker(
                          markerId: MarkerId('meu_marcador'),
                          position: LatLng(-19.9381385, -43.9384428),
                          infoWindow: InfoWindow(
                            title: 'Endereço de Samir',
                            snippet: '',
                          ),
                          // (Opcional) Usa um ícone personalizado para o marcador
                          // icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet),
                        ),
                      },

                      onMapCreated: (GoogleMapController controller) async {
                        String mapStyle = await rootBundle
                            .loadString('assets/map_style.json');
                        controller.setMapStyle(mapStyle);
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 64,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
