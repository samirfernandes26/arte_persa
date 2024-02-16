import 'package:arte_persa/src/core/ui/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

  @override
  void dispose() {
    email.dispose();
    senha.dispose();
    super.dispose();
  }

  Future<void> loginUser() async {
    final rest = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email.text, password: senha.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(16.00),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: email,
                          // onTapOutside: (_) => context.unfocus(),
                          decoration:
                              const InputDecoration(labelText: 'Usuário'),
                          keyboardType: TextInputType.number,
                          validator:
                              Validatorless.required('Senha é obrigatório.'),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        TextFormField(
                          controller: senha,
                          // onTapOutside: (_) => context.unfocus(),
                          decoration: const InputDecoration(labelText: 'Senha'),
                          obscureText: true,
                          validator:
                              Validatorless.required('Senha é obrigatório.'),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              minimumSize: const Size.fromHeight(46),
                              backgroundColor:
                                  const Color.fromRGBO(231, 64, 74, 1)),
                          onPressed: () {}, //loginUser,
                          child: const Text('Cadastrar'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
