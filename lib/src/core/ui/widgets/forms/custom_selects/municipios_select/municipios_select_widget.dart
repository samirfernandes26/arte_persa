import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lazy_list_view/lazy_list_view.dart';

class MunicipiosSelectWidget<T> extends ConsumerStatefulWidget {
  const MunicipiosSelectWidget({super.key, this.initialValue});

  final T? initialValue;

  @override
  ConsumerState<MunicipiosSelectWidget<T>> createState() =>
      _MunicipiosSelectWidgetState<T>();
}

class _MunicipiosSelectWidgetState<T>
    extends ConsumerState<MunicipiosSelectWidget<T>> {
  late DataFeedController<LocalidadeUf> controller;

  @override
  void initState() {
    super.initState();

    controller = DataFeedController<LocalidadeUf>();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final viewModel = ref.read(municipiosSelectVmProvider.notifier);
      await viewModel.calculateTotalPages(controller);
    });
  }

  @override
  Widget build(BuildContext context) {
    final MunicipiosSelectVm(
      :loadData,
      :calculateTotalPages,
      :setSelected,
      :onChangeTextFilter,
    ) = ref.read(
      municipiosSelectVmProvider.notifier,
    );

    final MunicipiosSelectState(:selected, :selectedLabel) = ref.watch(
      municipiosSelectVmProvider,
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Municípios')),
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
                itemBuilder: (context, data, index) => RadioListTile<String>(
                  onChanged: (value) {
                    setSelected<String>(controller, value);
                  },
                  selected: data.localidade.ibge == selected,
                  title: Text(
                    "${data.localidade.ibge} - ${data.localidade.localidade} - ${data.uf.uf}",
                    style: context.theme.textTheme.bodyLarge?.copyWith(
                      fontWeight: selected == data.localidade.ibge
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                  activeColor: Colors.green,
                  value: data.localidade.ibge as String,
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
