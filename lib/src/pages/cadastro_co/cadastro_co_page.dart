import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:lottie/lottie.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:validatorless/validatorless.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:arte_persa/src/core/ui/helpers/messages.dart';
import 'package:arte_persa/src/pages/cadastro_co/cadastro_co_state.dart';
import 'package:arte_persa/src/core/ui/constants.dart';
import 'package:arte_persa/src/pages/cadastro_co/cadastro_co_vm.dart';
import 'package:arte_persa/src/routes/route_generator.dart';
import 'package:arte_persa/src/core/extension/context_extension.dart';

class CadastroCoPage extends ConsumerStatefulWidget {
  const CadastroCoPage({
    super.key,
  });

  @override
  ConsumerState<CadastroCoPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends ConsumerState<CadastroCoPage> {
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
    final navigator = Navigator.of(context);

    final CadastroCoVm(
      :salvaUsuario,
      :updateContatoWhatsapp,
    ) = ref.read(
      cadastroCoVmProvider.notifier,
    );

    final CadastroCoState cadastroVm = ref.watch(
      cadastroCoVmProvider,
    );

    ref.listen(cadastroCoVmProvider, (_, state) async {
      switch (state.status) {
        case CadastroCoStatus.initial:
          break;
        case CadastroCoStatus.loaded:
          break;
        case CadastroCoStatus.error:
          Messages.showErrors(state.message!, context);
          Navigator.of(context).pop(true);
        case CadastroCoStatus.success:
          Messages.showSuccess(state.message!, context);
          Navigator.of(context).popAndPushNamed(
            RouteGeneratorKeys.authLogin,
          );
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cadastro de usuário',
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
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
                  LottieConstants.registerArtePersa,
                  height: 160,
                  fit: BoxFit.fill,
                ),
                const SizedBox(
                  height: 32,
                ),
                Row(
                  children: [
                    Flexible(
                      child: FormBuilderTextField(
                        name: 'nome',
                        onTapOutside: (_) => context.unfocus(),
                        decoration: InputDecoration(
                            labelText: 'Nome',
                            hintText: 'Nome',
                            hintStyle: TextStyle(
                              color: Colors.grey.shade600,
                            )),
                        keyboardType: TextInputType.name,
                        validator: Validatorless.required('Nome é obrigatório'),
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Flexible(
                      child: FormBuilderTextField(
                        name: 'sobre_nome',
                        onTapOutside: (_) => context.unfocus(),
                        decoration: const InputDecoration(
                          labelText: 'Sobrenome',
                          hintText: 'Sobrenome',
                        ),
                        keyboardType: TextInputType.name,
                        validator: Validatorless.required('Nome é obrigatório'),
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
                        name: 'cpf',
                        inputFormatters: [
                          MaskTextInputFormatter(mask: '###.###.###-##')
                        ],
                        onTapOutside: (_) => context.unfocus(),
                        decoration: const InputDecoration(
                          labelText: 'CPF*',
                        ),
                        keyboardType: TextInputType.number,
                        validator: Validatorless.multiple([
                          Validatorless.required('CPF é obrigatório'),
                          Validatorless.cpf('CPF inválido'),
                        ]),
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Flexible(
                      child: FormBuilderTextField(
                        name: 'data_nascimento',
                        inputFormatters: [
                          MaskTextInputFormatter(mask: '##/##/####')
                        ],
                        onTapOutside: (_) => context.unfocus(),
                        decoration: const InputDecoration(
                          labelText: 'Data de nascimento*',
                        ),
                        keyboardType: TextInputType.number,
                        validator: Validatorless.required(
                          'Data de nascimento é obrigatório',
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
                        name: 'telefone_contato_um',
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
                          opacity:
                              cadastroVm.telefoneContatoUmWhatsapp ? 1.0 : 0.25,
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
                          opacity: cadastroVm.telefoneContatoDoisWhatsapp
                              ? 1.0
                              : 0.25,
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
                  onTapOutside: (_) => context.unfocus(),
                  decoration: const InputDecoration(
                    labelText: 'E-mail',
                    hintText: 'exemplo@exemplo.com',
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: Validatorless.required('Senha é obrigatório.'),
                ),
                const SizedBox(
                  height: 16,
                ),
                FormBuilderTextField(
                  name: 'senha',
                  onTapOutside: (_) => context.unfocus(),
                  decoration: const InputDecoration(
                    labelText: 'Senha',
                    hintText: '******',
                  ),
                  obscureText: true,
                  validator: Validatorless.required('Senha é obrigatório.'),
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
                await salvaUsuario(formKey.currentState!.value);
                navigator.pushNamedAndRemoveUntil(
                  RouteGeneratorKeys.home,
                  (route) => false,
                );
                break;
            }
          }, //loginUser,
          child: const Text('Cadastrar'),
        ),
      ),
    );
  }
}
