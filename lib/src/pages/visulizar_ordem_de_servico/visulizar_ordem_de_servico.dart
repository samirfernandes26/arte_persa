import 'package:arte_persa/src/routes/route_generator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/ui/widgets/buttons/buttons.dart';

class VisulizarOrdemDeServico extends ConsumerStatefulWidget {
  const VisulizarOrdemDeServico({super.key});

  @override
  ConsumerState<VisulizarOrdemDeServico> createState() =>
      _VisulizarOrdemDeServicoState();
}

class _VisulizarOrdemDeServicoState
    extends ConsumerState<VisulizarOrdemDeServico> {
  double value = 0;

  @override
  Widget build(BuildContext context) {
    final navigator = Navigator.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Visualizar ordem de serviço',
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            navigator.popAndPushNamed(
              RouteGeneratorKeys.home,
            );
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
              navigator.pushNamed(
                RouteGeneratorKeys.ordemDeServicoPage,
              );
            },
            icon: const Icon(
              Icons.assignment_add,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications_none,
              color: Colors.white,
              size: 24,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Avaliacao(
          initialValue: 0,
          desable: false,
          onChanged: (value) {},
        ),
      ),
    );
  }
}
