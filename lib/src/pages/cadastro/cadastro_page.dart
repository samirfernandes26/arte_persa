import 'package:arte_persa/src/core/helpers/messages.dart';
import 'package:arte_persa/src/pages/cadastro/cadastro_state.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:arte_persa/src/core/extension/context_extension.dart';
import 'package:arte_persa/src/core/ui/constants.dart';
import 'package:arte_persa/src/pages/cadastro/cadastro_vm.dart';
import 'package:arte_persa/src/routes/route_generator.dart';
import 'package:lottie/lottie.dart';
import 'package:validatorless/validatorless.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CadastroPage extends ConsumerStatefulWidget {
  const CadastroPage({
    super.key,
  });

  @override
  ConsumerState<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends ConsumerState<CadastroPage> {
  final formKey = GlobalKey<FormBuilderState>();

  bool checkTeleconeConatatoUm = false;
  bool checkTeleconeConatatoDois = false;

  @override
  void dispose() {
    super.dispose();
  }

  // Future<void> redisterUser() async {

  // }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final CadastroVm(
      :salvaUsuario,
    ) = ref.read(cadastroVmProvider.notifier);

    ref.listen(cadastroVmProvider, (_, state) async {
      switch (state.status) {
        case CadastroStatus.initial:
          break;
        case CadastroStatus.loaded:
          break;
        case CadastroStatus.error:
          Messages.showErrors(state.message!, context);
          Navigator.of(context).pop(true);
        case CadastroStatus.success:
          Messages.showSuccess(state.message!, context);
          Navigator.of(context).popAndPushNamed(
            RouteGeneratorKeys.authLogin,
          );
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de usuário'),
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
                Lottie.asset(
                  'assets/lotties/register_arte_persa.json',
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
                        name: 'sobrenome',
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
                        onTapOutside: (_) => context.unfocus(),
                        decoration: const InputDecoration(
                          labelText: 'CPF*',
                          hintText: 'xxx.xxx.xxx-xx',
                        ),
                        keyboardType: TextInputType.number,
                        validator: Validatorless.required('CPF é obrigatório'),
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Flexible(
                      child: FormBuilderTextField(
                        name: 'dataNascimento',
                        onTapOutside: (_) => context.unfocus(),
                        decoration: const InputDecoration(
                          labelText: 'Data de nascimento*',
                          hintText: 'xx/xx/xxxx',
                        ),
                        keyboardType: TextInputType.number,
                        validator: Validatorless.required(
                            'Data de nascimento é obrigatório'),
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
                        name: 'telefoneContatoUm',
                        onTapOutside: (_) => context.unfocus(),
                        decoration: const InputDecoration(
                          labelText: 'Telefone',
                          hintText: '(xx)9xxxx-xxxx',
                        ),
                        keyboardType: TextInputType.phone,
                        validator:
                            Validatorless.required('Número é obrigatório'),
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
                        name: 'telefoneContatoDois',
                        onTapOutside: (_) => context.unfocus(),
                        decoration: const InputDecoration(
                          labelText: 'Telefone alternativo',
                          hintText: '(xx)9xxxx-xxxx',
                        ),
                        keyboardType: TextInputType.phone,
                        validator:
                            Validatorless.required('Número é obrigatório'),
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
                // navigator.pop();
                break;
            }
          }, //loginUser,
          child: const Text('Cadastrar'),
        ),
      ),
    );
  }
}
