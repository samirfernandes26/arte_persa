import 'package:arte_persa/src/core/extension/context_extension.dart';
import 'package:arte_persa/src/core/ui/constants.dart';
import 'package:arte_persa/src/core/ui/widgets/buttons/buttons.dart';
import 'package:arte_persa/src/pages/cadastro_pj/cadastro_pj_state.dart';
import 'package:arte_persa/src/pages/cadastro_pj/cadastro_pj_vm.dart';
import 'package:arte_persa/src/routes/route_generator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:validatorless/validatorless.dart';

class CadastroPjPage extends ConsumerStatefulWidget {
  const CadastroPjPage({super.key});

  @override
  ConsumerState<CadastroPjPage> createState() => _CadastroPjPageState();
}

class _CadastroPjPageState extends ConsumerState<CadastroPjPage> {
  final formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    final navigator = Navigator.of(context);

    final CadastroPjVm(
      :updateContatoWhatsapp,
      :updateStateCliente,
    ) = ref.watch(
      cadastroPjVmProvider.notifier,
    );

    final CadastroPjState cadastroVm = ref.watch(
      cadastroPjVmProvider,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cadastro de Cliente',
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
                Column(
                  children: [
                    const SizedBox(
                      height: 16,
                    ),
                    FormBuilderSwitch(
                      name: 'retem_iss',
                      initialValue: cadastroVm.cliente?.retemIss,
                      title: const DefaultTextStyle(
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                        child: Text('Retem ISS? '),
                      ),
                      onChanged: (value) {},
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    FormBuilderTextField(
                      name: 'razao_social*',
                      initialValue: cadastroVm.cliente?.razaoSocial,
                      onTapOutside: (_) => context.unfocus(),
                      decoration: InputDecoration(
                        labelText: 'Razão Socail*',
                        hintText: 'Razão Socail*',
                        hintStyle: TextStyle(
                          color: Colors.grey.shade600,
                        ),
                      ),
                      keyboardType: TextInputType.name,
                      validator: Validatorless.required(
                        'Razão e obrigatório',
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    FormBuilderTextField(
                      name: 'CNPJ*',
                      initialValue: cadastroVm.cliente?.cnpj,
                      inputFormatters: [
                        MaskTextInputFormatter(mask: '##.###.###/####-##')
                      ],
                      onTapOutside: (_) => context.unfocus(),
                      decoration: const InputDecoration(
                        labelText: 'CNPJ*',
                      ),
                      keyboardType: TextInputType.number,
                      validator: Validatorless.multiple(
                        [
                          Validatorless.required(
                            'CNPJ e obrigatório',
                          ),
                          Validatorless.cnpj(
                            'CNPJ inválido',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                FormBuilderTextField(
                  name: 'por_quem_procurar',
                  initialValue: cadastroVm.cliente?.porQuemProcurar,
                  onTapOutside: (_) => context.unfocus(),
                  decoration: const InputDecoration(
                    labelText: 'Por quem procurar*',
                  ),
                  keyboardType: TextInputType.number,
                  validator: Validatorless.required(
                    'Por quem procurar e obrigatório',
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Expanded(
                      child: FormBuilderTextField(
                        name: 'telefone_contato_um',
                        initialValue: cadastroVm.cliente?.telefoneContatoUm,
                        inputFormatters: [
                          MaskTextInputFormatter(mask: '(##) #####-####')
                        ],
                        onTapOutside: (_) => context.unfocus(),
                        decoration: const InputDecoration(
                          labelText: 'Telefone',
                        ),
                        keyboardType: TextInputType.phone,
                        validator: Validatorless.required(
                          'Número é obrigatório',
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    InkWell(
                      onTap: () {
                        updateContatoWhatsapp(
                          tipoContato: 1,
                          whatsapp: cadastroVm.telefoneContatoUmWhatsapp,
                        );
                      },
                      child: SizedBox(
                        width: 48,
                        height: 48,
                        child: Opacity(
                          // opacity: 1,
                          opacity: cadastroVm.telefoneContatoUmWhatsapp != true
                              ? 0.25
                              : 1.0,
                          child: Image.asset(
                            ImagesConstants.whatsapp,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Expanded(
                      child: FormBuilderTextField(
                        name: 'telefone_contato_dois',
                        initialValue: cadastroVm.cliente?.telefoneContatoDois,
                        inputFormatters: [
                          MaskTextInputFormatter(mask: '(##) #####-####')
                        ],
                        onTapOutside: (_) => context.unfocus(),
                        decoration: const InputDecoration(
                          labelText: 'Telefone alternativo',
                        ),
                        keyboardType: TextInputType.phone,
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    InkWell(
                      onTap: () {
                        updateContatoWhatsapp(
                          tipoContato: 2,
                          whatsapp: cadastroVm.telefoneContatoDoisWhatsapp,
                        );
                      },
                      child: SizedBox(
                        width: 48,
                        height: 48,
                        child: Opacity(
                          // opacity: 1,
                          opacity:
                              cadastroVm.telefoneContatoDoisWhatsapp != true
                                  ? 0.25
                                  : 1.0,
                          child: Image.asset(
                            ImagesConstants.whatsapp,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                FormBuilderTextField(
                  name: 'email',
                  initialValue: cadastroVm.cliente?.email,
                  onTapOutside: (_) => context.unfocus(),
                  decoration: const InputDecoration(
                    labelText: 'E-mail',
                    hintText: 'exemplo@exemplo.com',
                  ),
                  keyboardType: TextInputType.emailAddress,
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
              onPressed: () {},
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
                    await updateStateCliente(
                      clienteJson: formKey.currentState!.value,
                    );

                    navigator.pushNamed(
                      RouteGeneratorKeys.cadastroEnderecoPj,
                    );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
