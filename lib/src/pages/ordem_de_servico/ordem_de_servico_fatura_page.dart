import 'package:arte_persa/src/model/item_model.dart';
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

  late ItemModel? item;
  late List<ItemModel>? itens;

  @override
  Widget build(BuildContext context) {
    // final OrdemDeServicoVm() = ref.read(ordemDeServicoVmProvider.notifier);

    final notaVm = ref.watch(ordemDeServicoVmProvider);
    itens = notaVm.itens!;
    item = itens![0];

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
                  onPressed: () {},
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
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade600, // Cor de fundo
                    borderRadius:
                        BorderRadius.circular(10), // Borda arredondada
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5), // Sombra
                        spreadRadius: 2,
                        blurRadius: 3,
                        offset: Offset(0, 1), // Mudança de posição da sombra
                      ),
                    ],
                  ),
                  padding: EdgeInsets.all(16), // Preenchimento interno
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Tipo do item',
                            style: TextStyle(
                              color: Colors.grey.shade900,
                              fontWeight: FontWeight.w900,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            item?.tipoIdetem ?? 'Tipo Não encotrado',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          Text(
                            'Nome do Item',
                            style: TextStyle(
                              color: Colors.grey.shade900,
                              fontWeight: FontWeight.w900,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            item?.nomeDoItem ?? 'Nome do item não encotrado',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          Text(
                            'Numéro de Observaçoes',
                            style: TextStyle(
                              color: Colors.grey.shade900,
                              fontWeight: FontWeight.w900,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            item?.observacoes != null
                                ? item!.observacoes!.length.toString()
                                : 'Sem observações', 
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          Text(
                            'Servicos selecionados',
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
                            'Ver aqui depois ',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          Text(
                            'Valor do serviço',
                            style: TextStyle(
                              color: Colors.grey.shade900,
                              fontWeight: FontWeight.w900,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            item?.total?.toString()
                                            .replaceAll('.', ',') ??
                                        '0,00',
                            style: TextStyle(
                              color: Colors.orange.shade300,
                              fontWeight: FontWeight.w900,
                              fontSize: 24,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
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
