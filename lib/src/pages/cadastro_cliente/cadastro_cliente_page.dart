import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:validatorless/validatorless.dart';

import 'package:arte_persa/src/core/extension/context_extension.dart';
import 'package:arte_persa/src/core/ui/constants.dart';
import 'package:arte_persa/src/core/ui/helpers/messages.dart';
import 'package:arte_persa/src/pages/cadastro_cliente/cadastro_cliente_vm.dart';
import 'package:arte_persa/src/routes/route_generator.dart';

class CadastroClientePage extends ConsumerStatefulWidget {
  const CadastroClientePage({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<CadastroClientePage> createState() =>
      _CadastroClientePageState();
}

class _CadastroClientePageState extends ConsumerState<CadastroClientePage> {
  final formKey = GlobalKey<FormBuilderState>();
  bool checkTeleconeConatatoUm = true;
  bool checkTeleconeConatatoDois = true;

  @override
  Widget build(BuildContext context) {
    final CadastroClienteVm(
      :updateStateCliente,
      :updateStatePessoaFisicaJuridica
    ) = ref.read(cadastroClienteVmProvider.notifier);
    final clienteVm = ref.watch(cadastroClienteVmProvider);

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
                FormBuilderRadioGroup(
                  name: 'tipo_cliente',
                  // initialValue: clienteVm.clienteForm?.tipoCliente ?? 1,
                  decoration: const InputDecoration(
                    labelText: 'Selecione o tipo de cliente*',
                  ),
                  onChanged: (value) {
                    // updateStatePessoaFisicaJuridica(value);
                  },
                  options: const [
                    FormBuilderFieldOption(
                      value: 1,
                      child: Text(
                        'Pessoa Física',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    FormBuilderFieldOption(
                      value: 2,
                      child: Text(
                        'Pessoa Jurídica',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                if (clienteVm.radioPJ == true)
                  Column(
                    children: [
                      const SizedBox(
                        height: 16,
                      ),
                      FormBuilderSwitch(
                        name: 'retem_iss',
                        initialValue: clienteVm.clienteForm?.retemIss,
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
                        initialValue: clienteVm.clienteForm?.razaoSocial,
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
                        initialValue: clienteVm.clienteForm?.cnpj,
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
                if (clienteVm.radioPF == true)
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
                              initialValue: clienteVm.clienteForm?.nome,
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
                              initialValue: clienteVm.clienteForm?.sobreNome,
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
                        initialValue: clienteVm.clienteForm?.cpf,
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
                        initialValue: clienteVm.clienteForm?.dataNascimento,
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
                  name: 'por_que_procurar',
                  initialValue: clienteVm.clienteForm?.porQuemProcurar,
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
                        initialValue: clienteVm.clienteForm?.telefoneContatoUm,
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
                        initialValue:
                            clienteVm.clienteForm?.telefoneContatoDois,
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
                  initialValue: clienteVm.clienteForm?.email,
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
                onPressed: () async {
                  switch (formKey.currentState?.saveAndValidate()) {
                    case (false || null):
                      break;
                    case (true):
                      await updateStateCliente(formKey.currentState!.value);
                      Navigator.of(context).pushNamed(
                          RouteGeneratorKeys.cadastroClienteEndereco);
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
