import 'package:arte_persa/src/core/extension/context_extension.dart';
import 'package:arte_persa/src/core/ui/constants.dart';
import 'package:arte_persa/src/core/ui/widgets/buttons/buttons.dart';
import 'package:arte_persa/src/model/cliente_pf_model.dart';
import 'package:arte_persa/src/pages/cadastro_pf/cadastro_pf_state.dart';
import 'package:arte_persa/src/pages/cadastro_pf/cadastro_pf_vm.dart';
import 'package:arte_persa/src/routes/route_generator.dart';
import 'package:asyncstate/asyncstate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CadastroPfEnderecoPage extends ConsumerStatefulWidget {
  const CadastroPfEnderecoPage({super.key});

  @override
  ConsumerState<CadastroPfEnderecoPage> createState() =>
      _CadastroPfEnderecoPageState();
}

class _CadastroPfEnderecoPageState
    extends ConsumerState<CadastroPfEnderecoPage> {
  final formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    final navigator = Navigator.of(context);

    final CadastroPfVm(
      :register,
      :updateStateEndereco,
    ) = ref.watch(
      cadastroPfVmProvider.notifier,
    );

    final CadastroPfState cadastroVm = ref.watch(
      cadastroPfVmProvider,
    );

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
                  initialValue: cadastroVm.cliente!.endereco?.cep,
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
                  initialValue: cadastroVm.cliente!.endereco?.logradouro,
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
                        initialValue: cadastroVm.cliente!.endereco?.numero,
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
                        initialValue: cadastroVm.cliente!.endereco?.complemento,
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
                        initialValue: cadastroVm.cliente!.endereco?.bairro,
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
                        initialValue: cadastroVm.cliente!.endereco?.estado,
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
                  initialValue: cadastroVm.cliente!.endereco?.referencia,
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
                    await updateStateEndereco(
                      enderecoJson: formKey.currentState!.value,
                    );
                    navigator.pop();
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
                    ClientePfModel? result = await register(
                      enderecoJson: formKey.currentState!.value,
                    ).asyncLoader();

                    if (result != null) {
                      navigator.pushNamed(
                        RouteGeneratorKeys.visulizarCliente,
                        arguments: {
                          'id': result.id,
                          'cliente': result,
                        },
                      );
                    } else {
                      navigator.pushNamed(
                        RouteGeneratorKeys.home,
                      );
                    }

                    navigator.pushNamed(
                      RouteGeneratorKeys.home,
                    );
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
