import 'package:arte_persa/src/core/ui/constants.dart';
import 'package:arte_persa/src/routes/route_generator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';

class CadastroClientePage extends ConsumerStatefulWidget {
  const CadastroClientePage({
    Key? key,
  }) : super(key: key);

  @override
  _CadastroClientePageState createState() => _CadastroClientePageState();
}

class _CadastroClientePageState extends ConsumerState<CadastroClientePage> {
   final formKey = GlobalKey<FormBuilderState>();
   
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
          child: FormBuilder(
            key:formKey,
            child:Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Lottie.asset(
                  LottieConstants.registerArtePersa,
                  height: 160,
                  fit: BoxFit.fill,
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
