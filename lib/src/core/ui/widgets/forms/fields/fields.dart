import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';
import 'package:arte_persa/src/core/ui/widgets/forms/form_builder_custom.dart';

typedef InputOption<T> = OptionField<T>;

Widget selectCustomField<T>(
  BuildContext context, {
  required String name,
  required String label,
  bool? isRequired,
  List<InputOption<T>>? options,
  // Widget? secondary,
  String? Function(T?)? validator,
  T? initialValue,
  void Function(T?)? onChanged,
  bool enabled = true,
  required Widget Function(BuildContext) itemBuilder,
}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$label ${isRequired == true ? '*' : ''}',
          style: const TextStyle(
            color: Colors.blueAccent,
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
        FormBuilderLazySelect(
          name: name,
          itemBuilder: itemBuilder,
          validator: validator,
          enabled: enabled,
          hintText: label,
          initialValue: initialValue,
          onChanged: onChanged,
          options: options,
        ),
      ],
    ),
  );
}

Widget selectField<T>(
  BuildContext context, {
  required String name,
  required String label,
  bool? isRequired,
  Widget? secondary,
  String? Function(T?)? validator,
  required List<InputOption<T>> options,
  T? initialValue,
  void Function(T?)? onChanged,
  bool enabled = true,
}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$label ${isRequired == true ? '*' : ''}',
          style: const TextStyle(
            color: Colors.blueAccent,
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
        FormBuilderDropdown<T>(
          enabled: enabled,
          name: name,
          decoration: InputDecoration(hintText: label),
          initialValue: initialValue,
          items: [
            DropdownMenuItem<T>(value: null, child: const Text('Selecione')),
            ...options.map(
              (option) => DropdownMenuItem<T>(
                value: option.value,
                child: Text(option.description),
              ),
            ),
          ],
          onChanged: onChanged,
          validator: validator,
        ),
      ],
    ),
  );
}

Widget selectFieldHelp<T>(
  BuildContext context, {
  required String name,
  required String label,
  bool? isRequired,
  Widget? secondary,
  String? Function(T?)? validator,
  required List<InputOption<T>> options,
  T? initialValue,
  void Function(T?)? onChanged,
  void Function()? openHelp,
  bool enabled = true,
}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              '$label ${isRequired == true ? '*' : ''}',
              style: const TextStyle(
                color: Colors.blueAccent,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
            IconButton(
              onPressed: openHelp,
              icon: Icon(Icons.help_outline, color: Colors.blueAccent),
            ),
          ],
        ),
        FormBuilderDropdown<T>(
          enabled: enabled,
          name: name,
          decoration: InputDecoration(hintText: label),
          initialValue: initialValue,
          items: [
            DropdownMenuItem<T>(value: null, child: const Text('Selecione')),
            ...options.map(
              (option) => DropdownMenuItem<T>(
                value: option.value,
                child: Text(option.description),
              ),
            ),
          ],
          onChanged: onChanged,
          validator: validator,
        ),
      ],
    ),
  );
}

Widget radioGroup<T>(
  BuildContext context, {
  required String name,
  required String label,
  required List<InputOption<T>> options,
  bool? isRequired,
  String? Function(T?)? validator,
  bool enabled = true,
  void Function(T?)? onChanged,
  OptionsOrientation orientation = OptionsOrientation.vertical,
  T? initialValue,
}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$label ${isRequired == true ? '*' : ''}',
          style: const TextStyle(
            color: Colors.blueAccent,
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
        FormBuilderRadioGroup<T>(
          enabled: enabled,
          name: name,
          decoration: const InputDecoration(
            fillColor: Colors.transparent,
            border: InputBorder.none,
          ),
          orientation: orientation,
          onChanged: onChanged,
          options: options
              .map(
                (option) => FormBuilderFieldOption(
                  value: option.value,
                  child: Text(option.description),
                ),
              )
              .toList(),
          initialValue: initialValue,
          validator: validator,
        ),
      ],
    ),
  );
}

