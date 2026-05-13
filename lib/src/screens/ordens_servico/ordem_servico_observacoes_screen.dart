import 'package:arte_persa/src/core/ui/widgets/buttons/cadastro_action_buttons/cadastro_action_buttons.dart';
import 'package:arte_persa/src/core/ui/widgets/components/cadastro_form_panel/cadastro_form_panel.dart';
import 'package:arte_persa/src/core/ui/widgets/components/ordem_servico_observation_block/ordem_servico_observation_block.dart';
import 'package:arte_persa/src/core/ui/widgets/components/painel_background_scaffold/painel_background_scaffold.dart';
import 'package:arte_persa/src/core/ui/widgets/components/painel_page_scaffold/painel_page_scaffold.dart';
import 'package:arte_persa/src/core/ui/widgets/forms/fields/cadastro_text_field/cadastro_text_field.dart';
import 'package:arte_persa/src/core/ui/widgets/headers/ordem_servico_flow_header/ordem_servico_flow_header.dart';
import 'package:arte_persa/src/screens/ordens_servico/ordem_servico_draft.dart';
import 'package:arte_persa/src/screens/ordens_servico/ordem_servico_servicos_disponiveis_screen.dart';
import 'package:arte_persa/src/screens/painel/painel_navigation.dart';
import 'package:arte_persa/src/screens/painel/painel_session.dart';
import 'package:flutter/material.dart';

class OrdemServicoObservacoesScreen extends StatefulWidget {
  const OrdemServicoObservacoesScreen({
    super.key,
    required this.draft,
  });

  final OrdemServicoDraft draft;

  @override
  State<OrdemServicoObservacoesScreen> createState() =>
      _OrdemServicoObservacoesScreenState();
}

class _OrdemServicoObservacoesScreenState
    extends State<OrdemServicoObservacoesScreen> {
  final _formKey = GlobalKey<FormState>();

  late final Future<String> _usernameFuture;
  late final TextEditingController _observacaoProducaoController;
  late final TextEditingController _observacaoUmController;
  late final TextEditingController _observacaoDoisController;

  @override
  void initState() {
    super.initState();
    _usernameFuture = PainelSession.loadUsername();
    _observacaoProducaoController = TextEditingController(
      text: widget.draft.observacaoProducao,
    );
    _observacaoUmController = TextEditingController(
      text: widget.draft.observacaoTecnicaUm,
    );
    _observacaoDoisController = TextEditingController(
      text: widget.draft.observacaoTecnicaDois,
    );
  }

  @override
  void dispose() {
    _observacaoProducaoController.dispose();
    _observacaoUmController.dispose();
    _observacaoDoisController.dispose();
    super.dispose();
  }

  void _showCameraMessage() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Captura de imagem ainda não está disponível.'),
      ),
    );
  }

  void _goNext() {
    final draft = widget.draft.copyWith(
      observacaoProducao: _observacaoProducaoController.text.trim(),
      observacaoTecnicaUm: _observacaoUmController.text.trim(),
      observacaoTecnicaDois: _observacaoDoisController.text.trim(),
    );

    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => OrdemServicoServicosDisponiveisScreen(draft: draft),
      ),
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
                  title: 'Observações Técnicas',
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        CadastroTextField(
                          label: 'Observação de produção',
                          controller: _observacaoProducaoController,
                          maxLines: 2,
                        ),
                        const SizedBox(height: 24),
                        OrdemServicoObservationBlock(
                          label: 'Adicionar observação',
                          controller: _observacaoUmController,
                          imageCount: 2,
                          onCameraTap: _showCameraMessage,
                        ),
                        const SizedBox(height: 24),
                        OrdemServicoObservationBlock(
                          label: 'Observação',
                          controller: _observacaoDoisController,
                          imageCount: 1,
                          onCameraTap: _showCameraMessage,
                        ),
                        const SizedBox(height: 26),
                        CadastroActionButtons(
                          secondaryLabel: 'Voltar',
                          primaryLabel: 'Próximo',
                          onSecondaryTap: () => Navigator.of(context).pop(),
                          onPrimaryTap: _goNext,
                        ),
                      ],
                    ),
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
