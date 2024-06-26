import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:validatorless/validatorless.dart';

import 'package:arte_persa/src/core/ui/helpers/form_help.dart';
import 'package:arte_persa/src/core/ui/constants.dart';
import 'package:arte_persa/src/core/ui/helpers/messages.dart';
import 'package:arte_persa/src/core/ui/widgets/buttons/buttons.dart';
import 'package:arte_persa/src/pages/cadastro_servico/cadastro_servico_state.dart';
import 'package:arte_persa/src/pages/cadastro_servico/cadastro_servico_vm.dart';
import 'package:arte_persa/src/routes/route_generator.dart';

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
    final CadastroServicoVm(:registerServico) =
        ref.read(cadastroServicoVmProvider.notifier);

    // final servicoVm = ref.watch(cadastroServicoVmProvider);

    ref.listen(
      cadastroServicoVmProvider,
      (_, state) async {
        switch (state.status) {
          case CadastroServicoStateStatus.initial:
            break;
          case CadastroServicoStateStatus.loaded:
            break;
          case CadastroServicoStateStatus.error:
            Messages.showErrors(
              state.message!,
              context,
            );
            Navigator.of(context).pop(true);
          case CadastroServicoStateStatus.success:
            Messages.showSuccess(
              state.message!,
              context,
            );
            Navigator.of(context).popAndPushNamed(
              RouteGeneratorKeys.home,
            );
        }
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cadastro de novo tipo de serviço',
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            Navigator.of(context).popAndPushNamed(
              RouteGeneratorKeys.home,
            );
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
                Lottie.asset(
                  LottieConstants.phoneListAnimation,
                  height: 200,
                  fit: BoxFit.fill,
                ),
                FormBuilderTextField(
                  name: 'nome_do_servico',
                  onTapOutside: (_) => context.unfocus(),
                  decoration: InputDecoration(
                    labelText: 'Titudo serviço',
                    fillColor: Colors.grey.withOpacity(0.4),
                    contentPadding: const EdgeInsets.all(8),
                  ),
                  validator: Validatorless.required(
                    'Nome do serviço e obrigatório.',
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                FormBuilderDropdown(
                  name: 'categoria_selecionada',
                  decoration: InputDecoration(
                    labelText: 'Selecione uma o serviço',
                    fillColor: Colors.grey.withOpacity(0.4),
                    contentPadding: const EdgeInsets.all(8),
                  ),
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                  items: ['Tapete', 'Estofados']
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
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Flexible(
                      child: FormBuilderSwitch(
                        name: 'metro_quadrado',
                        decoration: InputDecoration(
                          fillColor: Colors.grey.withOpacity(0.4),
                          contentPadding: const EdgeInsets.all(8),
                        ),
                        title: const DefaultTextStyle(
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                          child: Text('Metro quadrado'),
                        ),
                        initialValue: false,
                        onChanged: (value) {},
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Flexible(
                      child: FormBuilderSwitch(
                        name: 'metro_linear',
                        decoration: InputDecoration(
                          fillColor: Colors.grey.withOpacity(0.4),
                          contentPadding: const EdgeInsets.all(8),
                        ),
                        title: const DefaultTextStyle(
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                          child: Text('Metro linear'),
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
                Row(
                  children: [
                    Flexible(
                      child: FormBuilderSwitch(
                        name: 'valor_fixo',
                        decoration: InputDecoration(
                          fillColor: Colors.grey.withOpacity(0.4),
                          contentPadding: const EdgeInsets.all(8),
                        ),
                        title: const DefaultTextStyle(
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                          child: Text('Preço fixo'),
                        ),
                        initialValue: false,
                        onChanged: (value) {},
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Flexible(
                      child: FormBuilderSwitch(
                        name: 'valor_manual',
                        decoration: InputDecoration(
                          fillColor: Colors.grey.withOpacity(0.4),
                          contentPadding: const EdgeInsets.all(8),
                        ),
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
                FormBuilderTextField(
                  name: 'valor',
                  onTapOutside: (_) => context.unfocus(),
                  decoration: InputDecoration(
                    labelText: 'valor do serviço',
                    fillColor: Colors.grey.withOpacity(0.4),
                    contentPadding: const EdgeInsets.all(8),
                  ),
                  keyboardType: TextInputType.phone,
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
        child: Button(
          textButton: 'Cadastrar',
          colorText: Colors.white,
          colorButton: const Color(0xFF008000),
          onPressed: () async {
            switch (formKey.currentState?.saveAndValidate()) {
              case (false || null):
                break;
              case (true):
                await registerServico(
                  formKey.currentState!.value,
                );
                // Navigator.of(context).pop();
                break;
            }
          },
        ),
      ),
    );
  }
}
