import 'dart:developer';

import 'package:arte_persa/src/core/extension/context_extension.dart';
import 'package:arte_persa/src/core/ui/helpers/messages.dart';
import 'package:arte_persa/src/pages/ordem_de_servico/ordem_de_servico_state.dart';
import 'package:arte_persa/src/pages/ordem_de_servico/ordem_de_servico_vm.dart';
import 'package:arte_persa/src/routes/route_generator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:validatorless/validatorless.dart';

class OrdemDeServico extends ConsumerStatefulWidget {
  const OrdemDeServico({super.key});

  @override
  ConsumerState<OrdemDeServico> createState() => _OrdemDeServicoState();
}

class _OrdemDeServicoState extends ConsumerState<OrdemDeServico> {
  final formKey = GlobalKey<FormBuilderState>();
  String? urlPhoto;
  List<String> listFiles = [];

  @override
  Widget build(BuildContext context) {
    final OrdemDeServicoVm(:loadDataClientes) =
        ref.read(ordemDeServicoVmProvider.notifier);
    final ordemDeServicoVm = ref.watch(ordemDeServicoVmProvider);

    final arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    if (ordemDeServicoVm.status == OrdemDeServicoStateStatus.initial ||
        arguments?['reload'] == true) {
      Future(
        () async {
          await loadDataClientes();
          arguments?['reload'] = false;
        },
      );
    }

    ref.listen(
      ordemDeServicoVmProvider,
      (_, state) {
        switch (state.status) {
          case OrdemDeServicoStateStatus.initial:
            break;
          case OrdemDeServicoStateStatus.loaded:
            break;
          case OrdemDeServicoStateStatus.success:
            Messages.showSuccess(state.message!, context);
            Future(
              () async {
                await loadDataClientes();
              },
            );
            break;
          case OrdemDeServicoStateStatus.error:
            break;
        }
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Orden de serviço'),
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
                FormBuilderDropdown(
                  name: 'cliente_id',
                  decoration: const InputDecoration(
                    labelText: 'Selecione um cliente',
                  ),
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                  items: ordemDeServicoVm.clientes?.map((cliente) {
                        return DropdownMenuItem(
                          value: cliente.nome,
                          child: Text(
                            cliente.nome!,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black87,
                            ),
                          ),
                        );
                      }).toList() ??
                      [],
                ),
                const SizedBox(
                  height: 16,
                ),
                FormBuilderRadioGroup(
                  name: 'tipo_item',
                  decoration: const InputDecoration(
                    labelText: 'Selecione o tipo de produto',
                  ),
                  // validator: Validatorless.required('Tipo de produto e obrigatorio'),
                  options: const [
                    FormBuilderFieldOption(
                      value: 1,
                      child: Text(
                        'Tapete',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    FormBuilderFieldOption(
                      value: 2,
                      child: Text(
                        'Estofado',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                FormBuilderTextField(
                  name: 'nome_item',
                  onTapOutside: (_) => context.unfocus(),
                  decoration: InputDecoration(
                    labelText: 'Nome do item',
                    hintText: 'Nome do item',
                    hintStyle: TextStyle(
                      color: Colors.grey.shade600,
                    ),
                  ),
                  keyboardType: TextInputType.name,
                  validator: Validatorless.required('Dê um nome ao item'),
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Flexible(
                      child: FormBuilderTextField(
                        name: 'comprimento',
                        onTapOutside: (_) => context.unfocus(),
                        decoration: InputDecoration(
                          labelText: 'Comprimento (m)',
                          hintText: 'Comprimento (m)',
                          hintStyle: TextStyle(
                            color: Colors.grey.shade600,
                          ),
                        ),
                        keyboardType: TextInputType.name,
                        validator: Validatorless.required('Nome é obrigatório'),
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Flexible(
                      child: FormBuilderTextField(
                        name: 'largura',
                        onTapOutside: (_) => context.unfocus(),
                        decoration: const InputDecoration(
                          labelText: 'Largura (m)',
                          hintText: 'Largura (m)',
                        ),
                        keyboardType: TextInputType.name,
                        validator: Validatorless.required('Nome é obrigatório'),
                      ),
                    ),
                  ],
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
                onPressed: () async {await loadDataClientes();}, //loginUser,
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
                  // switch (formKey.currentState?.validate()) {
                  //   case (false || null):
                  //     Messages.showErrors(
                  //         'Preencha o formulário corretamente', context);
                  //   case true:
                  //     const int numeroPage = 1;
                  //     await updateStatePagers(numeroPage,formKey.currentState!.value);
                  //     Navigator.of(context).pushNamed(
                  //         RouteGeneratorKeys.ordemDeServicoObservacao);
                  // }
                },
                child: const Text('Proximo'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// TODO: Verificar depois 
// Center(
//     child: (urlPhoto != null)
//         ? Image.network(
//             urlPhoto!,
//           )
//         : const CircleAvatar(
//             radius: 64,
//             child: Icon(Icons.person),
//           ),
//   ),
//   const Padding(
//     padding: EdgeInsets.all(16.0),
//     child: Divider(),
//   ),
//   const Text(
//     'Histórico de Imagens',
//     style: TextStyle(
//         color: Colors.white,
//         fontWeight: FontWeight.bold,
//         fontSize: 18),
//   ),
//   Column(
//     children: List.generate(
//       listFiles.length,
//       (index) {
//         String url = listFiles[index];
//         return Image.network(
//           url,
//         );
//       },
//     ),
//   ),