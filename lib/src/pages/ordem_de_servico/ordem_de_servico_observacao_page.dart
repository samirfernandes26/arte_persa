import 'dart:io';

import 'package:arte_persa/src/core/extension/context_extension.dart';
import 'package:arte_persa/src/core/ui/widgets/buttons/buttons.dart';
import 'package:arte_persa/src/core/ui/widgets/observacoes/observacao.dart';
import 'package:arte_persa/src/model/observacao_model.dart';
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
                  itemCount: notaVm.observacoesModelList?.length ?? 0,
                  itemBuilder: (context, index) {
                    final observacao = notaVm.observacoesModelList![index];
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
            Button(
              formKey: formKey,
              textButton: 'Cancelar',
              colorText: Colors.white,
              colorButton: Colors.red.shade300,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            const SizedBox(
              width: 16,
            ),
            Button(
              formKey: formKey,
              textButton: 'Proximo',
              colorText: Colors.white,
              colorButton: const Color(0xFF008000),
              onPressed: () async {
                switch (formKey.currentState?.saveAndValidate()) {
                  case (false || null):
                    break;
                  case (true):
                    await cadastroObservacoes(formKey.currentState!.value);
                    Navigator.of(context).pushNamed(
                        RouteGeneratorKeys.ordemDeServicoServicosPage);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
