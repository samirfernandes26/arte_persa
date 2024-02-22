import 'package:arte_persa/src/core/extension/context_extension.dart';
import 'package:arte_persa/src/core/ui/constants.dart';
import 'package:arte_persa/src/pages/login/login_vm.dart';
import 'package:arte_persa/src/routes/route_generator.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:validatorless/validatorless.dart';
import 'package:flutter/material.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    final LoginVm(:login) = ref.read(loginVmProvider.notifier);

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
                  child: FormBuilder(
                    key: formKey,
                    child: Column(
                      children: [
                        FormBuilderTextField(
                          name: 'email',
                          onTapOutside: (_) => context.unfocus(),
                          decoration: InputDecoration(
                              labelText: 'Email',
                              hintText: 'exemplo@exemplo.com',
                              hintStyle: TextStyle(
                                color: Colors.grey.shade600,
                              )),
                          keyboardType: TextInputType.emailAddress,
                          validator:
                              Validatorless.required('Email é obrigatório.'),
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
                          validator:
                              Validatorless.required('Senha é obrigatório.'),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              minimumSize: const Size.fromHeight(56),
                              backgroundColor:
                                  const Color.fromRGBO(0, 128, 0, 1)),
                          onPressed: () async {
                            switch (formKey.currentState?.saveAndValidate()) {
                              case (false || null):
                                break;
                              case (true):
                                bool rest = await login(
                                  formKey.currentState!.value['email'],
                                  formKey.currentState!.value['senha'],
                                );

                                if (rest) {
                                  Navigator.of(context).pushNamedAndRemoveUntil(
                                      RouteGeneratorKeys.cadastroServico,
                                      (route) => false);
                                }
                                // navigator.pop();
                                break;
                            }
                          }, //loginUser,
                          child: const Text('Entrar'),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              minimumSize: const Size.fromHeight(56),
                              backgroundColor:
                                  const Color.fromRGBO(231, 64, 74, 1)),
                          onPressed: () {
                            Navigator.of(context).pushNamedAndRemoveUntil(
                                RouteGeneratorKeys.cadastrar, (route) => false);
                          }, //loginUser,
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
