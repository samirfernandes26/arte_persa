import 'package:arte_persa/src/core/ui/constants.dart';
import 'package:arte_persa/src/core/ui/helpers/messages.dart';
import 'package:arte_persa/src/core/ui/widgets/tiles/servico_tile/servico_tile.dart';
import 'package:arte_persa/src/model/servico_model.dart';
import 'package:arte_persa/src/pages/servicos/servicos_state.dart';
import 'package:arte_persa/src/pages/servicos/servicos_vm.dart';
import 'package:arte_persa/src/routes/route_generator.dart';
import 'package:asyncstate/asyncstate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ServicosPage extends ConsumerStatefulWidget {
  const ServicosPage({
    super.key,
  });

  @override
  ConsumerState<ServicosPage> createState() => _ServicosPageState();
}

class _ServicosPageState extends ConsumerState<ServicosPage> {
  final formKey = GlobalKey<FormBuilderState>();
  bool checkPorcentagem = false;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  ServicoModel servico = ServicoModel(
    nomeDoServico: 'Serviço de Limpeza',
    userId: '123456789',
    categoriaSelecionada: 'Limpeza',
    metroQuadrado: true,
    metroLinear: false,
    valorFixo: true,
    valorManual: false,
    porcentagemServico: false,
    servicoSelecionando: 'M2',
    porcentagem: null,
    valor: 100.00,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  );

  @override
  Widget build(BuildContext context) {
    final ServicosVm(:loadData) = ref.read(servicosVmProvider.notifier);
    final servisosVm = ref.watch(servicosVmProvider);

    final arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    if (servisosVm.status == ServicosStateStatus.initial ||
        arguments?['reload'] == true) {
      Future(() async {
        await loadData();
        arguments?['reload'] = false;
      });
    }

    ref.listen(servicosVmProvider, (_, state) {
      switch (state.status) {
        case ServicosStateStatus.initial:
          break;
        case ServicosStateStatus.loaded:
          break;
        case ServicosStateStatus.success:
          Messages.showSuccess(state.message!, context);
          Future(() async {
            await loadData();
          });
          break;
        case ServicosStateStatus.error:
          break;
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de serviços cadastrados'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Visibility(
            visible: servisosVm.servicos!.isNotEmpty,
            replacement: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Nenhuma serviço encontrado!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            ),
            child: Expanded(
              child: SizedBox(
                // Adicionando um container para definir um tamanho
                height: MediaQuery.of(context).size.height *
                    0.7, // Defina um tamanho adequado aqui
                child: RefreshIndicator(
                  onRefresh: () async {
                    await loadData().asyncLoader();
                  },
                  child: ListView.separated(
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 16),
                    itemCount: servisosVm.servicos?.length ?? 0,
                    itemBuilder: (_, index) => ServicoTile(
                      servico: servisosVm.servicos![index],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              minimumSize: const Size.fromHeight(60),
              backgroundColor: const Color.fromRGBO(0, 128, 0, 1)),
          onPressed: () async {
            Navigator.of(context).pushNamed(
              RouteGeneratorKeys.cadastroServico,
            );
          }, //loginUser,
          child: const Text('Cadastrar'),
        ),
      ),
    );
  }
}
