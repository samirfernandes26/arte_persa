import 'package:arte_persa/src/services/auth/auth_service.dart';
import 'package:arte_persa/src/services/auth/auth_service_impl.dart';
import 'package:arte_persa/src/services/cadastro/cadastro_service.dart';
import 'package:arte_persa/src/services/cadastro/cadastro_service_imp.dart';
import 'package:arte_persa/src/services/cadastro_servico_service/cadastro_servico_service.dart';
import 'package:arte_persa/src/services/cadastro_servico_service/cadastro_servico_service_imp.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'application_providers.g.dart';

/// Application providers
@Riverpod(keepAlive: true)
CadastroService cadastroService(CadastroServiceRef ref) => CadastroServiceImp();

@Riverpod(keepAlive: true)
AuthService authService(AuthServiceRef ref) => AuthServiceImpl();

@Riverpod(keepAlive: true)
CadastroServicoService cadastroServicoService (CadastroServicoServiceRef ref) => CadastroServicoServiceImp();

