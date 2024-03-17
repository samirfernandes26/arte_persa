import 'package:arte_persa/src/pages/ordem_de_servico/ordem_de_servico_vm.dart';
import 'package:arte_persa/src/routes/route_generator.dart';
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

  bool ambosComprimentos = false;
  bool apenasUmComprimento = false;
  bool ambasLarguras = false;
  bool apenasUmaLargura = false;

  @override
  Widget build(BuildContext context) {
    final OrdemDeServicoVm(:calcularValorDoServico, :finalizarCadastroItem) =
        ref.read(ordemDeServicoVmProvider.notifier);
    final servicosVm = ref.watch(ordemDeServicoVmProvider);

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
                            title: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Text(
                                    servico.nomeDoServico,
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: false,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                if (servico.valorManual == false &&
                                    servico.valorCalculo != null &&
                                    servico.valorCalculo != 0)
                                  Text(
                                    servico.valorCalculo
                                            ?.toString()
                                            .replaceAll('.', ',') ??
                                        '0,00',
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: false,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.white,
                                    ),
                                  ),
                              ],
                            ),
                            initialValue: false,
                            onChanged: (value) {
                              if (servico.metroLinear == false) {
                                calcularValorDoServico(
                                  servico: servico,
                                  valueCheck: value ?? false,
                                  lado: {
                                    'ambos_os_comprimentos': ambosComprimentos,
                                    'apenas_um_comprimento':
                                        apenasUmComprimento,
                                    'ambas_as_larguras': ambasLarguras,
                                    'apenas_uma_largura': apenasUmaLargura,
                                  },
                                );
                              } else if (servico.metroLinear == true) {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      backgroundColor:
                                          const Color.fromRGBO(18, 18, 18, 1),
                                      title: const Column(
                                        children: [
                                          Text(
                                            "ATENÇÃO",
                                            textAlign: TextAlign.justify,
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w700),
                                          ),
                                          SizedBox(
                                            height: 16,
                                          ),
                                          Text(
                                            "Para calcular o serviço corretamente, é necessário saber se você deseja calcular o valor para ambos os comprimentos ou apenas um, e se deseja calcular o valor para ambas as larguras ou apenas uma. Por favor, escolha a opção que se aplica à sua situação. Isso garantirá resultados precisos para o seu serviço.",
                                            textAlign: TextAlign.justify,
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                      content: SingleChildScrollView(
                                        child: ListBody(
                                          children: [
                                            Row(
                                              children: [
                                                Flexible(
                                                  child: FormBuilderSwitch(
                                                    name:
                                                        'ambos_os_comprimentos',
                                                    title:
                                                        const DefaultTextStyle(
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                      child: Text(
                                                          'Ambos os comprimentos (metros lineares)'),
                                                    ),
                                                    initialValue: false,
                                                    onChanged: (value) {
                                                      setState(() {
                                                        ambosComprimentos =
                                                            value ?? false;
                                                      });
                                                    },
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 16,
                                                ),
                                                Flexible(
                                                  child: FormBuilderSwitch(
                                                    name:
                                                        'apenas_um_comprimento',
                                                    title:
                                                        const DefaultTextStyle(
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                      child: Text(
                                                          'Apenas um comprimento (metro linear)'),
                                                    ),
                                                    initialValue: false,
                                                    onChanged: (value) {
                                                      setState(() {
                                                        apenasUmComprimento =
                                                            value ?? false;
                                                      });
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 16,
                                            ),
                                            Row(
                                              children: [
                                                Flexible(
                                                  child: FormBuilderSwitch(
                                                    name: 'ambas_as_larguras',
                                                    title:
                                                        const DefaultTextStyle(
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                      child: Text(
                                                          'Ambas as larguras (metros lineares)'),
                                                    ),
                                                    initialValue: false,
                                                    onChanged: (value) {
                                                      setState(() {
                                                        ambasLarguras =
                                                            value ?? false;
                                                      });
                                                    },
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 16,
                                                ),
                                                Flexible(
                                                  child: FormBuilderSwitch(
                                                    name: 'apenas_uma_largura',
                                                    title:
                                                        const DefaultTextStyle(
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                      child: Text(
                                                          'Apenas uma largura (metro linear)'),
                                                    ),
                                                    initialValue: false,
                                                    onChanged: (value) {
                                                      setState(() {
                                                        apenasUmaLargura =
                                                            value ?? false;
                                                      });
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 16,
                                            ),
                                            ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                minimumSize:
                                                    const Size.fromHeight(60),
                                                backgroundColor:
                                                    const Color.fromRGBO(
                                                        0, 128, 0, 1),
                                              ),
                                              onPressed: () async {
                                                calcularValorDoServico(
                                                  servico: servico,
                                                  valueCheck: value ?? false,
                                                  lado: {
                                                    'ambos_os_comprimentos':
                                                        ambosComprimentos,
                                                    'apenas_um_comprimento':
                                                        apenasUmComprimento,
                                                    'ambas_as_larguras':
                                                        ambasLarguras,
                                                    'apenas_uma_largura':
                                                        apenasUmaLargura,
                                                  },
                                                );
                                              }, //loginUser,
                                              child: const Text('Calcular'),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );
                              }
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
                  await finalizarCadastroItem();
                  Navigator.of(context).pushNamedAndRemoveUntil(RouteGeneratorKeys.ordemDeServicoFaturaPage, (route) =>  false,);
                }, //loginUser,
                child: const Text('Finalizar item'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
