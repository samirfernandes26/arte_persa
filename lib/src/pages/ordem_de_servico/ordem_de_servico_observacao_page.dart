import 'package:arte_persa/src/core/extension/context_extension.dart';
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
      :addFotoObservacao,
      :addObservacao,
      :removerObservacao,
      :cadastroObservacoes,
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
                  onPressed: () {
                    addObservacao();
                  },
                  child: const Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Nova observação',
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
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: notaVm.itemForm?.observacoes?.length ?? 0,
                  itemBuilder: (context, index) {
                    final observacao = notaVm.itemForm?.observacoes![index];
                    return Observacao(
                      observacaoIndex: index,
                      observacao: observacao,
                      removerObservacao: removerObservacao,
                      addFotoObservacao: addFotoObservacao,
                    );
                  },
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
                onPressed: () async {
                  switch (formKey.currentState?.saveAndValidate()) {
                    case (false || null):
                      break;
                    case (true):
                      await cadastroObservacoes(formKey.currentState!.value);
                      Navigator.of(context).pushNamed(
                          RouteGeneratorKeys.ordemDeServicoObservacao);
                  }
                }, //loginUser,
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

  final ObservacaoForm? observacao;
  final int observacaoIndex;

  @override
  Widget build(BuildContext context) {
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
                                    await addFotoObservacao(
                                      tipoFoto: 'Observacao',
                                      source: 'Camera',
                                      fileName: 'foto_observacao_',
                                      index: observacaoIndex,
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
                                    await addFotoObservacao(
                                      tipoFoto: 'Observacao',
                                      source: 'Galeria',
                                      fileName: 'foto_observao_',
                                      index: observacaoIndex,
                                    );
                                    Navigator.of(context).pop();
                                  },
                                ),
                                // Row(
                                //   children: [
                                //     if (observacao.image != null &&
                                //         observacao.image?.pathDownloadImage !=
                                //             null)
                                //       Image.network(
                                //         observacao.image!.pathDownloadImage!,
                                //         width: 124,
                                //         height: 124,
                                //         fit: BoxFit.cover,
                                //       ),
                                //     if (observacao.image != null &&
                                //         observacao.image?.pathLocal != null &&
                                //         observacao.image?.pathDownloadImage ==
                                //             null)
                                //       Image.network(
                                //         observacao.image!.pathLocal!,
                                //         width: 124,
                                //         height: 124,
                                //         fit: BoxFit.cover,
                                //       ),
                                //   ],
                                // ),
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
                    removerObservacao(index: observacaoIndex);
                  },
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
