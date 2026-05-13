import 'package:form_builder_custom/form_builder_custom.dart';

import 'package:asyncstate/asyncstate.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class AutenticacaoScreen extends ConsumerStatefulWidget {
  const AutenticacaoScreen({super.key});

  @override
  ConsumerState<AutenticacaoScreen> createState() => _AutenticacaoScreenState();
}

class _AutenticacaoScreenState extends ConsumerState<AutenticacaoScreen> {
  final formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    final autenticacaoVm = ref.read(autenticacaoScreenVmProvider.notifier);

    final autenticacaoState = ref.watch(autenticacaoScreenVmProvider);

    if (autenticacaoState.status == AutenticacaoScreenStatus.intial) {
      autenticacaoVm.fetchMunicipios();
    }

    ref.listen(autenticacaoScreenVmProvider, (_, state) {
      switch (state.status) {
        case AutenticacaoScreenStatus.error:
          context.showSnackMessage(
            title: 'Erro ao realizar o login',
            message: state.message!,
            contentType: ContentType.failure,
          );

        case AutenticacaoScreenStatus.success:
          context.showSnackMessage(
            title: 'Sucesso',
            message: state.message!,
            contentType: ContentType.success,
          );
          context.navigator.pushNamedAndRemoveUntil(
            RouteGeneratorKeys.painel,
            (_) => false,
          );
        default:
          break;
      }
    });

    return Scaffold(
      body: FormBuilder(
        key: formKey,
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(ImagesConstants.backgroundImg),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(16.00),
                  decoration: ShapeDecoration(
                    color: context.theme.colorScheme.surface,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    shadows: const [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 10,
                        offset: Offset(0, 5),
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        FormBuilderTextField(
                          name: 'usuario',
                          decoration: const InputDecoration(
                            labelText: 'Usuário *',
                          ),
                          keyboardType: TextInputType.number,
                          initialValue: null,
                          validator: FormBuilderValidators.required(
                            errorText: 'Usuário é obrigatório',
                          ),
                        ),
                        const SizedBox(height: 8),
                        FormBuilderTextField(
                          name: 'senha',
                          obscureText: !autenticacaoState.showPassword,
                          decoration: InputDecoration(
                            labelText: 'Senha *',
                            suffixIcon: IconButton(
                              icon: Icon(
                                !autenticacaoState.showPassword
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: () {
                                autenticacaoVm.toogleShowPassword();
                              },
                            ),
                          ),
                          initialValue: null,
                          validator: FormBuilderValidators.required(
                            errorText: 'Senha é obrigatório',
                          ),
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () async {
                            switch (formKey.currentState?.saveAndValidate()) {
                              case (false || null):
                                break;
                              case (true):
                                autenticacaoVm
                                    .handleSignIn(formKey.currentState!.value)
                                    .asyncLoader();
                            }
                          },
                          child: const Text(
                            'Acessar',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
