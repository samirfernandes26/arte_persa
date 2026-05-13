import 'package:arte_persa/src/core/ui/widgets/buttons/cadastro_action_buttons/cadastro_action_buttons.dart';
import 'package:arte_persa/src/core/ui/widgets/components/cadastro_form_panel/cadastro_form_panel.dart';
import 'package:arte_persa/src/core/ui/widgets/components/painel_background_scaffold/painel_background_scaffold.dart';
import 'package:arte_persa/src/core/ui/widgets/components/painel_page_scaffold/painel_page_scaffold.dart';
import 'package:arte_persa/src/core/ui/widgets/components/painel_styles/painel_styles.dart';
import 'package:arte_persa/src/core/ui/widgets/forms/fields/cadastro_phone_field/cadastro_phone_field.dart';
import 'package:arte_persa/src/core/ui/widgets/forms/fields/cadastro_select_field/cadastro_select_field.dart';
import 'package:arte_persa/src/core/ui/widgets/forms/fields/cadastro_text_field/cadastro_text_field.dart';
import 'package:arte_persa/src/core/ui/widgets/headers/painel_brand_header/painel_brand_header.dart';
import 'package:arte_persa/src/screens/clientes/clientes_mock_data.dart';
import 'package:arte_persa/src/screens/painel/painel_navigation.dart';
import 'package:arte_persa/src/screens/painel/painel_session.dart';
import 'package:flutter/material.dart';

enum CadastroClienteStep {
  dadosBasicos,
  contatoEndereco,
}

enum RetemIssOption {
  sim('Sim'),
  nao('Não');

  const RetemIssOption(this.label);
  final String label;
}

class CadastroClienteScreen extends StatefulWidget {
  const CadastroClienteScreen({super.key});

  @override
  State<CadastroClienteScreen> createState() => _CadastroClienteScreenState();
}

class _CadastroClienteScreenState extends State<CadastroClienteScreen> {
  final _stepOneKey = GlobalKey<FormState>();
  final _stepTwoKey = GlobalKey<FormState>();

  late final Future<String> _usernameFuture;

  final _nomeCompletoController = TextEditingController();
  final _razaoSocialController = TextEditingController();
  final _cpfCnpjController = TextEditingController();
  final _dataController = TextEditingController();
  final _responsavelController = TextEditingController();
  final _contatoUmController = TextEditingController();
  final _contatoDoisController = TextEditingController();
  final _emailController = TextEditingController();
  final _cepController = TextEditingController();
  final _logradouroController = TextEditingController();
  final _bairroController = TextEditingController();
  final _estadoController = TextEditingController();

  CadastroClienteStep _currentStep = CadastroClienteStep.dadosBasicos;
  ClienteCategory? _selectedCategory = ClienteCategory.pessoaFisica;
  RetemIssOption? _retemIss = RetemIssOption.nao;
  bool _contatoUmWhatsapp = true;
  bool _contatoDoisWhatsapp = false;

  @override
  void initState() {
    super.initState();
    _usernameFuture = PainelSession.loadUsername();
  }

  @override
  void dispose() {
    _nomeCompletoController.dispose();
    _razaoSocialController.dispose();
    _cpfCnpjController.dispose();
    _dataController.dispose();
    _responsavelController.dispose();
    _contatoUmController.dispose();
    _contatoDoisController.dispose();
    _emailController.dispose();
    _cepController.dispose();
    _logradouroController.dispose();
    _bairroController.dispose();
    _estadoController.dispose();
    super.dispose();
  }

