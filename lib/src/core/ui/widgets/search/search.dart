import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class Search extends StatelessWidget {
  const Search({super.key, this.onChanged});

  final void Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        FormBuilderTextField(
          name: 'search',
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.search, color: Colors.grey),
            hintText: 'Faça a sua busca',
            enabledBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(8.0)),
              borderSide: BorderSide(
                color: context.brightness == Brightness.light
                    ? Colors.blueAccent
                    : Colors.transparent,
                width: 1.0,
              ),
            ),
            filled: true,
          ),
          onChanged: onChanged,
        ),
      ],
    );
  }
}
