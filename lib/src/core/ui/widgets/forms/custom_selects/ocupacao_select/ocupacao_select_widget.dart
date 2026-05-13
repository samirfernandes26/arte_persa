import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:arte_persa/src/core/ui/widgets/lazy_list_view/lazy_list_view.dart';

class OcupacaoSelectWidget<T> extends ConsumerStatefulWidget {
  const OcupacaoSelectWidget({super.key, this.initialValue});

  final T? initialValue;

  @override
  ConsumerState<OcupacaoSelectWidget<T>> createState() =>
      _OcupacaoSelectState<T>();
}

class _OcupacaoSelectState<T> extends ConsumerState<OcupacaoSelectWidget<T>> {
  late DataFeedController<CodigoBrasileiroOcupacao> controller;

  @override
  void initState() {
    super.initState();

    controller = DataFeedController<CodigoBrasileiroOcupacao>();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final viewModel = ref.read(ocupacaoSelectVmProvider.notifier);
      await viewModel.calculateTotalPages(controller);

      if (widget.initialValue != null) {
        viewModel.setSelected<T>(controller, widget.initialValue);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final OcupacaoSelectVm(
      :loadData,
      :calculateTotalPages,
      :setSelected,
      :onChangeTextFilter,
    ) = ref.read(
      ocupacaoSelectVmProvider.notifier,
    );

    final OcupacaoSelectState(:selected, :selectedLabel) = ref.watch(
      ocupacaoSelectVmProvider,
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Código brasileiro de ocupação')),
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
              onChanged: (value) async {
                await onChangeTextFilter(controller, value);
              },
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search),
                prefixIconColor: Colors.blueAccent,
                hintText: 'Faça sua busca',
              ),
            ),
            const Divider(height: 32),
            Expanded(
              child: LazyListViewWidget(
                controller: controller,
                itemBuilder: (context, data, index) => RadioListTile<int>(
                  onChanged: (value) {
                    setSelected<int>(controller, value);
                  },
                  selected: data.id == selected,
                  title: Text(
                    "${data.cbo} - ${data.descricao}",
                    style: context.theme.textTheme.bodyLarge?.copyWith(
                      fontWeight: selected == data.id
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                  activeColor: Colors.green,
                  value: data.id,
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
