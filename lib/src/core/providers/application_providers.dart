import 'package:arte_persa/src/services/cadastro/cadastro_service.dart';
import 'package:arte_persa/src/services/cadastro/cadastro_service_imp.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'application_providers.g.dart';

/// Application providers
@Riverpod(keepAlive: true)
CadastroService cadastroService(CadastroServiceRef ref) => CadastroServiceImp();

