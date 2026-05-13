import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lazy_list_view/lazy_list_view.dart';

class PaisesSelectWidget<T> extends ConsumerStatefulWidget {
  const PaisesSelectWidget({super.key, this.initialValue});

  final T? initialValue;

  @override
  ConsumerState<PaisesSelectWidget<T>> createState() =>
      _PaisesSelectWidgetState<T>();
}

class _PaisesSelectWidgetState<T> extends ConsumerState<PaisesSelectWidget<T>> {
  late DataFeedController<Pais> controller;

  @override
  void initState() {
    super.initState();

    controller = DataFeedController<Pais>();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final viewModel = ref.read(paisesSelectVmProvider.notifier);
      await viewModel.calculateTotalPages(controller);

      if (widget.initialValue != null) {
        viewModel.setSelected<T>(controller, widget.initialValue);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final PaisesSelectVm(
      :loadData,
      :calculateTotalPages,
      :setSelected,
      :onChangeTextFilter,
    ) = ref.read(
      paisesSelectVmProvider.notifier,
    );

    final PaisesSelectState(:selected, :selectedLabel) = ref.watch(
      paisesSelectVmProvider,
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Países')),
      body: Container(
        padding: const EdgeInsets.only(top: 16, right: 16, left: 16),
        decoration: BoxDecoration(
          color: context.brightness == Brightness.dark
              ? Colors.transparent
              : Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            FormBuilderTextField(
              name: 'search',
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search),
                prefixIconColor: Colors.blueAccent,
                hintText: 'Faça sua busca',
              ),
              onChanged: (value) async {
                await onChangeTextFilter(controller, value);
              },
            ),
            const Divider(height: 32),
            Expanded(
              child: LazyListViewWidget(
                controller: controller,
                itemBuilder: (context, data, index) => RadioListTile<T>(
                  onChanged: (value) {
                    setSelected<T>(controller, value);
                  },
                  selected: data.id == selected,
                  title: Text(
                    data.nome,
                    style: context.theme.textTheme.bodyLarge?.copyWith(
                      fontWeight: selected == data.id
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                  activeColor: Colors.green,
                  value: data.id as T,
                  groupValue: selected,
                ),
                onRefresh: () async {
                  controller.flushData();
                  await calculateTotalPages(controller);
                },
                onReachingEnd: () async {
                  await loadData(controller);
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                context.navigator.pop({
                  'value': selected,
                  'description': selectedLabel,
                });
              },
              child: Text(
                'Selecionar',
                style: context.theme.textTheme.bodyLarge?.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
