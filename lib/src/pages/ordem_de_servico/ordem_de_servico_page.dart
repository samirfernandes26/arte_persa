import 'dart:io';

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
    final OrdemDeServicoVm(:loadData, :cadastroDeItem, :selectImageProdo) =
        ref.read(ordemDeServicoVmProvider.notifier);
    final ordemDeServicoVm = ref.watch(ordemDeServicoVmProvider);

    final arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    if (ordemDeServicoVm.status == OrdemDeServicoStateStatus.initial ||
        arguments?['reload'] == true) {
      Future(
        () async {
          await loadData();
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
                await loadData();
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
                      value: 'Tapete',
                      child: Text(
                        'Tapete',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    FormBuilderFieldOption(
                      value: 'Estofado',
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
                  name: 'nome_do_item',
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
                        keyboardType: TextInputType.number,
                        validator: Validatorless.required('Comprimento é obrigatório'),
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
                        keyboardType: TextInputType.number,
                        validator: Validatorless.required('Largura é obrigatório'),
                      ),
                    ),
                  ],
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
                                    await selectImageProdo(
                                      tipoFoto: 'Producao',
                                      source: 'Camera',
                                      fileName: 'foto_produto_',
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
                                    await selectImageProdo(
                                      tipoFoto: 'Producao',
                                      source: 'Galeria',
                                      fileName: 'foto_produto_',
                                    );
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
                if (ordemDeServicoVm.image?.pathLocal != null)
                  Align(
                    alignment: Alignment.centerLeft,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image.file(
                        File(ordemDeServicoVm.image!.pathLocal!),
                        width: 200,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                else if (ordemDeServicoVm.image?.pathDownloadImage != null)
                  Align(
                    alignment: Alignment.centerLeft,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image.network(
                        ordemDeServicoVm.image!.pathDownloadImage!,
                        width: 200,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                if (ordemDeServicoVm.image?.pathDownloadImage == null &&
                    ordemDeServicoVm.itemForm?.fotoProduto?.pathDownloadImage !=
                        null)
                  Align(
                    alignment: Alignment.centerLeft,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image.network(
                        ordemDeServicoVm.image!.pathDownloadImage!,
                        width: 200,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                if (ordemDeServicoVm.image?.pathLocal == null &&
                    ordemDeServicoVm.itemForm?.fotoProduto?.pathLocal !=
                        null)
                  Align(
                    alignment: Alignment.centerLeft,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image.file(
                        File(ordemDeServicoVm.image!.pathLocal!),
                        width: 200,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
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
                onPressed: () async {
                  await loadData();
                }, //loginUser,
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
                      await cadastroDeItem(formKey.currentState!.value);
                      Navigator.of(context).pushNamed(
                          RouteGeneratorKeys.ordemDeServicoObservacao);
                  }
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
