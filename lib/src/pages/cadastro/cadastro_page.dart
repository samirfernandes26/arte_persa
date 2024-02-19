import 'package:arte_persa/src/core/extension/context_extension.dart';
import 'package:arte_persa/src/core/ui/constants.dart';
import 'package:arte_persa/src/pages/cadastro/cadastro_vm.dart';
import 'package:arte_persa/src/routes/route_generator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lottie/lottie.dart';
import 'package:validatorless/validatorless.dart';
import 'package:flutter/material.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({super.key});

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  final formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final senha = TextEditingController();
  final nome = TextEditingController();
  final sobrenome = TextEditingController();
  final cpf = TextEditingController();
  final telefoneContatoUm = TextEditingController();
  final telefoneContatoDois = TextEditingController();
  final dataNascimento = TextEditingController();
  bool isChecked = false;

  late CadastroVm cadastroVm;

  @override
  void dispose() {
    email.dispose();
    senha.dispose();
    super.dispose();
  }

  Future<void> redisterUser() async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.text, password: senha.text);
  }

  @override
  void initState() {
    cadastroVm = CadastroVm();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de usuário ${cadastroVm.teste}'),
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
          child: Form(
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
                Text(cadastroVm.teste.toString()),
                Row(
                  children: [
                    Flexible(
                      child: TextFormField(
                        controller: nome,
                        onTapOutside: (_) => context.unfocus(),
                        decoration: InputDecoration(
                            labelText: 'Nome',
                            labelStyle: const TextStyle(
                              color: Colors.white,
                            ),
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
                      child: TextFormField(
                        controller: sobrenome,
                        onTapOutside: (_) => context.unfocus(),
                        decoration: const InputDecoration(
                          labelText: 'Sobrenome',
                          hintText: 'Sobrenome',
                          labelStyle: TextStyle(
                            color: Colors.white,
                          ),
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
                      child: TextFormField(
                        controller: cpf,
                        onTapOutside: (_) => context.unfocus(),
                        decoration: const InputDecoration(
                          labelText: 'CPF*',
                          hintText: 'xxx.xxx.xxx-xx',
                          labelStyle: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        keyboardType: TextInputType.number,
                        validator: Validatorless.required('CPF é obrigatório'),
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Flexible(
                      child: TextFormField(
                        controller: dataNascimento,
                        onTapOutside: (_) => context.unfocus(),
                        decoration: const InputDecoration(
                          labelText: 'Data de nascimento*',
                          hintText: 'xx/xx/xxxx',
                          labelStyle: TextStyle(
                            color: Colors.white,
                          ),
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
                      child: TextFormField(
                        controller: telefoneContatoUm,
                        onTapOutside: (_) => context.unfocus(),
                        decoration: const InputDecoration(
                          labelText: 'Telefone',
                          hintText: '(xx)9xxxx-xxxx',
                          labelStyle: TextStyle(
                            color: Colors.white,
                          ),
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
                          isChecked = !isChecked;
                        });
                      },
                      child: Container(
                        width: 48, // Ajuste conforme necessário
                        height: 48, // Ajuste conforme necessário
                        child: Opacity(
                          opacity: isChecked ? 0.25 : 1.0,
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
                      child: TextFormField(
                        controller: telefoneContatoDois,
                        onTapOutside: (_) => context.unfocus(),
                        decoration: const InputDecoration(
                          labelText: 'Telefone alternativo',
                          hintText: '(xx)9xxxx-xxxx',
                          labelStyle: TextStyle(
                            color: Colors.white,
                          ),
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
                          isChecked = !isChecked;
                        });
                      },
                      child: Container(
                        width: 48,
                        height: 48,
                        child: Opacity(
                          opacity: isChecked ? 0.25 : 1.0,
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
                TextFormField(
                  controller: email,
                  onTapOutside: (_) => context.unfocus(),
                  decoration: const InputDecoration(
                    labelText: 'E-mail',
                    hintText: 'exemplo@exemplo.com',
                    labelStyle: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  validator: Validatorless.required('Senha é obrigatório.'),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: senha,
                  onTapOutside: (_) => context.unfocus(),
                  decoration: const InputDecoration(
                    labelText: 'Senha',
                    hintText: '******',
                    labelStyle: TextStyle(
                      color: Colors.white,
                    ),
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
          onPressed: () {
            setState(() {
              cadastroVm.soma(1, 1);
            });
          }, //loginUser,
          child: const Text('Cadastrar'),
        ),
      ),
    );
  }
}
