import 'package:arte_persa/src/core/ui/helpers/form_help.dart';
import 'package:arte_persa/src/core/ui/constants.dart';
import 'package:arte_persa/src/pages/cadastro_servico/cadastro_servico_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:validatorless/validatorless.dart';

class CadastroServicoPage extends ConsumerStatefulWidget {
  const CadastroServicoPage({
    super.key,
  });

  @override
  ConsumerState<CadastroServicoPage> createState() =>
      _CadastroServicoPageState();
}

class _CadastroServicoPageState extends ConsumerState<CadastroServicoPage> {
  final formKey = GlobalKey<FormBuilderState>();
  bool checkPorcentagem = false;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final CadastroServicoVm(:salvarNovoServico) =
        ref.read(cadastroServicoVmProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de novo tipo de serviço'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
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
                Lottie.asset(
                  LottieConstants.phoneListAnimation,
                  height: 200,
                  fit: BoxFit.fill,
                ),
                FormBuilderTextField(
                  name: 'nome_do_servico',
                  onTapOutside: (_) => context.unfocus(),
                  decoration: const InputDecoration(
                    labelText: 'Titudo serviço',
                  ),
                  validator:
                      Validatorless.required('Nome do serviço e obrigatorio.'),
                ),
                const SizedBox(
                  height: 16,
                ),
                FormBuilderDropdown(
                  name: 'categoria_selecionada',
                  decoration: const InputDecoration(
                    labelText: 'Selecione uma o serviço',
                  ),
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                  items: ['Tapete', 'Estofados']
                      .map((option) => DropdownMenuItem(
                            value: option,
                            child: Text(option,
                                style: const TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0))),
                          ))
                      .toList(),
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Flexible(
                      child: FormBuilderSwitch(
                        name: 'metro_quadrado',
                        title: const DefaultTextStyle(
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                          child: Text('Metro quadrado'),
                        ),
                        initialValue: false,
                        onChanged: (value) {
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Flexible(
                      child: FormBuilderSwitch(
                        name: 'metro_linear',
                        title: const DefaultTextStyle(
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                          child: Text('Metro linear'),
                        ),
                        initialValue: false,
                        onChanged: (value) {
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Flexible(
                      child: FormBuilderSwitch(
                        name: 'valor_fixo',
                        title: const DefaultTextStyle(
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                          child: Text('Preço fixo'),
                        ),
                        initialValue: false,
                        onChanged: (value) {
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Flexible(
                      child: FormBuilderSwitch(
                        name: 'valor_manual',
                        title: const DefaultTextStyle(
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                          child: Text('Preço manual'),
                        ),
                        initialValue: false,
                        onChanged: (value) {},
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                FormBuilderSwitch(
                  name: 'porcentagem_servico',
                  title: const DefaultTextStyle(
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                    child: Text('Porcentage serviço'),
                  ),
                  initialValue: false,
                  onChanged: (value) {

                    setState(() {
                      checkPorcentagem = value ?? false;
                    });
                    // state.form
                  },
                ),
                Visibility(
                  visible: checkPorcentagem,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 16,
                      ),
                      FormBuilderDropdown(
                        name: 'servico_selecionando',
                        decoration: const InputDecoration(
                          labelText: 'Selecione uma o serviço',
                        ),
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                        ), // Define a,
                        items: ['opçãoA', 'opçãoB']
                            .map((option) => DropdownMenuItem(
                                  value: option,
                                  child: Text(option,
                                      style: const TextStyle(
                                          color: Color.fromARGB(255, 0, 0, 0))),
                                ))
                            .toList(),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Visibility(
                  visible: checkPorcentagem,
                  child: FormBuilderTextField(
                    name: 'porcentagem',
                    onTapOutside: (_) => context.unfocus(),
                    decoration: const InputDecoration(
                      labelText: 'Porcentagem do serviço',
                    ),
                    validator: Validatorless.required(
                        'Porcentagem do serviço e obrigatorio.'),
                  ),
                ),
               
                Visibility(
                  visible: !checkPorcentagem,
                  child: FormBuilderTextField(
                    name: 'valor',
                    onTapOutside: (_) => context.unfocus(),
                    decoration: const InputDecoration(
                      labelText: 'valor do serviço',
                    ),
                    validator:
                        Validatorless.required('valor do serviço e obrigatorio.'),
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
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              minimumSize: const Size.fromHeight(60),
              backgroundColor: const Color.fromRGBO(0, 128, 0, 1)),
          onPressed: () async {
            switch (formKey.currentState?.saveAndValidate()) {
              case (false || null):
                break;
              case (true):
                await salvarNovoServico(formKey.currentState!.value);
                // Navigator.of(context).pop();
                break;
            }
          }, //loginUser,
          child: const Text('Cadastrar'),
        ),
      ),
    );
  }
}
