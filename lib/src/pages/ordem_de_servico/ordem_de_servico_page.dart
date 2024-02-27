import 'dart:developer';

import 'package:arte_persa/src/core/extension/context_extension.dart';
import 'package:arte_persa/src/routes/route_generator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:image_picker/image_picker.dart';
import 'package:validatorless/validatorless.dart';

class OrdemDeServico extends StatefulWidget {
  const OrdemDeServico({super.key});

  @override
  State<OrdemDeServico> createState() => _OrdemDeServicoState();
}

class _OrdemDeServicoState extends State<OrdemDeServico> {
  final formKey = GlobalKey<FormBuilderState>();
  String? urlPhoto;
  List<String> listFiles = [];

  // uploadImage() async {
  //   ImagePicker imagePicker = ImagePicker();

  //   XFile? image = await imagePicker.pickImage(
  //     source: ImageSource.gallery,
  //     maxWidth: 2000,
  //     maxHeight: 2000,
  //     imageQuality: 90,
  //   );

  //   if (image != null) {
  //     log('nenhuma imagen selecionada, image: ${image.path} ');
  //   } else {
  //     log('nenhuma imagen selecionada');
  //   }
  // }

  // reload() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro Endereço do Cliente'),
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
                  name: 'Selecione um cliente',
                  decoration: const InputDecoration(
                    labelText: 'Selecione uma o serviço',
                  ),
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                  ), // Define a,
                  items: ['opçãoA', 'opçãoB']
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
                const SizedBox(
                  height: 16,
                ),
                FormBuilderRadioGroup(
                  name: 'Tipo de Item',
                  decoration: const InputDecoration(
                    labelText: 'Selecione o tipo de cliente',
                  ),
                  onChanged: (value) {
                    // Faça algo com o valor selecionado, se necessário
                  },
                  // validator: Validatorless.required('Tipo de cliete e obrigatorio'),
                  options: const [
                    FormBuilderFieldOption(
                      value: 1,
                      child: Text(
                        'Tapete',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    FormBuilderFieldOption(
                      value: 2,
                      child: Text(
                        'Estofado',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                FormBuilderTextField(
                  name: 'nome_item',
                  onTapOutside: (_) => context.unfocus(),
                  decoration: InputDecoration(
                    labelText: 'Nome do item',
                    hintText: 'Nome do item',
                    hintStyle: TextStyle(
                      color: Colors.grey.shade600,
                    ),
                  ),
                  keyboardType: TextInputType.name,
                  validator: Validatorless.required('Dê um nome ao item'),
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Flexible(
                      child: FormBuilderTextField(
                        name: 'comprimento',
                        onTapOutside: (_) => context.unfocus(),
                        decoration: InputDecoration(
                          labelText: 'Comprimento (m)',
                          hintText: 'Comprimento (m)',
                          hintStyle: TextStyle(
                            color: Colors.grey.shade600,
                          ),
                        ),
                        keyboardType: TextInputType.name,
                        validator: Validatorless.required('Nome é obrigatório'),
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Flexible(
                      child: FormBuilderTextField(
                        name: 'largura',
                        onTapOutside: (_) => context.unfocus(),
                        decoration: const InputDecoration(
                          labelText: 'Largura (m)',
                          hintText: 'Largura (m)',
                        ),
                        keyboardType: TextInputType.name,
                        validator: Validatorless.required('Nome é obrigatório'),
                      ),
                    ),
                  ],
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
                onPressed: () async {}, //loginUser,
                child: const Text('Cancelar'),
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
                onPressed: () async {}, //loginUser,
                child: const Text('Proximo'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// TODO: Verificar depois 
// Center(
//     child: (urlPhoto != null)
//         ? Image.network(
//             urlPhoto!,
//           )
//         : const CircleAvatar(
//             radius: 64,
//             child: Icon(Icons.person),
//           ),
//   ),
//   const Padding(
//     padding: EdgeInsets.all(16.0),
//     child: Divider(),
//   ),
//   const Text(
//     'Histórico de Imagens',
//     style: TextStyle(
//         color: Colors.white,
//         fontWeight: FontWeight.bold,
//         fontSize: 18),
//   ),
//   Column(
//     children: List.generate(
//       listFiles.length,
//       (index) {
//         String url = listFiles[index];
//         return Image.network(
//           url,
//         );
//       },
//     ),
//   ),