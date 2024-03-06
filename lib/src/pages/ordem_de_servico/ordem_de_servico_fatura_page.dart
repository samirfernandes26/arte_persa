import 'package:arte_persa/src/pages/ordem_de_servico/ordem_de_servico_vm.dart';
import 'package:arte_persa/src/routes/route_generator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OrdemDeServicoFaturaPage extends ConsumerStatefulWidget {
  const OrdemDeServicoFaturaPage({super.key});

  @override
  ConsumerState<OrdemDeServicoFaturaPage> createState() =>
      _OrdemDeServicoFaturaPageState();
}

class _OrdemDeServicoFaturaPageState
    extends ConsumerState<OrdemDeServicoFaturaPage> {
  final formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    // final OrdemDeServicoVm() = ref.read(ordemDeServicoVmProvider.notifier);

    final notaVm = ref.watch(ordemDeServicoVmProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Fatura'),
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
                  },
                  child: const Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Adiconar mais um Item',
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
                      // await cadastroObservacoes(formKey.currentState!.value);
                      Navigator.of(context).pushNamed(
                          RouteGeneratorKeys.ordemDeServicoServicosPage);
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

