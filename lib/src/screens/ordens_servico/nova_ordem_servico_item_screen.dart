import 'package:arte_persa/src/core/ui/widgets/buttons/cadastro_action_buttons/cadastro_action_buttons.dart';
import 'package:arte_persa/src/core/ui/widgets/components/cadastro_form_panel/cadastro_form_panel.dart';
import 'package:arte_persa/src/core/ui/widgets/components/painel_background_scaffold/painel_background_scaffold.dart';
import 'package:arte_persa/src/core/ui/widgets/components/painel_page_scaffold/painel_page_scaffold.dart';
import 'package:arte_persa/src/core/ui/widgets/forms/fields/cadastro_select_field/cadastro_select_field.dart';
import 'package:arte_persa/src/core/ui/widgets/forms/fields/cadastro_text_field/cadastro_text_field.dart';
import 'package:arte_persa/src/core/ui/widgets/headers/ordem_servico_flow_header/ordem_servico_flow_header.dart';
import 'package:arte_persa/src/screens/clientes/clientes_mock_data.dart';
import 'package:arte_persa/src/screens/ordens_servico/ordem_servico_draft.dart';
import 'package:arte_persa/src/screens/ordens_servico/ordem_servico_observacoes_screen.dart';
import 'package:arte_persa/src/screens/painel/painel_navigation.dart';
import 'package:arte_persa/src/screens/painel/painel_session.dart';
import 'package:arte_persa/src/screens/servicos/tipos_servicos_mock_data.dart';
import 'package:flutter/material.dart';

class NovaOrdemServicoItemScreen extends StatefulWidget {
  const NovaOrdemServicoItemScreen({
    super.key,
    this.initialDraft = const OrdemServicoDraft(),
  });

  final OrdemServicoDraft initialDraft;

  @override
  State<NovaOrdemServicoItemScreen> createState() =>
      _NovaOrdemServicoItemScreenState();
}

class _NovaOrdemServicoItemScreenState
    extends State<NovaOrdemServicoItemScreen> {
  final _formKey = GlobalKey<FormState>();

  late final Future<String> _usernameFuture;
  late final TextEditingController _clientItemController;
  late final TextEditingController _itemNameController;
  late final TextEditingController _comprimentoController;
  late final TextEditingController _larguraController;

  String? _selectedClient;
  String? _selectedTipoServico;

  @override
  void initState() {
    super.initState();
    _usernameFuture = PainelSession.loadUsername();
    _selectedClient = widget.initialDraft.clientName.isEmpty
        ? null
        : widget.initialDraft.clientName;
    _selectedTipoServico = widget.initialDraft.serviceTypeName.isEmpty
        ? null
        : widget.initialDraft.serviceTypeName;
    _clientItemController = TextEditingController(
      text: widget.initialDraft.clientItemLabel,
    );
    _itemNameController =
        TextEditingController(text: widget.initialDraft.itemName);
    _comprimentoController = TextEditingController(
      text: widget.initialDraft.comprimento,
    );
    _larguraController =
        TextEditingController(text: widget.initialDraft.largura);
  }

  @override
  void dispose() {
    _clientItemController.dispose();
    _itemNameController.dispose();
    _comprimentoController.dispose();
    _larguraController.dispose();
    super.dispose();
  }

  String? _requiredValidator(String? value, String label) {
    if (value == null || value.trim().isEmpty) {
      return '$label é obrigatório';
    }
    return null;
  }

  void _goNext() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final draft = widget.initialDraft.copyWith(
      clientName: _selectedClient ?? '',
      clientItemLabel: _clientItemController.text.trim(),
      serviceTypeName: _selectedTipoServico ?? '',
      itemName: _itemNameController.text.trim(),
      comprimento: _comprimentoController.text.trim(),
      largura: _larguraController.text.trim(),
    );

    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => OrdemServicoObservacoesScreen(draft: draft),
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
                  onBackTap: () => Navigator.of(context).maybePop(),
                ),
                const SizedBox(height: 12),
                CadastroFormPanel(
                  title: 'Novo Item de Serviço',
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        CadastroSelectField<String>(
                          value: _selectedClient,
                          hintText: 'Selecione o Cliente',
                          validator: (value) =>
                              value == null ? 'Selecione o cliente' : null,
                          onChanged: (value) {
                            setState(() {
                              _selectedClient = value;
                              _clientItemController.text =
                                  value == null ? '' : '$value item de Serviço';
                            });
                          },
                          items: ClientesMockData.clientes
                              .map(
                                (cliente) => DropdownMenuItem(
                                  value: cliente.name,
                                  child: Text(cliente.name),
                                ),
                              )
                              .toList(),
                        ),
                        const SizedBox(height: 18),
                        Container(
                          height: 120,
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.95),
                            borderRadius: BorderRadius.circular(22),
                            border: Border.all(
                              color: const Color(0xFFCBAE8D),
                              width: 1.2,
                            ),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            _clientItemController.text.isEmpty
                                ? 'Cliente item de Serviço'
                                : _clientItemController.text,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 18,
                              color: Color(0xFF32261C),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const SizedBox(height: 18),
                        CadastroSelectField<String>(
                          value: _selectedTipoServico,
                          hintText: 'Tapete Babilônico',
                          validator: (value) =>
                              value == null ? 'Selecione o tipo' : null,
                          onChanged: (value) {
                            setState(() {
                              _selectedTipoServico = value;
                            });
                          },
                          items: TiposServicosMockData.services
                              .map(
                                (service) => DropdownMenuItem(
                                  value: service.name.replaceAll('\n', ' '),
                                  child:
                                      Text(service.name.replaceAll('\n', ' ')),
                                ),
                              )
                              .toList(),
                        ),
                        const SizedBox(height: 18),
                        CadastroTextField(
                          label: 'Nome de item',
                          controller: _itemNameController,
                          validator: (value) =>
                              _requiredValidator(value, 'Nome do item'),
                        ),
                        const SizedBox(height: 18),
                        LayoutBuilder(
                          builder: (context, constraints) {
                            if (constraints.maxWidth < 420) {
                              return Column(
                                children: [
                                  CadastroTextField(
                                    label: 'Comprimento',
                                    controller: _comprimentoController,
                                    keyboardType: TextInputType.number,
                                    validator: (value) => _requiredValidator(
                                      value,
                                      'Comprimento',
                                    ),
                                  ),
                                  const SizedBox(height: 18),
                                  CadastroTextField(
                                    label: 'Largura',
                                    controller: _larguraController,
                                    keyboardType: TextInputType.number,
                                    validator: (value) => _requiredValidator(
                                      value,
                                      'Largura',
                                    ),
                                  ),
                                ],
                              );
                            }

                            return Row(
                              children: [
                                Expanded(
                                  child: CadastroTextField(
                                    label: 'Comprimento',
                                    controller: _comprimentoController,
                                    keyboardType: TextInputType.number,
                                    validator: (value) => _requiredValidator(
                                      value,
                                      'Comprimento',
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 18),
                                Expanded(
                                  child: CadastroTextField(
                                    label: 'Largura',
                                    controller: _larguraController,
                                    keyboardType: TextInputType.number,
                                    validator: (value) => _requiredValidator(
                                      value,
                                      'Largura',
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                        const SizedBox(height: 28),
                        CadastroActionButtons(
                          secondaryLabel: 'Cancelar',
                          primaryLabel: 'Próximo',
                          onSecondaryTap: () =>
                              Navigator.of(context).maybePop(),
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