Widget checkboxGroup<T>(
  BuildContext context, {
  required String name,
  required String label,
  required List<InputOption<T>> options,
  bool? isRequired,
  String? Function(List<T>?)? validator,
  bool enabled = true,
  void Function(List<T>?)? onChanged,
  OptionsOrientation orientation = OptionsOrientation.vertical,
  List<T>? initialValue,
}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != '')
          Text(
            '$label ${isRequired == true ? '*' : ''}',
            style: const TextStyle(
              color: Colors.blueAccent,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
        FormBuilderCheckboxGroup<T>(
          name: name,
          options: options
              .map(
                (option) => FormBuilderFieldOption(
                  value: option.value,
                  child: Text(option.description),
                ),
              )
              .toList(),
          enabled: enabled,
          orientation: orientation,
          decoration: const InputDecoration(
            fillColor: Colors.transparent,
            border: InputBorder.none,
          ),
          initialValue: initialValue,
          onChanged: onChanged,
          validator: validator,
        ),
      ],
    ),
  );
}

Widget checkSingle(
  BuildContext context, {
  required String name,
  required String label,
  required Widget title,
  bool? isRequired,
  String? Function(bool?)? validator,
  bool enabled = true,
  void Function(bool?)? onChanged,
  bool? initialValue,
}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$label ${isRequired == true ? '*' : ''}',
          style: const TextStyle(
            color: Colors.blueAccent,
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
        FormBuilderSwitch(
          title: title,
          activeColor: Colors.green,
          activeTrackColor: Colors.green.shade800,
          name: name,
          enabled: enabled,
          decoration: const InputDecoration(
            fillColor: Colors.transparent,
            border: InputBorder.none,
            contentPadding: EdgeInsets.zero,
          ),
          initialValue: initialValue,
          onChanged: onChanged,
          validator: validator,
        ),
      ],
    ),
  );
}

Widget datetimeField(
  BuildContext context, {
  required String name,
  required String label,
  bool? isRequired,
  Widget? secondary,
  String? Function(DateTime?)? validator,
  List<TextInputFormatter>? inputFormatters,
  void Function(DateTime?)? onChanged,
  DateTime? initialValue,
  InputType? inputType,
  bool enabled = true,
}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 16.0),
    child: Column(
      children: [
        Text(
          '$label ${isRequired == true ? '*' : ''}',
          style: const TextStyle(
            color: Colors.blueAccent,
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
        FormBuilderDateTimePicker(
          enabled: enabled,
          lastDate: DateTime.now(),
          currentDate: DateTime.now(),
          name: name,
          onChanged: onChanged,
          initialValue: initialValue,
          format: DateFormat('dd/MM/yyyy HH:mm'),
          decoration: InputDecoration(hintText: label),
          validator: validator,
          inputFormatters: inputFormatters,
          initialEntryMode: DatePickerEntryMode.calendar,
          initialDatePickerMode: DatePickerMode.year,
          inputType: inputType ?? InputType.both,
        ),
        if (secondary != null) secondary,
      ],
    ),
  );
}

Widget dateField(
  BuildContext context, {
  required String name,
  required String label,
  DateTime? firstDate,
  DateTime? lastDate,
  bool? isRequired,
  Widget? secondary,
  String? Function(DateTime?)? validator,
  List<TextInputFormatter>? inputFormatters,
  void Function(DateTime?)? onChanged,
  DateTime? initialValue,
  InputType? inputType,
  bool enabled = true,
}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$label ${isRequired == true ? '*' : ''}',
          style: const TextStyle(
            color: Colors.blueAccent,
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
        FormBuilderDateTimePicker(
          enabled: enabled,
          firstDate: firstDate,
          lastDate: lastDate ?? DateTime.now(),
          currentDate: DateTime.now(),
          name: name,
          onChanged: onChanged,
          initialValue: initialValue,
          format: DateFormat('dd/MM/yyyy'),
          decoration: InputDecoration(hintText: label),
          validator: validator,
          inputFormatters: inputFormatters,
          initialEntryMode: DatePickerEntryMode.calendar,
          initialDatePickerMode: DatePickerMode.year,
          inputType: inputType ?? InputType.date,
        ),
        if (secondary != null) secondary,
      ],
    ),
  );
}

Widget textField<T>(
  BuildContext context, {
  required String name,
  required String label,
  String? hintText,
  bool? isRequired,
  Widget? secondary,
  void Function(PointerDownEvent)? onTapOutside,
  String? Function(String?)? validator,
  List<TextInputFormatter>? inputFormatters,
  T Function(String?)? valueTransformer,
  TextInputType? keyboardType,
  void Function(String?)? onChanged,
  int? maxLength,
  String? initialValue,
  bool? readOnly,
  bool enabled = true,
  int? minLines,
  int? maxLines,
}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$label ${isRequired == true ? '*' : ''}',
          style: const TextStyle(
            color: Colors.blueAccent,
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
        FormBuilderTextField(
          name: name,
          enabled: enabled,
          readOnly: readOnly ?? false,
          keyboardType: keyboardType,
          onTapOutside: onTapOutside,
          onChanged: onChanged,
          initialValue: initialValue,
          valueTransformer: valueTransformer,
          decoration: InputDecoration(hintText: hintText ?? label),
          validator: validator,
          maxLength: maxLength,
          maxLengthEnforcement: MaxLengthEnforcement.enforced,
          inputFormatters: [UpperCaseTextFormatter(), ...?inputFormatters],
          minLines: minLines,
          maxLines: maxLines,
        ),
        if (secondary != null) secondary,
      ],
    ),
  );
}

