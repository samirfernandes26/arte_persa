import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

import 'package:arte_persa/src/core/ui/constants.dart';
import 'package:arte_persa/src/core/ui/helpers/messages.dart';
import 'package:arte_persa/src/core/ui/widgets/buttons/buttons.dart';

import 'package:arte_persa/src/model/cliente_model.dart';

import 'package:arte_persa/src/routes/route_generator.dart';

import 'package:arte_persa/src/pages/vizualizar_cliente/vizualizar_cliente_state.dart';
import 'package:arte_persa/src/pages/vizualizar_cliente/vizualizar_cliente_vm.dart';

part './components.dart';

class vizualizarClientePage extends ConsumerStatefulWidget {
  const vizualizarClientePage({super.key});

  @override
  ConsumerState<vizualizarClientePage> createState() =>
      _vizualizarClientePageState();
}

class _vizualizarClientePageState extends ConsumerState<vizualizarClientePage> {
  @override
  Widget build(BuildContext context) {
    final VisualizarClienteVm(
      :loadData,
    ) = ref.watch(
      visualizarClienteVmProvider.notifier,
    );

    final viewModel = ref.watch(
      visualizarClienteVmProvider,
    );

    ClienteModel? cliente = viewModel.cliente;

    Map<String, dynamic> arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>? ??
            {};

    if (viewModel.status == VisualizarClienteStateStatus.initial ||
        arguments['reload'] == true) {
      Future(
        () async {
          await loadData(arguments);
          arguments['reload'] = false;
        },
      );
    }

    ref.listen(
      visualizarClienteVmProvider,
      (_, state) {
        switch (state.status) {
          case VisualizarClienteStateStatus.initial:
            break;
          case VisualizarClienteStateStatus.loaded:
            break;
          case VisualizarClienteStateStatus.success:
            break;
          case VisualizarClienteStateStatus.error:
            if (state.message != null) {
              Messages.showErrors(state.message!, context);
            }
            Navigator.of(context).pushNamedAndRemoveUntil(
              RouteGeneratorKeys.home,
              (route) => false,
              arguments: {
                'reload': true,
              },
            );
        }
      },
    );

    return PopScope(
      canPop: false,
      onPopInvoked: (canPop) async {
        Navigator.of(context).pushNamedAndRemoveUntil(
          RouteGeneratorKeys.home,
          (route) => false,
          arguments: {
            'reload': true,
          },
        );
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Dados do cliente',
          ),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
            ),
            onPressed: () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                RouteGeneratorKeys.home,
                (route) => false,
              );
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 32),
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        cliente!.tipoCliente! == 2
                            ? cliente.razaoSocial ??
                                'Razão social não encontrado'
                            : cliente.nome ?? 'Nome não encontrado',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 32,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    if (cliente.telefoneContatoUm != null)
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
                          Text(
                            cliente.telefoneContatoUm!,
                            style: const TextStyle(
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
                    if (cliente.telefoneContatoDois != null)
                      Row(
                        children: [
                          const Icon(
                            Icons.phone,
                            color: Colors.white,
                            size: 32,
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Text(
                            cliente.telefoneContatoDois!,
                            style: const TextStyle(
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
                      conteudo: cliente.endereco!.estado ?? 'Não Informado',
                    ),
                    // TODO verificar aqui
                    _renderLabel(
                      titulo: 'Cidade:',
                      conteudo: 'Belo Horizonte',
                    ),
                    _renderLabel(
                      titulo: 'Bairro:',
                      conteudo: cliente.endereco!.bairro ?? 'Não Informado',
                    ),
                    _renderLabel(
                      titulo: 'Logradoro:',
                      conteudo: cliente.endereco!.logradouro ?? 'Não Informado',
                    ),
                    _renderLabel(
                      titulo: 'Numéro:',
                      conteudo: cliente.endereco!.numero ?? 'Não Informado',
                    ),
                    _renderLabel(
                      titulo: 'Complemento:',
                      conteudo:
                          cliente.endereco!.complemento ?? 'Não Informado',
                    ),
                    _renderLabel(
                      titulo: 'Referência:',
                      conteudo: cliente.endereco!.referencia ?? 'Não Informado',
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

                    if (cliente.tipoCliente! == 1)
                      _renderLabel(
                        titulo: 'Cpf:',
                        conteudo: cliente.cpf ?? 'Não Informado',
                      ),

                    if (cliente.tipoCliente! == 2)
                      Column(
                        children: [
                          _renderLabel(
                            titulo: 'Cnpj:',
                            conteudo: cliente.cnpj ?? 'Não Informado',
                          ),
                          _renderLabel(
                            titulo: 'Cnpj:',
                            conteudo: cliente.retemIss != null
                                ? cliente.retemIss == true
                                    ? 'Sim'
                                    : 'Não'
                                : 'Não Informado',
                          ),
                        ],
                      ),

                    _renderLabel(
                      titulo: 'Procurar por:',
                      conteudo: cliente.porQuemProcurar ?? 'Não Informado',
                    ),
                    // _renderLabel(
                    //   titulo: 'Informações adicionais:',
                    //   conteudo: cliente.endereco.,
                    // ),
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
                          // ignore: deprecated_member_use
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
      ),
    );
  }
}
