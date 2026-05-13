import 'package:arte_persa/src/core/ui/widgets/buttons/cadastro_action_buttons/cadastro_action_buttons.dart';
import 'package:arte_persa/src/core/ui/widgets/components/cadastro_form_panel/cadastro_form_panel.dart';
import 'package:arte_persa/src/core/ui/widgets/components/painel_background_scaffold/painel_background_scaffold.dart';
import 'package:arte_persa/src/core/ui/widgets/components/painel_page_scaffold/painel_page_scaffold.dart';
import 'package:arte_persa/src/core/ui/widgets/components/painel_styles/painel_styles.dart';
import 'package:arte_persa/src/core/ui/widgets/forms/fields/cadastro_phone_field/cadastro_phone_field.dart';
import 'package:arte_persa/src/core/ui/widgets/forms/fields/cadastro_text_field/cadastro_text_field.dart';
import 'package:arte_persa/src/core/ui/widgets/headers/painel_brand_header/painel_brand_header.dart';
import 'package:arte_persa/src/screens/painel/painel_navigation.dart';
import 'package:arte_persa/src/screens/painel/painel_session.dart';
import 'package:flutter/material.dart';

class CadastroColaboradorScreen extends StatefulWidget {
  const CadastroColaboradorScreen({super.key});

  @override
  State<CadastroColaboradorScreen> createState() =>
      _CadastroColaboradorScreenState();
}

class _CadastroColaboradorScreenState extends State<CadastroColaboradorScreen> {
  final _formKey = GlobalKey<FormState>();

  late final Future<String> _usernameFuture;

  final _nomeCompletoController = TextEditingController();
  final _cpfController = TextEditingController();
  final _dataNascimentoController = TextEditingController();
  final _telefoneUmController = TextEditingController();
  final _telefoneDoisController = TextEditingController();

  bool _telefoneUmWhatsapp = true;
  bool _telefoneDoisWhatsapp = false;

  @override
  void initState() {
    super.initState();
    _usernameFuture = PainelSession.loadUsername();
  }

  @override
  void dispose() {
    _nomeCompletoController.dispose();
    _cpfController.dispose();
    _dataNascimentoController.dispose();
    _telefoneUmController.dispose();
    _telefoneDoisController.dispose();
    super.dispose();
  }

  String? _requiredValidator(String? value, String label) {
    if (value == null || value.trim().isEmpty) {
      return '$label é obrigatório';
    }
    return null;
  }

  Future<void> _pickDate() async {
    final now = DateTime.now();
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime(now.year - 24),
      firstDate: DateTime(1950),
      lastDate: now,
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: PainelStyles.accentDark,
            ),
          ),
          child: child!,
        );
      },
    );

    if (selectedDate != null) {
      _dataNascimentoController.text =
          '${selectedDate.day.toString().padLeft(2, '0')}/${selectedDate.month.toString().padLeft(2, '0')}/${selectedDate.year}';
    }
  }

  void _save() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Cadastro de colaborador preparado para integração.'),
      ),
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
          selectedItem: PainelDrawerItem.inicio,
          username: username,
          showDrawerButton: false,
          body: PainelBackgroundScaffold(
            maxWidth: 620,
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 6),
                PainelBrandHeader(
                  username: username,
                  compactLogoHeight: 78,
                  expandedLogoHeight: 92,
                ),
                const SizedBox(height: 18),
                CadastroFormPanel(
                  title: 'Cadastro do colaborador',
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        CadastroTextField(
                          label: 'Nome Completo *',
                          controller: _nomeCompletoController,
                          validator: (value) =>
                              _requiredValidator(value, 'Nome completo'),
                        ),
                        const SizedBox(height: 18),
                        CadastroTextField(
                          controller: _cpfController,
                          hintText: 'CPF *',
                          keyboardType: TextInputType.number,
                          validator: (value) =>
                              _requiredValidator(value, 'CPF'),
                        ),
                        const SizedBox(height: 18),
                        CadastroTextField(
                          controller: _dataNascimentoController,
                          hintText: 'Data de nascimento',
                          readOnly: true,
                          onTap: _pickDate,
                          suffixIcon: const Icon(
                            Icons.calendar_month_outlined,
                            color: Color(0xFFB78D61),
                          ),
                          validator: (value) =>
                              _requiredValidator(value, 'Data de nascimento'),
                        ),
                        const SizedBox(height: 18),
                        CadastroPhoneField(
                          label: '1º Telefone para contato*',
                          controller: _telefoneUmController,
                          useWhatsApp: _telefoneUmWhatsapp,
                          onWhatsAppTap: () {
                            setState(() {
                              _telefoneUmWhatsapp = !_telefoneUmWhatsapp;
                            });
                          },
                          validator: (value) =>
                              _requiredValidator(value, '1º telefone'),
                        ),
                        const SizedBox(height: 18),
                        CadastroPhoneField(
                          label: '2º Telefone para contato',
                          controller: _telefoneDoisController,
                          useWhatsApp: _telefoneDoisWhatsapp,
                          onWhatsAppTap: () {
                            setState(() {
                              _telefoneDoisWhatsapp = !_telefoneDoisWhatsapp;
                            });
                          },
                        ),
                        const SizedBox(height: 24),
                        CadastroActionButtons(
                          secondaryLabel: 'Cancelar',
                          primaryLabel: 'Salvar',
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
