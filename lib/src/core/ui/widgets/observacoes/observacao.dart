import 'dart:io';

import 'package:arte_persa/src/core/extension/context_extension.dart';
import 'package:arte_persa/src/model/observacao_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class Observacao extends StatelessWidget {
  const Observacao({
    super.key,
    required this.addFotoObservacao,
    required this.observacao,
    required this.observacaoIndex,
    required this.removerObservacao,
  });

  final Function({
    required String tipoFoto,
    required String source,
    required String fileName,
    required int index,
  }) addFotoObservacao;

  final Function({
    required int index,
  }) removerObservacao;

  final ObservacaoModel? observacao;
  final int observacaoIndex;

  @override
  Widget build(BuildContext context) {
    final navigator = Navigator.of(context);
    return Column(
      children: [
        const Text(
          "Observação N° ",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          children: [
            Expanded(
              child: FormBuilderTextField(
                name: 'observacao[$observacaoIndex]',
                initialValue: observacao?.observacao,
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
                    fixedSize: const Size(
                      64,
                      64,
                    ),
                    backgroundColor: Colors.orange.shade300,
                  ),
                  onPressed: () async {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          backgroundColor: const Color(0xFF1E2331),
                          title: const Text(
                            'Escolher Fonte',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          content: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Flexible(
                                  child: ElevatedButton.icon(
                                    onPressed: () async {
                                      await addFotoObservacao(
                                        tipoFoto: 'Observacao',
                                        source: 'Camera',
                                        fileName: 'foto_observacao_',
                                        index: observacaoIndex,
                                      );
                                      navigator.pop();
                                    },
                                    icon: const Icon(
                                      Icons.camera_alt_sharp,
                                      color: Colors.white,
                                    ),
                                    label: const Text(
                                      'Caméra',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 16,
                                ),
                                Flexible(
                                  child: ElevatedButton.icon(
                                    onPressed: () async {
                                      await addFotoObservacao(
                                        tipoFoto: 'Observacao',
                                        source: 'Galeria',
                                        fileName: 'foto_observao_',
                                        index: observacaoIndex,
                                      );
                                      navigator.pop();
                                    },
                                    icon: const Icon(
                                      Icons.image,
                                      color: Colors.white,
                                    ),
                                    label: const Text(
                                      'Galeria',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
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
                  onPressed: () async {
                    removerObservacao(
                      index: observacaoIndex,
                    );
                  },
                  child: const Align(
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.delete,
                      size: 24,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        if (observacao?.image?.pathLocal != null)
          Align(
            alignment: Alignment.centerLeft,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.file(
                File(observacao!.image!.pathLocal!),
                width: 124,
                height: 124,
                fit: BoxFit.cover,
              ),
            ),
          )
        else if (observacao?.image?.pathDownloadImage != null)
          Align(
            alignment: Alignment.centerLeft,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.network(
                observacao!.image!.pathDownloadImage!,
                width: 124,
                height: 124,
                fit: BoxFit.cover,
              ),
            ),
          ),
      ],
    );
  }
}
