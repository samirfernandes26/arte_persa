import 'package:arte_persa/src/core/ui/widgets/buttons/buttons.dart';
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
    final navigator = Navigator.of(context);
    final OrdemDeServicoVm(:calcularValorDoServico, :finalizarCadastroItem) =
        ref.read(ordemDeServicoVmProvider.notifier);
    final servicosVm = ref.watch(ordemDeServicoVmProvider);
    final servicos = servicosVm.servicos!;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Seleção de serviços'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
      ),
      body: Expanded(
        key: formKey,
        child: ListView.builder(
          itemCount: servicos.length,
          itemBuilder: (context, index) => ListTile(
            title: FormBuilderCheckbox(
              name: 'servico_${servicos[index].id}',
              decoration: InputDecoration(
                fillColor: Colors.grey.withOpacity(0.1),
                contentPadding: const EdgeInsets.all(0),
              ),
              title: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        servicos[index].nomeDoServico,
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    if (servicos[index].valorManual == false &&
                        servicos[index].valorCalculo != null &&
                        servicos[index].valorCalculo != 0)
                      Text(
                        servicos[index]
                                .valorCalculo
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
              ),
              initialValue: false,
              onChanged: (value) {
                if (servicos[index].metroLinear == false) {
                  calcularValorDoServico(
                    servico: servicos[index],
                    valueCheck: value ?? false,
                    lado: {
                      'ambos_os_comprimentos': ambosComprimentos,
                      'apenas_um_comprimento': apenasUmComprimento,
                      'ambas_as_larguras': ambasLarguras,
                      'apenas_uma_largura': apenasUmaLargura,
                    },
                  );
                } else if (servicos[index].metroLinear == true) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        backgroundColor: const Color(0xFF1E2331),
                        title: const Column(
                          children: [
                            Text(
                              "ATENÇÃO",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                              ),
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
                                      name: 'ambos_os_comprimentos',
                                      decoration: InputDecoration(
                                        fillColor: Colors.grey.withOpacity(0.3),
                                        contentPadding:
                                            const EdgeInsets.all(12),
                                      ),
                                      title: const DefaultTextStyle(
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                        ),
                                        child: Text(
                                          'Ambos os comprimentos',
                                        ),
                                      ),
                                      initialValue: false,
                                      onChanged: (value) {
                                        setState(
                                          () {
                                            ambosComprimentos = value ?? false;
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 16,
                                  ),
                                  Flexible(
                                    child: FormBuilderSwitch(
                                      name: 'apenas_um_comprimento',
                                      decoration: InputDecoration(
                                        fillColor: Colors.grey.withOpacity(0.3),
                                        contentPadding:
                                            const EdgeInsets.all(12),
                                      ),
                                      title: const DefaultTextStyle(
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                        ),
                                        child: Text(
                                          'Apenas um comprimento',
                                        ),
                                      ),
                                      initialValue: false,
                                      onChanged: (value) {
                                        setState(
                                          () {
                                            apenasUmComprimento =
                                                value ?? false;
                                          },
                                        );
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
                                      decoration: InputDecoration(
                                        fillColor: Colors.grey.withOpacity(0.3),
                                        contentPadding:
                                            const EdgeInsets.all(12),
                                      ),
                                      title: const DefaultTextStyle(
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                        ),
                                        child: Text(
                                          'Ambas as larguras',
                                        ),
                                      ),
                                      initialValue: false,
                                      onChanged: (value) {
                                        setState(
                                          () {
                                            ambasLarguras = value ?? false;
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 16,
                                  ),
                                  Flexible(
                                    child: FormBuilderSwitch(
                                      name: 'apenas_uma_largura',
                                      decoration: InputDecoration(
                                        fillColor: Colors.grey.withOpacity(0.3),
                                        contentPadding:
                                            const EdgeInsets.all(12),
                                      ),
                                      title: const DefaultTextStyle(
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                        ),
                                        child: Text(
                                          'Apenas uma largura',
                                        ),
                                      ),
                                      initialValue: false,
                                      onChanged: (value) {
                                        setState(
                                          () {
                                            apenasUmaLargura = value ?? false;
                                          },
                                        );
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
                                  Button(
                                    textButton: 'Cancelar',
                                    colorText: Colors.white,
                                    colorButton: Colors.red.shade300,
                                    useFlexible: true,
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                  const SizedBox(
                                    width: 16,
                                  ),
                                  Button(
                                    textButton: 'Calcular',
                                    colorText: Colors.white,
                                    colorButton: const Color(0xFF008000),
                                    useFlexible: true,
                                    onPressed: () {
                                      calcularValorDoServico(
                                        servico: servicos[index],
                                        valueCheck: value ?? false,
                                        lado: {
                                          'ambos_os_comprimentos':
                                              ambosComprimentos,
                                          'apenas_um_comprimento':
                                              apenasUmComprimento,
                                          'ambas_as_larguras': ambasLarguras,
                                          'apenas_uma_largura':
                                              apenasUmaLargura,
                                        },
                                      );
                                      Navigator.pop(context);
                                    }, //loginUser,,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
              },
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
                Navigator.pop(context);
              },
            ),
            const SizedBox(
              width: 16,
            ),
            Button(
              textButton: 'Proximo',
              colorText: Colors.white,
              colorButton: const Color(0xFF008000),
              useFlexible: true,
              onPressed: () async {
                await finalizarCadastroItem();
                navigator.pushNamedAndRemoveUntil(
                  RouteGeneratorKeys.ordemDeServicoFaturaPage,
                  (route) => false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
