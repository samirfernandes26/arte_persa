import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

typedef ItemBuilder = Widget Function(BuildContext context);
typedef OptionField<T> = ({T value, String description});

class FormBuilderLazySelect<T> extends StatefulWidget {
  const FormBuilderLazySelect({
    super.key,
    required this.name,
    required this.itemBuilder,
    this.onChanged,
    this.label,
    this.labelText,
    this.hintText,
    this.validator,
    this.initialValue,
    this.controller,
    this.enabled,
    this.options,
  });

  final TextEditingController? controller;
  final String name;
  final Widget? label;
  final String? labelText;
  final String? hintText;
  final String? Function(T?)? validator;
  final T? initialValue;
  final void Function(T? value)? onChanged;
  final bool? enabled;
  final ItemBuilder itemBuilder;
  final List<OptionField<T>>? options;

  @override
  State<FormBuilderLazySelect<T>> createState() =>
      _FormBuilderLazySelectState<T>();
}

class _FormBuilderLazySelectState<T> extends State<FormBuilderLazySelect<T>> {
  late final TextEditingController _controller;
  late T? _selectedValue;
  late final bool _enabled;
  bool _ownsController = false;

  @override
  void initState() {
    super.initState();

    _ownsController = widget.controller == null;
    _controller = widget.controller ?? TextEditingController();
    _selectedValue = widget.initialValue;
    _enabled = widget.enabled != false;

    if (_selectedValue != null) {
      final description = widget.options
          ?.where((option) => option.value == widget.initialValue)
          .firstOrNull
          ?.description;

      _controller.text = description ?? '';
    }
  }

