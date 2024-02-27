import 'package:arte_persa/src/core/ui/helpers/messages.dart';
import 'package:arte_persa/src/pages/ordem_de_servico/ordem_de_servico_state.dart';
import 'package:arte_persa/src/pages/ordem_de_servico/ordem_de_servico_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OrdemDeServicoServicosPage extends ConsumerStatefulWidget {
  const OrdemDeServicoServicosPage({
    super.key,
  });

  @override
  ConsumerState<OrdemDeServicoServicosPage> createState() =>
      _OrdemDeServicoServicosPageState();
}

class _OrdemDeServicoServicosPageState
    extends ConsumerState<OrdemDeServicoServicosPage> {
  final formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    final OrdemDeServicoVm(:loadDataServicos) =
        ref.read(ordemDeServicoVmProvider.notifier);
    final servicosVm = ref.watch(ordemDeServicoVmProvider);

    final arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    if (servicosVm.status == OrdemDeServicoState.initial ||
        arguments?['reload'] == true) {
      Future(
        () async {
          await loadDataServicos();
          arguments?['reload'] = false;
        },
      );
    }

    ref.listen(
      ordemDeServicoVmProvider,
      (_, state) {
        switch (state.status) {
          case OrdemDeServicoStateStatus.initial:
            break;
          case OrdemDeServicoStateStatus.loaded:
            break;
          case OrdemDeServicoStateStatus.success:
            Messages.showSuccess(
              state.message!,
              context,
            );
            Future(
              () async {
                await loadDataServicos();
              },
            );
            break;
          case OrdemDeServicoStateStatus.error:
            break;
        }
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Seleção de serviços'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(32.0),
          child: FormBuilder(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: servicosVm.servicos != null
                  ? servicosVm.servicos!.map(
                      (servico) {
                        return ListTile(
                          title: FormBuilderCheckbox(
                            name: 'servico_${servico.id}',
                            title: Text(servico.nomeDoServico),
                            // value:
                            //     false, // Aqui você pode definir o valor do checkbox conforme necessário
                            onChanged: (value) {
                              // Faça algo com o valor do checkbox, se necessário
                            },
                          ),
                        );
                      },
                    ).toList()
                  : [],
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
                onPressed: () async {
                  await loadDataServicos();
                }, //loginUser,
                child: const Text('Proximo'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
