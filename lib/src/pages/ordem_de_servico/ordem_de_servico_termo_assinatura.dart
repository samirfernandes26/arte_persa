import 'package:arte_persa/src/core/ui/helpers/messages.dart';
import 'package:arte_persa/src/pages/ordem_de_servico/ordem_de_servico_state.dart';
import 'package:arte_persa/src/pages/ordem_de_servico/ordem_de_servico_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_signature_pad/flutter_signature_pad.dart';

import 'package:arte_persa/src/core/ui/widgets/buttons/buttons.dart';
import 'package:arte_persa/src/routes/route_generator.dart';

class OrdemDeServicoTermoAssinatura extends ConsumerStatefulWidget {
  const OrdemDeServicoTermoAssinatura({super.key});

  @override
  ConsumerState<OrdemDeServicoTermoAssinatura> createState() =>
      _OrdemDeServicoTermoAssinaturaState();
}

class _OrdemDeServicoTermoAssinaturaState
    extends ConsumerState<OrdemDeServicoTermoAssinatura> {
  final _sign = GlobalKey<SignatureState>();
  final formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    final OrdemDeServicoVm(:finalizarCadastroDaOs) =
        ref.read(ordemDeServicoVmProvider.notifier);

    // final notaVm = ref.watch(ordemDeServicoVmProvider);

    ref.listen(
      ordemDeServicoVmProvider,
      (_, state) {
        switch (state.status) {
          case OrdemDeServicoStateStatus.initial:
            break;
          case OrdemDeServicoStateStatus.loaded:
            break;
          case OrdemDeServicoStateStatus.success:
            Messages.showSuccess(state.message!, context);
            // Future(
            //   () async {
            //     await loadData();
            //   },
            // );
            break;
          case OrdemDeServicoStateStatus.error:
            break;
        }
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de observações'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pushNamedAndRemoveUntil(
              RouteGeneratorKeys.authLogin,
              (route) => false,
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: FormBuilder(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                const Text(
                  "A nossa oficina toma todos os cuidados necessários na lavagem dos tapetes. Entretanto, não se responsabiliza por manchas e odores causados por urinas de animas ou provenientes de defeito de tingimento do material para confecção dos mesmos.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                const Text(
                  "- Os tapetes podem conter micropartículas de poeira oriunda da procedência ou do tempo de uso, que poderão não sair em uma única lavagem.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                const Text(
                  "- Após a comunicação do término do serviço, o proprietário terá 30 dias para retirar seus tapetes, após essas data será cobrado uma taxa de permanência de 5% ao mês  sobre o valor da nota. Os tapetes não procurados no prazo de 90 dias poderão ser doados a instituição beneficente ou dependendo do seu estado poderão ser jogados fora.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                const Text(
                  "- Todas as cobranças serão feitas através de boleta bancárias.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                const Text(
                  "Autorizo a OFICINA DE TAPETES ORIENTAIS  LTDA. Executar os serviços.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  height: 200,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade600,
                      border: Border.all(
                        color: Colors.grey.shade800,
                        width: 3.0,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20.0),
                      ),
                    ),
                    child: Signature(
                      color: const Color.fromARGB(255, 143, 44, 44),
                      strokeWidth: 2.0,
                      backgroundPainter: null,
                      onSign: null,
                      key: _sign,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange.shade300,
                    padding: const EdgeInsets.symmetric(
                      vertical: 16.0,
                      horizontal: 16.0,
                    ),
                  ),
                  onPressed: () {
                    if (_sign.currentState != null) {
                      _sign.currentState!.clear();
                    }
                  },
                  child: const Text(
                    'Limpar Assinatura',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
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
            Button(
              textButton: 'Voltar',
              colorText: Colors.white,
              colorButton: Colors.red.shade300,
              useFlexible: true,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            const SizedBox(
              width: 16,
            ),
            Button(
              textButton: 'Finalizar',
              colorText: Colors.white,
              colorButton: const Color(0xFF008000),
              useFlexible: true,
              onPressed: () async {
                switch (formKey.currentState?.saveAndValidate()) {
                  case (false || null):
                    break;
                  case (true):
                    await finalizarCadastroDaOs(_sign);
                  // Navigator.of(context).pushNamed(
                  //   RouteGeneratorKeys.ordemDeServicoServicosPage,
                  // );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
