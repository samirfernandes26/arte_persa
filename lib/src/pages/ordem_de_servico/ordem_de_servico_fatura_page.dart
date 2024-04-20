import 'package:arte_persa/src/core/ui/widgets/cards/cards.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:validatorless/validatorless.dart';

import 'package:arte_persa/src/core/extension/context_extension.dart';
import 'package:arte_persa/src/model/faturamento_model.dart';
import 'package:arte_persa/src/model/item_model.dart';
import 'package:arte_persa/src/pages/ordem_de_servico/ordem_de_servico_vm.dart';
import 'package:arte_persa/src/routes/route_generator.dart';
import 'package:arte_persa/src/core/ui/widgets/buttons/buttons.dart';

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
  late FaturamentoModel? fatura;

  @override
  Widget build(BuildContext context) {
    final OrdemDeServicoVm(:aplicarDesconto, :aplicarEntrada) =
        ref.read(ordemDeServicoVmProvider.notifier);

    final notaVm = ref.watch(ordemDeServicoVmProvider);
    itens = notaVm.itens!;
    fatura = notaVm.faturaOs;

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
                    Navigator.of(context).pushNamed(
                      RouteGeneratorKeys.ordemDeServicoPage,
                    );
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
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: notaVm.itens?.length ?? 0,
                  itemBuilder: (context, index) {
                    final item = notaVm.itens![index];
                    return ItemCard(
                      item: item,
                    );
                  },
                ),
                const SizedBox(
                  height: 32,
                ),
                Row(
                  children: [
                    const Expanded(
                      child: Text(
                        'Total',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Flexible(
                      child: Container(
                        width: double.infinity,
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.all(8.0),
                        height: 64,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade600,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          fatura?.totalBruto?.toString().replaceAll('.', ',') ??
                              '0,00',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 32,
                ),
                Row(
                  children: [
                    const Expanded(
                      child: Text(
                        'Desconto',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Flexible(
                      child: FormBuilderTextField(
                        name: 'desconto',
                        onTapOutside: (_) => context.unfocus(),
                        decoration: const InputDecoration(
                          labelText: 'valor em porcentagem',
                          hintText: 'valor em porcentagem',
                        ),
                        onChanged: (value) {
                          final double porcentagem =
                              value != null ? double.parse(value) : 0;
                          aplicarDesconto(
                            porcentagem: porcentagem,
                          );
                        },
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 32,
                ),
                Row(
                  children: [
                    const Expanded(
                      child: Text(
                        'Adiantamento',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Flexible(
                      child: FormBuilderTextField(
                        name: 'adiantamento',
                        onTapOutside: (_) => context.unfocus(),
                        decoration: const InputDecoration(
                          labelText: 'valor adiantado',
                          hintText: 'valor adiantado',
                        ),
                        keyboardType: TextInputType.name,
                        onChanged: (value) {
                          final double entrada =
                              value != null ? double.parse(value) : 0;
                          aplicarEntrada(
                            entrada: entrada,
                          );
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 32,
                ),
                Row(
                  children: [
                    const Expanded(
                      child: Text(
                        'Total',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Flexible(
                      child: Container(
                        width: double.infinity,
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.all(8.0),
                        height: 64,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade600,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          fatura?.valorFinalDaNota
                                  ?.toString()
                                  .replaceAll('.', ',') ??
                              '0,00',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 72,
                ),
                FormBuilderDropdown(
                  name: 'categoria_selecionada',
                  decoration: const InputDecoration(
                    labelText: 'Selecione uma o serviço',
                  ),
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                  items: [
                    'Cartão de credito',
                    'Cartão de debito',
                    'Pix',
                    'Dinheiro'
                  ]
                      .map(
                        (option) => DropdownMenuItem(
                          value: option,
                          child: Text(
                            option,
                            style: const TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                  validator: Validatorless.required(
                    'Tipo de seviço obrigatório.',
                  ),
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
              textButton: 'Voltar',
              colorText: Colors.white,
              colorButton: Colors.red.shade300,
              useFlexible: true,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            const SizedBox(
              width: 16,
            ),
            Button(
              textButton: 'Proximo',
              colorText: Colors.white,
              colorButton: const Color(0xFF008000),
              useFlexible: true,
              onPressed: () async {
                switch (formKey.currentState?.saveAndValidate()) {
                  case (false || null):
                    break;
                  case (true):
                    // await cadastroObservacoes(formKey.currentState!.value);
                    Navigator.of(context).pushNamed(
                        RouteGeneratorKeys.ordemDeServicoTermoAssinatura);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
