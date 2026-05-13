import 'package:arte_persa/src/core/ui/widgets/buttons/cadastro_action_buttons/cadastro_action_buttons.dart';
import 'package:arte_persa/src/core/ui/widgets/buttons/painel_add_action_button/painel_add_action_button.dart';
import 'package:arte_persa/src/core/ui/widgets/components/cadastro_form_panel/cadastro_form_panel.dart';
import 'package:arte_persa/src/core/ui/widgets/components/painel_background_scaffold/painel_background_scaffold.dart';
import 'package:arte_persa/src/core/ui/widgets/components/painel_page_scaffold/painel_page_scaffold.dart';
import 'package:arte_persa/src/core/ui/widgets/forms/fields/cadastro_select_field/cadastro_select_field.dart';
import 'package:arte_persa/src/core/ui/widgets/forms/fields/cadastro_text_field/cadastro_text_field.dart';
import 'package:arte_persa/src/core/ui/widgets/headers/painel_brand_header/painel_brand_header.dart';
import 'package:arte_persa/src/screens/painel/painel_navigation.dart';
import 'package:arte_persa/src/screens/painel/painel_session.dart';
import 'package:arte_persa/src/screens/servicos/tipos_servicos_mock_data.dart';
import 'package:flutter/material.dart';

class CadastroTipoServicoScreen extends StatefulWidget {
  const CadastroTipoServicoScreen({
    super.key,
    this.initialData,
  });

  final TipoServicoData? initialData;

  @override
  State<CadastroTipoServicoScreen> createState() =>
      _CadastroTipoServicoScreenState();
}

class _CadastroTipoServicoScreenState extends State<CadastroTipoServicoScreen> {
  final _formKey = GlobalKey<FormState>();

  late final Future<String> _usernameFuture;
  late final TextEditingController _nomeController;
  late final TextEditingController _descricaoController;
  late final TextEditingController _precoBaseController;
  late final TextEditingController _precoExtraController;

  late TipoCalculoServico _selectedCalcType;
  late CategoriaServicoTipo _selectedCategory;
  late bool _allowMasterDiscount;

  bool get _isEditing => widget.initialData != null;

  @override
  void initState() {
    super.initState();
    _usernameFuture = PainelSession.loadUsername();

    final initial = widget.initialData;
    _nomeController =
        TextEditingController(text: initial?.name.replaceAll('\n', ' ') ?? '');
    _descricaoController =
        TextEditingController(text: initial?.description ?? '');
    _precoBaseController = TextEditingController(
      text: initial != null ? _formatPrice(initial.basePrice) : 'R\$ 0,00',
    );
    _precoExtraController = TextEditingController(
      text: initial != null ? _formatPrice(initial.extraPrice) : 'R\$ 0,00',
    );
    _selectedCalcType = initial?.calcType ?? TipoCalculoServico.metroQuadrado;
    _selectedCategory = initial?.category ?? CategoriaServicoTipo.tapete;
    _allowMasterDiscount = initial?.allowMasterDiscount ?? true;
  }

  @override
  void dispose() {
    _nomeController.dispose();
    _descricaoController.dispose();
    _precoBaseController.dispose();
    _precoExtraController.dispose();
    super.dispose();
  }

  String? _requiredValidator(String? value, String label) {
    if (value == null || value.trim().isEmpty) {
      return '$label é obrigatório';
    }
    return null;
  }

  void _save() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final message = _isEditing
        ? 'Serviço atualizado e pronto para integração.'
        : 'Novo serviço cadastrado e pronto para integração.';

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
    Navigator.of(context).maybePop();
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
            maxWidth: 680,
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                PainelBrandHeader(
                  username: username,
                  leading: PainelAddActionButton(
                    onTap: () => Navigator.of(context).maybePop(),
                    child: const Icon(
                      Icons.arrow_back_rounded,
                      color: Color(0xFF3B2E22),
                      size: 34,
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                CadastroFormPanel(
                  title:
                      _isEditing ? 'Editar Serviço' : 'Cadastrar Novo Serviço',
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        CadastroTextField(
                          label: 'Nome do Serviço',
                          controller: _nomeController,
                          validator: (value) =>
                              _requiredValidator(value, 'Nome do serviço'),
                        ),
                        const SizedBox(height: 18),
                        CadastroTextField(
                          label: 'Descrição',
                          controller: _descricaoController,
                          maxLines: 4,
                          validator: (value) =>
                              _requiredValidator(value, 'Descrição'),
                        ),
                        const SizedBox(height: 18),
                        const Text(
                          'Tipo de Cálculo',
                          style: TextStyle(
                            fontSize: 19,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 8),
                        CadastroSelectField<TipoCalculoServico>(
                          value: _selectedCalcType,
                          hintText: 'Tipo de cálculo',
                          onChanged: (value) {
                            if (value == null) {
                              return;
                            }
                            setState(() {
                              _selectedCalcType = value;
                            });
                          },
                          items: TipoCalculoServico.values
                              .map(
                                (type) => DropdownMenuItem(
                                  value: type,
                                  child: Text(type.label),
                                ),
                              )
                              .toList(),
                        ),
                        const SizedBox(height: 18),
                        Row(
                          children: [
                            Expanded(
                              child: CadastroTextField(
                                label: 'Preço Base',
                                controller: _precoBaseController,
                                keyboardType: TextInputType.number,
                                validator: (value) =>
                                    _requiredValidator(value, 'Preço base'),
                              ),
                            ),
                            const SizedBox(width: 14),
                            Expanded(
                              child: CadastroTextField(
                                label: 'Preço Extra',
                                controller: _precoExtraController,
                                keyboardType: TextInputType.number,
                                validator: (value) =>
                                    _requiredValidator(value, 'Preço extra'),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 18),
                        const Text(
                          'Categoria',
                          style: TextStyle(
                            fontSize: 19,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 8),
                        CadastroSelectField<CategoriaServicoTipo>(
                          value: _selectedCategory,
                          hintText: 'Categoria',
                          onChanged: (value) {
                            if (value == null) {
                              return;
                            }
                            setState(() {
                              _selectedCategory = value;
                            });
                          },
                          items: CategoriaServicoTipo.values
                              .map(
                                (category) => DropdownMenuItem(
                                  value: category,
                                  child: Text(category.label),
                                ),
                              )
                              .toList(),
                        ),
                        const SizedBox(height: 18),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Text(
                                'Permitir Desconto Master',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                            Checkbox(
                              value: _allowMasterDiscount,
                              activeColor: const Color(0xFF8A4814),
                              onChanged: (value) {
                                setState(() {
                                  _allowMasterDiscount = value ?? false;
                                });
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 22),
                        CadastroActionButtons(
                          secondaryLabel: 'Cancelar',
                          primaryLabel: _isEditing ? 'Salvar' : 'Cadastrar',
                          onSecondaryTap: () =>
                              Navigator.of(context).maybePop(),
                          onPrimaryTap: _save,
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

String _formatPrice(double value) {
  return 'R\$ ${value.toStringAsFixed(2).replaceAll('.', ',')}';
}
