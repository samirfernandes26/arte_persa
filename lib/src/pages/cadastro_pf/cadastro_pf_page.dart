import 'package:arte_persa/src/core/extension/context_extension.dart';
import 'package:arte_persa/src/core/ui/constants.dart';
import 'package:arte_persa/src/core/ui/widgets/buttons/buttons.dart';
import 'package:arte_persa/src/pages/cadastro_pf/cadastro_pf_state.dart';
import 'package:arte_persa/src/pages/cadastro_pf/cadastro_pf_vm.dart';
import 'package:arte_persa/src/routes/route_generator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:validatorless/validatorless.dart';

class CadastroPfPage extends ConsumerStatefulWidget {
  const CadastroPfPage({super.key});

  @override
  ConsumerState<CadastroPfPage> createState() => _CadastroPfPageState();
}

class _CadastroPfPageState extends ConsumerState<CadastroPfPage> {
  final formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    final navigator = Navigator.of(context);

    final CadastroPfVm(
      :updateContatoWhatsapp,
      :updateStateCliente,
    ) = ref.watch(
      cadastroPfVmProvider.notifier,
    );

    final CadastroPfState cadastroVm = ref.watch(
      cadastroPfVmProvider,
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
                    Row(
                      children: [
                        Flexible(
                          child: FormBuilderTextField(
                            name: 'nome',
                            initialValue: cadastroVm.cliente?.nome,
                            onTapOutside: (_) => context.unfocus(),
                            decoration: InputDecoration(
                              labelText: 'Nome*',
                              hintText: 'Nome',
                              hintStyle: TextStyle(
                                color: Colors.grey.shade600,
                              ),
                            ),
                            keyboardType: TextInputType.name,
                            validator: Validatorless.required(
                              'Nome é obrigatório',
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Flexible(
                          child: FormBuilderTextField(
                            name: 'sobre_nome',
                            initialValue: cadastroVm.cliente?.sobreNome,
                            onTapOutside: (_) => context.unfocus(),
                            decoration: const InputDecoration(
                              labelText: 'Sobrenome*',
                              hintText: 'Sobrenome',
                            ),
                            keyboardType: TextInputType.name,
                            validator: Validatorless.required(
                              'Nome é obrigatório',
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    FormBuilderTextField(
                      name: 'cpf',
                      initialValue: cadastroVm.cliente?.cpf,
                      inputFormatters: [
                        MaskTextInputFormatter(mask: '###.###.###-##')
                      ],
                      onTapOutside: (_) => context.unfocus(),
                      decoration: const InputDecoration(
                        labelText: 'CPF*',
                      ),
                      keyboardType: TextInputType.number,
                      validator: Validatorless.multiple(
                        [
                          Validatorless.required(
                            'Razão e obrigatório',
                          ),
                          Validatorless.cpf(
                            'CPF inválido',
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    FormBuilderTextField(
                      name: 'data_nascimento',
                      initialValue: cadastroVm.cliente?.dataNascimento,
                      inputFormatters: [
                        MaskTextInputFormatter(mask: '##/##/####')
                      ],
                      onTapOutside: (_) => context.unfocus(),
                      decoration: const InputDecoration(
                        labelText: 'Data de nascimento',
                      ),
                      keyboardType: TextInputType.number,
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
                      RouteGeneratorKeys.cadastroEnderecoPf,
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
