import 'package:arte_persa/src/model/cliente_model.dart';
import 'package:flutter/material.dart';

import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import 'package:arte_persa/src/core/extension/context_extension.dart';
import 'package:arte_persa/src/core/ui/constants.dart';
import 'package:arte_persa/src/core/ui/helpers/messages.dart';
import 'package:arte_persa/src/core/ui/widgets/buttons/buttons.dart';
import 'package:arte_persa/src/pages/cadastro_cliente/cadastro_cliente_state.dart';
import 'package:arte_persa/src/pages/cadastro_cliente/cadastro_cliente_vm.dart';
import 'package:arte_persa/src/routes/route_generator.dart';

class CadastroClienteEnderecoPage extends ConsumerStatefulWidget {
  const CadastroClienteEnderecoPage({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<CadastroClienteEnderecoPage> createState() =>
      _CadastroClienteEnderecoPageState();
}

class _CadastroClienteEnderecoPageState
    extends ConsumerState<CadastroClienteEnderecoPage> {
  final formKey = GlobalKey<FormBuilderState>();
  bool checkTeleconeConatatoUm = true;
  bool checkTeleconeConatatoDois = true;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final CadastroClienteVm(
      :registerCliente,
      :updateStateEndereco,
    ) = ref.read(cadastroClienteVmProvider.notifier);
    final enderecoVm = ref.watch(cadastroClienteVmProvider);

    ref.listen(cadastroClienteVmProvider, (_, state) async {
      switch (state.status) {
        case CadastroClienteStateStatus.initial:
          break;
        case CadastroClienteStateStatus.loaded:
          break;
        case CadastroClienteStateStatus.error:
          Messages.showErrors(state.message!, context);
          Navigator.of(context).pop(true);
        case CadastroClienteStateStatus.success:
          Messages.showSuccess(state.message!, context);
          Navigator.of(context).pushNamed(
            RouteGeneratorKeys.visulizarCliente,
            arguments: {
              'id': null,
              'cliente': state.clienteSalva,
            },
          );
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cadastro Endereço do Cliente',
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pushNamedAndRemoveUntil(
              RouteGeneratorKeys.authLogin,
              (route) => false,
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
                  LottieConstants.localePhone,
                  height: 160,
                  fit: BoxFit.fill,
                ),
                const SizedBox(
                  height: 32,
                ),
                FormBuilderTextField(
                  name: 'cep',
                  initialValue: enderecoVm.enderecoForm?.cep,
                  inputFormatters: [MaskTextInputFormatter(mask: '##.###-###')],
                  onTapOutside: (_) => context.unfocus(),
                  decoration: const InputDecoration(
                    labelText: 'Cep',
                    hintText: 'Cep',
                  ),
                  keyboardType: TextInputType.name,
                ),
                const SizedBox(
                  height: 16,
                ),
                FormBuilderTextField(
                  name: 'logradouro',
                  initialValue: enderecoVm.enderecoForm?.logradouro,
                  onTapOutside: (_) => context.unfocus(),
                  decoration: const InputDecoration(
                    labelText: 'Logradouro',
                    hintText: 'Logradouro',
                  ),
                  keyboardType: TextInputType.name,
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Flexible(
                      child: FormBuilderTextField(
                        name: 'numero',
                        initialValue: enderecoVm.enderecoForm?.numero,
                        onTapOutside: (_) => context.unfocus(),
                        decoration: InputDecoration(
                          labelText: 'Numéro',
                          hintText: 'Numéro',
                          hintStyle: TextStyle(
                            color: Colors.grey.shade600,
                          ),
                        ),
                        keyboardType: TextInputType.name,
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Flexible(
                      child: FormBuilderTextField(
                        name: 'complemento',
                        initialValue: enderecoVm.enderecoForm?.complemento,
                        onTapOutside: (_) => context.unfocus(),
                        decoration: const InputDecoration(
                          labelText: 'Complemento',
                          hintText: 'Complemento',
                        ),
                        keyboardType: TextInputType.name,
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
                      child: FormBuilderTextField(
                        name: 'bairro',
                        initialValue: enderecoVm.enderecoForm?.bairro,
                        onTapOutside: (_) => context.unfocus(),
                        decoration: InputDecoration(
                          labelText: 'Bairro',
                          hintText: 'Bairro',
                          hintStyle: TextStyle(
                            color: Colors.grey.shade600,
                          ),
                        ),
                        keyboardType: TextInputType.name,
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Flexible(
                      child: FormBuilderTextField(
                        name: 'estado',
                        initialValue: enderecoVm.enderecoForm?.estado,
                        onTapOutside: (_) => context.unfocus(),
                        decoration: const InputDecoration(
                          labelText: 'Estado',
                          hintText: 'Estado',
                        ),
                        keyboardType: TextInputType.name,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                FormBuilderTextField(
                  name: 'referencia',
                  initialValue: enderecoVm.enderecoForm?.referencia,
                  onTapOutside: (_) => context.unfocus(),
                  decoration: const InputDecoration(
                    labelText: 'Referencia',
                    hintText: 'Referencia',
                  ),
                  keyboardType: TextInputType.name,
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
              textButton: 'Sair',
              colorText: Colors.white,
              colorButton: Colors.red.shade300,
              useFlexible: true,
              onPressed: () async {
                switch (formKey.currentState?.saveAndValidate()) {
                  case (false || null):
                    break;
                  case (true):
                    await updateStateEndereco(formKey.currentState!.value);
                    Navigator.pop(context);
                    break;
                }
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
                    ClienteModel? clienteSalva = await registerCliente(
                      formKey.currentState!.value,
                    );

                    if (clienteSalva != null) {
                      Navigator.of(context).pushNamed(
                        RouteGeneratorKeys.visulizarCliente,
                        arguments: {
                          'id': null,
                          'cliente': clienteSalva,
                        },
                      );
                    } else {
                      Navigator.of(context).pushNamed(
                        RouteGeneratorKeys.home,
                      );
                    }

                    break;
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