  bool get _isPessoaFisica => _selectedCategory == ClienteCategory.pessoaFisica;

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
      initialDate: DateTime(now.year - 25),
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
      _dataController.text =
          '${selectedDate.day.toString().padLeft(2, '0')}/${selectedDate.month.toString().padLeft(2, '0')}/${selectedDate.year}';
    }
  }

  void _goNext() {
    if (!_stepOneKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _currentStep = CadastroClienteStep.contatoEndereco;
    });
  }

  void _save() {
    if (!_stepTwoKey.currentState!.validate()) {
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Cadastro de cliente preparado para integração.'),
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
          selectedItem: PainelDrawerItem.clientes,
          username: username,
          showDrawerButton: false,
          body: PainelBackgroundScaffold(
            maxWidth: 700,
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                PainelBrandHeader(username: username),
                const SizedBox(height: 18),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 220),
                  child: _currentStep == CadastroClienteStep.dadosBasicos
                      ? _ClienteStepOne(
                          formKey: _stepOneKey,
                          selectedCategory: _selectedCategory,
                          retemIss: _retemIss,
                          nomeCompletoController: _nomeCompletoController,
                          razaoSocialController: _razaoSocialController,
                          cpfCnpjController: _cpfCnpjController,
                          dataController: _dataController,
                          responsavelController: _responsavelController,
                          isPessoaFisica: _isPessoaFisica,
                          onCategoryChanged: (category) {
                            setState(() {
                              _selectedCategory = category;
                              if (!_isPessoaFisica) {
                                _dataController.clear();
                              }
                            });
                          },
                          onRetemIssChanged: (option) {
                            setState(() {
                              _retemIss = option;
                            });
                          },
                          onPickDate: _pickDate,
                          requiredValidator: _requiredValidator,
                          onCancelTap: () => Navigator.of(context).maybePop(),
                          onNextTap: _goNext,
                        )
                      : _ClienteStepTwo(
                          formKey: _stepTwoKey,
                          contatoUmController: _contatoUmController,
                          contatoDoisController: _contatoDoisController,
                          emailController: _emailController,
                          cepController: _cepController,
                          logradouroController: _logradouroController,
                          bairroController: _bairroController,
                          estadoController: _estadoController,
                          contatoUmWhatsapp: _contatoUmWhatsapp,
                          contatoDoisWhatsapp: _contatoDoisWhatsapp,
                          onContatoUmWhatsappTap: () {
                            setState(() {
                              _contatoUmWhatsapp = !_contatoUmWhatsapp;
                            });
                          },
                          onContatoDoisWhatsappTap: () {
                            setState(() {
                              _contatoDoisWhatsapp = !_contatoDoisWhatsapp;
                            });
                          },
                          requiredValidator: _requiredValidator,
                          onBackTap: () {
                            setState(() {
                              _currentStep = CadastroClienteStep.dadosBasicos;
                            });
                          },
                          onSaveTap: _save,
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

class _ClienteStepOne extends StatelessWidget {
  const _ClienteStepOne({
    required this.formKey,
    required this.selectedCategory,
    required this.retemIss,
    required this.nomeCompletoController,
    required this.razaoSocialController,
    required this.cpfCnpjController,
    required this.dataController,
    required this.responsavelController,
    required this.isPessoaFisica,
    required this.onCategoryChanged,
    required this.onRetemIssChanged,
    required this.onPickDate,
    required this.requiredValidator,
    required this.onCancelTap,
    required this.onNextTap,
  });

  final GlobalKey<FormState> formKey;
  final ClienteCategory? selectedCategory;
  final RetemIssOption? retemIss;
  final TextEditingController nomeCompletoController;
  final TextEditingController razaoSocialController;
  final TextEditingController cpfCnpjController;
  final TextEditingController dataController;
  final TextEditingController responsavelController;
  final bool isPessoaFisica;
  final ValueChanged<ClienteCategory?> onCategoryChanged;
  final ValueChanged<RetemIssOption?> onRetemIssChanged;
  final VoidCallback onPickDate;
  final String? Function(String?, String) requiredValidator;
  final VoidCallback onCancelTap;
  final VoidCallback onNextTap;

  @override
  Widget build(BuildContext context) {
    return CadastroFormPanel(
      key: const ValueKey('cliente-step-one'),
      title: 'Cadastro de clientes',
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CadastroSelectField<ClienteCategory>(
              value: selectedCategory,
              hintText: 'Tipo de cliente *',
              onChanged: onCategoryChanged,
              validator: (value) => value == null ? 'Selecione o tipo' : null,
              items: ClienteCategory.values
                  .map(
                    (category) => DropdownMenuItem(
                      value: category,
                      child: Text(
                        category == ClienteCategory.pessoaFisica
                            ? 'Pessoa Física'
                            : 'Pessoa Jurídica',
                      ),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 18),
            CadastroSelectField<RetemIssOption>(
              value: retemIss,
              hintText: 'Reterm ISS *',
              onChanged: onRetemIssChanged,
              validator: (value) => value == null ? 'Selecione a opção' : null,
              items: RetemIssOption.values
                  .map(
                    (option) => DropdownMenuItem(
                      value: option,
                      child: Text(option.label),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 22),
            CadastroTextField(
              label: 'Nome Completo *',
              controller: nomeCompletoController,
              validator: (value) => requiredValidator(value, 'Nome completo'),
            ),
            const SizedBox(height: 18),
            CadastroTextField(
              label: 'Razão social *',
              controller: razaoSocialController,
              validator: (value) => requiredValidator(value, 'Razão social'),
            ),
            const SizedBox(height: 18),
            CadastroTextField(
              label: 'CPF/CNPJ *',
              controller: cpfCnpjController,
              keyboardType: TextInputType.number,
              validator: (value) => requiredValidator(value, 'CPF/CNPJ'),
            ),
            const SizedBox(height: 18),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 180),
              child: isPessoaFisica
                  ? CadastroTextField(
                      key: const ValueKey('data-nascimento-pf'),
                      label: 'Data de nascimento *',
                      controller: dataController,
                      readOnly: true,
                      hintText: 'Selecione a data',
                      onTap: onPickDate,
                      suffixIcon: const Icon(
                        Icons.calendar_month_outlined,
                        color: Color(0xFFB78D61),
                      ),
                      validator: (value) =>
                          requiredValidator(value, 'Data de nascimento'),
                    )
                  : Column(
                      key: const ValueKey('data-dinamica-pj'),
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Data de nascimento *',
                          style: TextStyle(
                            fontSize: 19,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 8),
                        CadastroTextField(
                          controller: dataController,
                          enabled: false,
                          hintText:
                              'Campo dinâmico, aparece quando o cliente for PF',
                        ),
                      ],
                    ),
            ),
            const SizedBox(height: 18),
            CadastroTextField(
              label: 'Por quem procurar *',
              controller: responsavelController,
              validator: (value) =>
                  requiredValidator(value, 'Pessoa para procurar'),
            ),
            const SizedBox(height: 24),
            CadastroActionButtons(
              secondaryLabel: 'Cancelar',
              primaryLabel: 'Próximo',
              onSecondaryTap: onCancelTap,
              onPrimaryTap: onNextTap,
            ),
          ],
        ),
      ),
    );
  }
}

class _ClienteStepTwo extends StatelessWidget {
  const _ClienteStepTwo({
    required this.formKey,
    required this.contatoUmController,
    required this.contatoDoisController,
    required this.emailController,
    required this.cepController,
    required this.logradouroController,
    required this.bairroController,
    required this.estadoController,
    required this.contatoUmWhatsapp,
    required this.contatoDoisWhatsapp,
    required this.onContatoUmWhatsappTap,
    required this.onContatoDoisWhatsappTap,
    required this.requiredValidator,
    required this.onBackTap,
    required this.onSaveTap,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController contatoUmController;
  final TextEditingController contatoDoisController;
  final TextEditingController emailController;
  final TextEditingController cepController;
  final TextEditingController logradouroController;
  final TextEditingController bairroController;
  final TextEditingController estadoController;
  final bool contatoUmWhatsapp;
  final bool contatoDoisWhatsapp;
  final VoidCallback onContatoUmWhatsappTap;
  final VoidCallback onContatoDoisWhatsappTap;
  final String? Function(String?, String) requiredValidator;
  final VoidCallback onBackTap;
  final VoidCallback onSaveTap;

  @override
  Widget build(BuildContext context) {
    return CadastroFormPanel(
      key: const ValueKey('cliente-step-two'),
      title: 'Informações de contato\ne endereço',
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CadastroPhoneField(
              label: '1º Contato *',
              controller: contatoUmController,
              useWhatsApp: contatoUmWhatsapp,
              onWhatsAppTap: onContatoUmWhatsappTap,
              validator: (value) => requiredValidator(value, '1º contato'),
            ),
            const SizedBox(height: 18),
            CadastroPhoneField(
              label: '2º Contato',
              controller: contatoDoisController,
              useWhatsApp: contatoDoisWhatsapp,
              onWhatsAppTap: onContatoDoisWhatsappTap,
            ),
            const SizedBox(height: 18),
            CadastroTextField(
              label: 'E-mail',
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 26),
            Text(
              'Endereço',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    color: PainelStyles.accentDark,
                    fontSize: 34,
                    fontWeight: FontWeight.w400,
                  ),
            ),
            const SizedBox(height: 20),
            CadastroTextField(
              label: 'Cep *',
              controller: cepController,
              keyboardType: TextInputType.number,
              validator: (value) => requiredValidator(value, 'Cep'),
            ),
            const SizedBox(height: 18),
            CadastroTextField(
              label: 'Logradouro *',
              controller: logradouroController,
              validator: (value) => requiredValidator(value, 'Logradouro'),
            ),
            const SizedBox(height: 18),
            LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth < 420) {
                  return Column(
                    children: [
                      CadastroTextField(
                        label: 'Bairro *',
                        controller: bairroController,
                        validator: (value) =>
                            requiredValidator(value, 'Bairro'),
                      ),
                      const SizedBox(height: 18),
                      CadastroTextField(
                        label: 'Estado *',
                        controller: estadoController,
                        validator: (value) =>
                            requiredValidator(value, 'Estado'),
                      ),
                    ],
                  );
                }

                return Row(
                  children: [
                    Expanded(
                      child: CadastroTextField(
                        label: 'Bairro *',
                        controller: bairroController,
                        validator: (value) =>
                            requiredValidator(value, 'Bairro'),
                      ),
                    ),
                    const SizedBox(width: 18),
                    Expanded(
                      child: CadastroTextField(
                        label: 'Estado *',
                        controller: estadoController,
                        validator: (value) =>
                            requiredValidator(value, 'Estado'),
                      ),
                    ),
                  ],
                );
              },
            ),
            const SizedBox(height: 24),
            CadastroActionButtons(
              secondaryLabel: 'Voltar',
              primaryLabel: 'Salvar',
              onSecondaryTap: onBackTap,
              onPrimaryTap: onSaveTap,
            ),
          ],
        ),
      ),
    );
  }
}
