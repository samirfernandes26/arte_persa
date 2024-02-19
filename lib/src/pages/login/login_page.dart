import 'package:arte_persa/src/core/ui/constants.dart';
import 'package:arte_persa/src/routes/route_generator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:validatorless/validatorless.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: email.text, password: senha.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Center(
                  child: Image.asset(
                    ImagesConstants.artePersaLogo,
                    semanticLabel: 'Arte Persa',
                    width: 320,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(16.00),
                decoration: const ShapeDecoration(
                  // color: Color(0x00161719),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  shadows: [
                    BoxShadow(
                      color: Color(0xFF000000),
                    ),
                  ],
                ),
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
                          validator:Validatorless.required('Senha é obrigatório.'),
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
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size.fromHeight(56),
                            backgroundColor: const Color.fromRGBO(0, 128, 0, 1)
                          ),
                          onPressed: (){},//loginUser,
                          child: const Text('Entrar'),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size.fromHeight(46),
                            backgroundColor: const Color.fromRGBO(231, 64, 74, 1)
                          ),
                          onPressed: (){
                            Navigator.of(context).pushNamedAndRemoveUntil(RouteGeneratorKeys.cadastrar, (route) => false);
                          },//loginUser,
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
