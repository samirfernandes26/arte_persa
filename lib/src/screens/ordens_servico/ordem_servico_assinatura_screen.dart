import 'package:arte_persa/src/core/ui/widgets/buttons/cadastro_action_buttons/cadastro_action_buttons.dart';
import 'package:arte_persa/src/core/ui/widgets/components/cadastro_form_panel/cadastro_form_panel.dart';
import 'package:arte_persa/src/core/ui/widgets/components/ordem_servico_signature_pad/ordem_servico_signature_pad.dart';
import 'package:arte_persa/src/core/ui/widgets/components/painel_background_scaffold/painel_background_scaffold.dart';
import 'package:arte_persa/src/core/ui/widgets/components/painel_page_scaffold/painel_page_scaffold.dart';
import 'package:arte_persa/src/core/ui/widgets/headers/ordem_servico_flow_header/ordem_servico_flow_header.dart';
import 'package:arte_persa/src/screens/ordens_servico/ordem_servico_draft.dart';
import 'package:arte_persa/src/screens/ordens_servico/ordem_servico_mock_data.dart';
import 'package:arte_persa/src/shared/infra/routes/route_generator.dart';
import 'package:arte_persa/src/screens/painel/painel_navigation.dart';
import 'package:arte_persa/src/screens/painel/painel_session.dart';
import 'package:flutter/material.dart';

class OrdemServicoAssinaturaScreen extends StatefulWidget {
  const OrdemServicoAssinaturaScreen({
    super.key,
    required this.draft,
  });

  final OrdemServicoDraft draft;

  @override
  State<OrdemServicoAssinaturaScreen> createState() =>
      _OrdemServicoAssinaturaScreenState();
}

class _OrdemServicoAssinaturaScreenState
    extends State<OrdemServicoAssinaturaScreen> {
  late final Future<String> _usernameFuture;
  bool _hasSignature = false;

  @override
  void initState() {
    super.initState();
    _usernameFuture = PainelSession.loadUsername();
  }

  void _finish() {
    if (!_hasSignature) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Adicione a assinatura para finalizar a OS.'),
        ),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Ordem de Serviço finalizada com sucesso.'),
      ),
    );

    Navigator.of(context).pushNamedAndRemoveUntil(
      RouteGeneratorKeys.servicos,
      (route) => route.settings.name == RouteGeneratorKeys.painel,
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: _usernameFuture,
      builder: (context, snapshot) {
        final username = snapshot.data ?? 'Visitante';

        return PainelPageScaffold(
          selectedItem: PainelDrawerItem.servicos,
          username: username,
          showDrawerButton: false,
          body: PainelBackgroundScaffold(
            maxWidth: 660,
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                OrdemServicoFlowHeader(
                  onBackTap: () => Navigator.of(context).pop(),
                ),
                const SizedBox(height: 12),
                CadastroFormPanel(
                  title: 'Assinatura da OS',
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            'assets/images/Logo.png',
                            width: 46,
                            height: 46,
                            fit: BoxFit.contain,
                          ),
                          const SizedBox(width: 12),
                          const Expanded(
                            child: Text(
                              'Oficina de tapetes orientais LTDA',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Text(
                        OrdemServicoMockData.assinaturaTexto,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                          height: 1.28,
                        ),
                      ),
                      const SizedBox(height: 18),
                      const Text(
                        'Ação e op:',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 8),
                      OrdemServicoSignaturePad(
                        onChanged: (hasSignature) {
                          setState(() {
                            _hasSignature = hasSignature;
                          });
                        },
                      ),
                      const SizedBox(height: 24),
                      CadastroActionButtons(
                        secondaryLabel: 'Voltar',
                        primaryLabel: 'Finalizar',
                        onSecondaryTap: () => Navigator.of(context).pop(),
                        onPrimaryTap: _finish,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