  @override
  void dispose() {
    if (_ownsController) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FormBuilderField<T>(
      name: widget.name,
      validator: widget.validator,
      enabled: _enabled,
      initialValue: widget.initialValue,
      onChanged: (value) {
        setState(() {
          _selectedValue = value;
        });
        widget.onChanged?.call(value);
      },
      builder: (field) {
        return TapRegion(
          enabled: _enabled,
          onTapInside: (_) async {
            final result = await showDialog<Map<String, dynamic>>(
              context: context,
              builder: widget.itemBuilder,
            );

            if (result == null) {
              return;
            }

            _controller.text = result['description']?.toString() ?? '';
            field.didChange(result['value'] as T);
          },
          child: InputDecorator(
            decoration: const InputDecoration().copyWith(
              label: widget.label,
              labelText: widget.labelText,
              errorText: field.errorText,
              hintText: widget.hintText,
            ),
            isEmpty: _selectedValue == null,
            child: Visibility(
              visible: _selectedValue != null,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Text(
                  _controller.text,
                  style: Theme.of(context).inputDecorationTheme.hintStyle,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class Option<T> {
  const Option({
    required this.value,
    required this.description,
  });

  final T value;
  final String description;
}

class FormBuilderSingleSelectState<T> {
  FormBuilderSingleSelectState({
    required this.options,
    required this.optionsFiltred,
    this.seletectOption,
  });

  FormBuilderSingleSelectState.initial({
    List<Option<T>>? options,
    this.seletectOption,
  })  : options = options ?? [],
        optionsFiltred = options ?? [];

  List<Option<T>> optionsFiltred;
  List<Option<T>> options;
  Option<T>? seletectOption;

  FormBuilderSingleSelectState<T> copyWith({
    List<Option<T>>? optionsFiltred,
    List<Option<T>>? options,
    Object? seletectOption = _sentinel,
  }) {
    return FormBuilderSingleSelectState<T>(
      options: options ?? this.options,
      optionsFiltred: optionsFiltred ?? this.optionsFiltred,
      seletectOption: seletectOption == _sentinel
          ? this.seletectOption
          : seletectOption as Option<T>?,
    );
  }

  void onChange(T value) {
    seletectOption = options.firstWhere((element) => element.value == value);
  }

  Timer? _debounce;

  void onChangeTextFilter(String? searchText) {
    if (_debounce?.isActive ?? false) {
      _debounce!.cancel();
    }

    _debounce = Timer(const Duration(milliseconds: 500), () {
      performSearch(options, searchText?.toLowerCase());
    });
  }

  void performSearch(List<Option<T>> options, String? searchText) {
    if (searchText == null || searchText.isEmpty) {
      optionsFiltred = options;
      return;
    }

    optionsFiltred = options
        .where(
          (element) => element.description.toLowerCase().contains(searchText),
        )
        .toList();
  }
}

class FormBuilderSingleSelect<T> extends StatefulWidget {
  const FormBuilderSingleSelect({
    super.key,
    required this.name,
    required this.options,
    required this.title,
    this.onChanged,
    this.label,
    this.labelText,
    this.validator,
    this.initialValue,
    this.controller,
    this.enabled,
    this.suffixIcon,
    this.prefixIcon,
    this.hintText,
  });

  final TextEditingController? controller;
  final String name;
  final Widget? label;
  final String? labelText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? hintText;
  final String title;
  final String? Function(T?)? validator;
  final List<Option<T>> options;
  final T? initialValue;
  final void Function(T? value)? onChanged;
  final bool? enabled;

  @override
  State<FormBuilderSingleSelect<T>> createState() =>
      _FormBuilderSingleSelectState<T>();
}

class _FormBuilderSingleSelectState<T>
    extends State<FormBuilderSingleSelect<T>> {
  late final TextEditingController _controller;
  late T? _selectedValue;
  bool _ownsController = false;

  @override
  void initState() {
    super.initState();

    _ownsController = widget.controller == null;
    _controller = widget.controller ?? TextEditingController();
    _selectedValue = widget.initialValue;

    if (_selectedValue != null) {
      final description = widget.options
          .firstWhere((option) => option.value == widget.initialValue)
          .description;

      _controller.text = description;
    }
  }

  @override
  void dispose() {
    if (_ownsController) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return FormBuilderField<T>(
      validator: widget.validator,
      name: widget.name,
      initialValue: widget.initialValue,
      onChanged: (value) {
        setState(() {
          _selectedValue = value;
        });
        widget.onChanged?.call(value);
      },
      builder: (field) {
        return TapRegion(
          enabled: widget.enabled ?? true,
          onTapInside: (_) async {
            final value = await showModalBottomSheet<Option<T>>(
              constraints: const BoxConstraints(minHeight: 250),
              context: context,
              isDismissible: false,
              backgroundColor: theme.colorScheme.surface,
              builder: (context) => OptionsDialog<T>(
                options: widget.options,
                title: widget.title,
                initialValue: widget.initialValue,
                name: widget.name,
              ),
            );

            if (value == null) {
              return;
            }

            _controller.text = value.description;
            field.didChange(value.value);
          },
          child: InputDecorator(
            decoration: const InputDecoration().copyWith(
              label: widget.label,
              labelText: widget.labelText,
              prefixIcon: widget.prefixIcon,
              errorText: field.errorText,
              suffixIcon: widget.suffixIcon,
              hintText: widget.hintText,
            ),
            isEmpty: _selectedValue == null,
            child: Visibility(
              visible: _selectedValue != null,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Text(
                  _controller.text,
                  style: Theme.of(context).inputDecorationTheme.hintStyle,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class OptionsDialog<T> extends StatefulWidget {
  const OptionsDialog({
    super.key,
    required this.options,
    required this.name,
    required this.title,
    this.initialValue,
  });

  final List<Option<T>> options;
  final String title;
  final String name;
  final T? initialValue;

  @override
  State<OptionsDialog<T>> createState() => _OptionsDialogState<T>();
}

class _OptionsDialogState<T> extends State<OptionsDialog<T>> {
  late FormBuilderSingleSelectState<T> state;

  @override
  void initState() {
    super.initState();
    state = FormBuilderSingleSelectState<T>.initial(
      options: widget.options,
      seletectOption: widget.options
          .where((element) => element.value == widget.initialValue)
          .firstOrNull,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) {
        if (didPop) {
          return;
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(widget.title, style: theme.textTheme.titleMedium),
            const SizedBox(height: 16),
            FormBuilderTextField(
              name: 'search',
              decoration: const InputDecoration(hintText: 'Faça sua busca'),
              onChanged: (value) {
                setState(() {
                  state.onChangeTextFilter(value);
                });
              },
            ),
            const SizedBox(height: 16),
            Flexible(
              child: ListView(
                children: [
                  FormBuilderRadioGroup<T>(
                    name: widget.name,
                    orientation: OptionsOrientation.vertical,
                    separator: const Divider(),
                    options: state.optionsFiltred
                        .map(
                          (option) => FormBuilderFieldOption<T>(
                            value: option.value,
                            child: Text(
                              option.description.toUpperCase(),
                              style: theme.textTheme.bodyMedium,
                            ),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      if (value == null) {
                        return;
                      }

                      setState(() {
                        state.onChange(value);
                      });
                    },
                    initialValue: state.seletectOption?.value,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(56),
              ),
              onPressed: () {
                Navigator.of(context).pop(state.seletectOption);
              },
              child: const Text(
                'Selecionar',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

const _sentinel = Object();
