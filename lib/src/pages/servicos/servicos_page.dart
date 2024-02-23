import 'package:arte_persa/src/core/ui/constants.dart';
import 'package:arte_persa/src/core/ui/widgets/tiles/servico_tile/servico_tile.dart';
import 'package:arte_persa/src/model/cadastro_servico_model.dart';
import 'package:arte_persa/src/pages/servicos/servicos_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';

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

  CadastroServicoModel servico = CadastroServicoModel(
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

    final stateVm = ref.watch(servicosVmProvider);

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
            child: ServicoTile(servico: servico)
            // decoration: const BoxDecoration(
            //   color: Colors.white,
            //   borderRadius: BorderRadius.only(
            //     topLeft: Radius.circular(24),
            //     topRight: Radius.circular(24),
            //   ),
            // ),
            // child: Expanded(
            //   child: RefreshIndicator(
            //     onRefresh: () async {
            //       await loadData().asyncLoader();
            //     },
            //     child: ListView.separated(
            //       separatorBuilder: (context, index) =>
            //           const SizedBox(height: 16),
            //       itemCount: listaImoveisVm.imoveisFiltred?.length ?? 0,
            //       itemBuilder: (context, index) =>
            //           ImovelTile(imovel: listaImoveisVm.imoveisFiltred![index]),
            //     ),
            //   ),
            // ),
            ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              minimumSize: const Size.fromHeight(60),
              backgroundColor: const Color.fromRGBO(0, 128, 0, 1)),
          onPressed: () async {
            await loadData({'teste': 'teste'});
          }, //loginUser,
          child: const Text('Cadastrar'),
        ),
      ),
    );
  }
}
