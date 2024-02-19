import 'package:arte_persa/src/core/ui/constants.dart';
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
  Widget build(BuildContext context) {
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
          child: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                // Lottie.asset(
                //   'register_arte_persa.json',
                //   // width: 140,
                //   fit: BoxFit.fill,
                // ),
                Row(
                  children: [
                    Flexible(
                      child: TextFormField(
                        controller: nome,
                        // onTapOutside: (_) => context.unfocus(),
                        decoration:
                            const InputDecoration(labelText: 'Seu nome'),
                        keyboardType: TextInputType.number,
                        validator: Validatorless.required('Nome é obrigatório'),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Flexible(
                      child: TextFormField(
                        controller: sobrenome,
                        // onTapOutside: (_) => context.unfocus(),
                        decoration:
                            const InputDecoration(labelText: 'Seu nome'),
                        keyboardType: TextInputType.number,
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
                        // onTapOutside: (_) => context.unfocus(),
                        decoration: const InputDecoration(labelText: 'CPF*'),
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
                        // onTapOutside: (_) => context.unfocus(),
                        decoration: const InputDecoration(
                            labelText: 'Data de nascimento*'),
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
                        // onTapOutside: (_) => context.unfocus(),
                        decoration:
                            const InputDecoration(labelText: 'Telefone'),
                        keyboardType: TextInputType.number,
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
                        // onTapOutside: (_) => context.unfocus(),
                        decoration: const InputDecoration(
                            labelText: 'Telefone alternativo'),
                        keyboardType: TextInputType.number,
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

                TextFormField(
                  controller: email,
                  // onTapOutside: (_) => context.unfocus(),
                  decoration: const InputDecoration(labelText: 'E-mail'),
                  keyboardType: TextInputType.number,
                  validator: Validatorless.required('Senha é obrigatório.'),
                ),

                const SizedBox(
                  height: 16,
                ),

                TextFormField(
                  controller: senha,
                  // onTapOutside: (_) => context.unfocus(),
                  decoration: const InputDecoration(labelText: 'Senha'),
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
          onPressed: () {}, //loginUser,
          child: const Text('Cadastrar'),
        ),
      ),
    );
  }
}