Widget textFieldCidadao<T>(
  BuildContext context, {
  required String name,
  required String label,
  String? hintText,
  bool? isRequired,
  Widget? secondary,
  FocusNode? focusNode,
  String? Function(String?)? validator,
  List<TextInputFormatter>? inputFormatters,
  T Function(String?)? valueTransformer,
  void Function(PointerDownEvent)? onTapOutside,
  TextInputType? keyboardType,
  void Function(String?)? onChanged,
  int? maxLength,
  String? initialValue,
  bool? readOnly,
  bool enabled = true,
  int? minLines,
  int? maxLines,
}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$label ${isRequired == true ? '*' : ''}',
          style: const TextStyle(
            color: Colors.blueAccent,
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
        FormBuilderTextField(
          focusNode: focusNode,
          name: name,
          enabled: enabled,
          readOnly: readOnly ?? false,
          keyboardType: keyboardType,
          onTapOutside: onTapOutside,
          onChanged: onChanged,
          initialValue: initialValue,
          valueTransformer: valueTransformer,
          decoration: InputDecoration(hintText: hintText ?? label),
          validator: validator,
          maxLength: maxLength,
          maxLengthEnforcement: MaxLengthEnforcement.enforced,
          inputFormatters: [UpperCaseTextFormatter(), ...?inputFormatters],
          minLines: minLines,
          maxLines: maxLines,
        ),
        if (secondary != null) secondary,
      ],
    ),
  );
}

Widget autoCompleteField(
  BuildContext context, {
  required String name,
  required String label,
  required FutureOr<Iterable<String>> Function(TextEditingValue) optionsBuilder,
  void Function(String)? onSelected,
  void Function(PointerDownEvent)? onTapOutside,
  String? hintText,
  bool? isRequired,
  Widget? secondary,
  String? Function(String?)? validator,
  List<TextInputFormatter>? inputFormatters,
  TextInputType? keyboardType,
  void Function(String?)? onChanged,
  String? initialValue,
  bool enabled = true,
  int? maxLength,
}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$label ${isRequired == true ? '*' : ''}',
          style: const TextStyle(
            color: Colors.blueAccent,
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
        Autocomplete(
          initialValue: TextEditingValue(text: initialValue ?? ''),
          fieldViewBuilder: (context, textEditingController, focusNode, _) {
            return FormBuilderTextField(
              name: name,
              controller: textEditingController,
              focusNode: focusNode,
              onChanged: onChanged,
              keyboardType: keyboardType,
              decoration: InputDecoration(hintText: label),
              validator: validator,
              maxLength: maxLength,
              maxLengthEnforcement: MaxLengthEnforcement.enforced,
              inputFormatters: [UpperCaseTextFormatter(), ...?inputFormatters],
              onTapOutside: onTapOutside,
            );
          },
          optionsBuilder: optionsBuilder,
          onSelected: (String value) {
            if (onSelected != null) {
              onSelected(value);
            }
          },
        ),
        if (secondary != null) secondary,
      ],
    ),
  );
}

Widget searchField<T>(
  BuildContext context, {
  required String name,
  required String label,
  required String title,
  required List<Option<T>> options,
  String? hintText,
  bool? isRequired,
  Widget? secondary,
  String? Function(T?)? validator,
  List<TextInputFormatter>? inputFormatters,
  TextInputType? keyboardType,
  void Function(T?)? onChanged,
  T? initialValue,
  bool enabled = true,
}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$label ${isRequired == true ? '*' : ''}',
          style: const TextStyle(
            color: Colors.blueAccent,
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
        FormBuilderSingleSelect<T>(
          name: name,
          enabled: enabled,
          onChanged: onChanged,
          hintText: hintText,
          initialValue: initialValue,
          validator: validator,
          options: options,
          title: title,
        ),
        if (secondary != null) secondary,
      ],
    ),
  );
}
