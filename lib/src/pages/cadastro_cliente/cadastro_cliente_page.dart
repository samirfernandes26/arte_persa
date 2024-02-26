import 'package:arte_persa/src/core/extension/context_extension.dart';
import 'package:arte_persa/src/core/ui/constants.dart';
import 'package:arte_persa/src/core/ui/helpers/messages.dart';
import 'package:arte_persa/src/routes/route_generator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:validatorless/validatorless.dart';

class CadastroClientePage extends ConsumerStatefulWidget {
  const CadastroClientePage({
    Key? key,
  }) : super(key: key);

  @override
  _CadastroClientePageState createState() => _CadastroClientePageState();
}

class _CadastroClientePageState extends ConsumerState<CadastroClientePage> {
  final formKey = GlobalKey<FormBuilderState>();
  bool checkTeleconeConatatoUm = true;
  bool checkTeleconeConatatoDois = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de Cliente'),
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
                // Lottie.asset(
                //   LottieConstants.registerArtePersa,
                //   height: 120,
                //   fit: BoxFit.fill,
                // ),
                // const SizedBox(
                //   height: 8,
                // ),
                FormBuilderDropdown(
                  name: 'tipo_cliente',
                  decoration: const InputDecoration(
                    labelText: 'Selecione tipo de cliente',
                  ),
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                  onChanged: (value) {},
                  items: ['Pessoa Física', 'Pessoa juridica']
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
                ),
                const SizedBox(
                  height: 16,
                ),
                FormBuilderSwitch(
                  name: 'retem_iss',
                  title: const DefaultTextStyle(
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                    child: Text('Retem ISS? '),
                  ),
                  initialValue: false,
                  onChanged: (value) {},
                ),
                const SizedBox(
                  height: 16,
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
                FormBuilderTextField(
                  name: 'razao_social',
                  onTapOutside: (_) => context.unfocus(),
                  decoration: InputDecoration(
                      labelText: 'razao_social',
                      hintText: 'razao_social',
                      hintStyle: TextStyle(
                        color: Colors.grey.shade600,
                      )),
                  keyboardType: TextInputType.name,
                ),
                const SizedBox(
                  height: 16,
                ),
                FormBuilderTextField(
                  name: 'cpf',
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
                      Validatorless.cpf('CPF inválido'),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                FormBuilderTextField(
                  name: 'CNPJ',
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
                      Validatorless.cnpj('CNPJ inválido'),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                FormBuilderTextField(
                  name: 'data_nascimento',
                  inputFormatters: [MaskTextInputFormatter(mask: '##/##/####')],
                  onTapOutside: (_) => context.unfocus(),
                  decoration: const InputDecoration(
                    labelText: 'Data de nascimento*',
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 16,
                ),
                FormBuilderTextField(
                  name: 'por_que_procurar',
                  onTapOutside: (_) => context.unfocus(),
                  decoration: const InputDecoration(
                    labelText: 'Por quem procurar*',
                  ),
                  keyboardType: TextInputType.number,
                  validator: Validatorless.required(
                    'Por quem procurar e obrigatorio',
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
                        // Atualiza o estado do checkbox quando clicado
                        setState(() {
                          checkTeleconeConatatoUm = !checkTeleconeConatatoUm;
                        });
                      },
                      child: SizedBox(
                        width: 48,
                        height: 48,
                        child: Opacity(
                          opacity: checkTeleconeConatatoUm ? 0.25 : 1.0,
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
                        // Atualiza o estado do checkbox quando clicado
                        setState(() {
                          checkTeleconeConatatoDois =
                              !checkTeleconeConatatoDois;
                        });
                      },
                      child: SizedBox(
                        width: 48,
                        height: 48,
                        child: Opacity(
                          opacity: checkTeleconeConatatoDois ? 0.25 : 1.0,
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
                onPressed: () {}, //loginUser,
                child: const Text('Sair'),
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
                onPressed: () {
                  switch (formKey.currentState?.saveAndValidate()) {
                    case (false || null):
                      Messages.showErrors(
                          'Preencha o formulário corretamente', context);
                    case true:
                      Navigator.of(context)
                          .pushNamed(RouteGeneratorKeys.cadastroClienteEndereco);
                  }
                }, //loginUser,
                child: const Text('Proximo'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
