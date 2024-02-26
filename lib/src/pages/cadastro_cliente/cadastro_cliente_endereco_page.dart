import 'package:arte_persa/src/routes/route_generator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CadastroClienteEnderecoPage extends ConsumerStatefulWidget {
  const CadastroClienteEnderecoPage({
    Key? key,
  }) : super(key: key);

  @override
  _CadastroClienteEnderecoPageState createState() => _CadastroClienteEnderecoPageState();
}

class _CadastroClienteEnderecoPageState extends ConsumerState<CadastroClienteEnderecoPage> {
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
                onPressed: () {}, //loginUser,
                child: const Text('Proximo'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

