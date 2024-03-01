import 'dart:io';

import 'package:arte_persa/src/core/extension/context_extension.dart';
import 'package:arte_persa/src/model/observacao_model.dart';
import 'package:arte_persa/src/pages/ordem_de_servico/ordem_de_servico_state.dart';
import 'package:arte_persa/src/pages/ordem_de_servico/ordem_de_servico_vm.dart';
import 'package:arte_persa/src/routes/route_generator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OrdemDeServicoObservacao extends ConsumerStatefulWidget {
  const OrdemDeServicoObservacao({super.key});

  @override
  ConsumerState<OrdemDeServicoObservacao> createState() =>
      _OrdemDeServicoObservacaoState();
}

class _OrdemDeServicoObservacaoState
    extends ConsumerState<OrdemDeServicoObservacao> {
  final formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    final OrdemDeServicoVm(
      :getImageDeviceOrCam,
    ) = ref.read(ordemDeServicoVmProvider.notifier);

    final notaVm = ref.watch(ordemDeServicoVmProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de observações'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pushNamedAndRemoveUntil(
                RouteGeneratorKeys.authLogin, (route) => false);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(32.0),
          child: FormBuilder(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(60),
                    backgroundColor: Colors.orange.shade300,
                  ),
                  onPressed: () async {},
                  child: const Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Nova bservação',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Icon(
                        Icons.add,
                        size: 32,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(60),
                    backgroundColor: Colors.orange.shade300,
                  ),
                  child: const Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Foto do produto',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Icon(
                        Icons.add_a_photo,
                        size: 32,
                      ),
                    ],
                  ),
                  onPressed: () async {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text(
                            'Escolher Fonte',
                          ),
                          content: SingleChildScrollView(
                            child: ListBody(
                              children: [
                                GestureDetector(
                                  child: const Text(
                                    'Câmera',
                                  ),
                                  onTap: () async {
                                    // await getImageDeviceOrCam(
                                    //   numeroDaNota: '202402291026',
                                    //   tipoFoto: 'Producao',
                                    //   source: 'Camera',
                                    //   fileName: 'foto_produto_',
                                    // );
                                    Navigator.of(context).pop();
                                  },
                                ),
                                const Padding(
                                  padding: EdgeInsets.all(
                                    8.0,
                                  ),
                                ),
                                GestureDetector(
                                  child: const Text(
                                    'Galeria',
                                  ),
                                  onTap: () async {
                                    // await getImageDeviceOrCam(
                                    //   numeroDaNota: '202402291026',
                                    //   tipoFoto: 'Producao',
                                    //   source: 'Galeria',
                                    //   fileName: 'foto_produto_',
                                    // );
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Flexible(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(60),
                  backgroundColor: Colors.red.shade300,
                ),
                onPressed: () async {}, //loginUser,
                child: const Text('Cancelar'),
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Flexible(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(60),
                    backgroundColor: const Color.fromRGBO(0, 128, 0, 1)),
                onPressed: () async {}, //loginUser,
                child: const Text('Proximo'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Observacao extends StatelessWidget {
  const Observacao({
    super.key,
    required this.getImageDeviceOrCam,
    required this.observacao,
  });

  final Function({
    required String numeroDaNota,
    required String tipoFoto,
    required String source,
    required String fileName,
  }) getImageDeviceOrCam;

  final ObservacaoModel observacao;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Observação N° 1',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w500, fontSize: 16),
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          children: [
            Expanded(
              child: FormBuilderTextField(
                name: 'observacao',
                onTapOutside: (_) => context.unfocus(),
                decoration: const InputDecoration(
                  labelText: 'Escreva aqui sua observação*',
                  alignLabelWithHint: true,
                ),
                keyboardType: TextInputType.multiline,
                maxLines: 5,
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Column(
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(64, 64),
                    backgroundColor: Colors.orange.shade300,
                  ),
                  onPressed: () async {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text(
                            'Escolher Fonte',
                          ),
                          content: SingleChildScrollView(
                            child: ListBody(
                              children: [
                                GestureDetector(
                                  child: const Text(
                                    'Câmera',
                                  ),
                                  onTap: () async {
                                    await getImageDeviceOrCam(
                                      numeroDaNota: '202402291026',
                                      tipoFoto: 'Observacao',
                                      source: 'Camera',
                                      fileName: 'foto_observao_',
                                    );
                                    Navigator.of(context).pop();
                                  },
                                ),
                                const Padding(
                                  padding: EdgeInsets.all(
                                    8.0,
                                  ),
                                ),
                                GestureDetector(
                                  child: const Text(
                                    'Galeria',
                                  ),
                                  onTap: () async {
                                    await getImageDeviceOrCam(
                                      numeroDaNota: '202402291026',
                                      tipoFoto: 'Observacao',
                                      source: 'Galeria',
                                      fileName: 'foto_observao_',
                                    );
                                    Navigator.of(context).pop();
                                  },
                                ),
                                Row(
                                  children: [
                                    if (observacao.image != null &&
                                        observacao.image?.pathDownloadImage !=
                                            null)
                                      Image.network(
                                        observacao.image!.pathDownloadImage!,
                                        width: 124,
                                        height: 124,
                                        fit: BoxFit.cover,
                                      ),
                                    if (observacao.image != null &&
                                        observacao.image?.pathLocal != null &&
                                        observacao.image?.pathDownloadImage ==
                                            null)
                                      Image.network(
                                        observacao.image!.pathLocal!,
                                        width: 124,
                                        height: 124,
                                        fit: BoxFit.cover,
                                      ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: const Align(
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.add_a_photo,
                      size: 24,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(64, 64),
                    backgroundColor: Colors.red.shade500,
                  ),
                  onPressed: () async {},
                  child: const Align(
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.delete,
                      size: 24,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
