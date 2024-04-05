import 'package:arte_persa/src/core/rest_client/rest_client.dart';
import 'package:arte_persa/src/repositories/convert_addresses/convert_addresses_repository.dart';
import 'package:arte_persa/src/repositories/convert_addresses/convert_addresses_repository_impl.dart';
import 'package:arte_persa/src/services/auth/auth_service.dart';
import 'package:arte_persa/src/services/auth/auth_service_impl.dart';

import 'package:arte_persa/src/services/cadastro/cadastro_service.dart';
import 'package:arte_persa/src/services/cadastro/cadastro_service_imp.dart';

import 'package:arte_persa/src/services/cadastro_cliente_service/cadastro_cliente_service.dart';
import 'package:arte_persa/src/services/cadastro_cliente_service/cadastro_cliente_service_imp.dart';

import 'package:arte_persa/src/services/cadastro_servico_service/cadastro_servico_service.dart';
import 'package:arte_persa/src/services/cadastro_servico_service/cadastro_servico_service_imp.dart';

import 'package:arte_persa/src/services/firebase_storage_service/firebase_storage_service.dart';
import 'package:arte_persa/src/services/firebase_storage_service/firebase_storage_service_imp.dart';

import 'package:arte_persa/src/services/ordem_de_servico_service/ordem_de_servico_service.dart';
import 'package:arte_persa/src/services/ordem_de_servico_service/ordem_de_servico_service_imp.dart';

import 'package:arte_persa/src/services/geolocation/geolocation_service_impl.dart';
import 'package:arte_persa/src/services/geolocation/geolocation_service.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'application_providers.g.dart';

@Riverpod(keepAlive: true)
RestClient restClient(RestClientRef ref) => RestClient();

/// Application providers
@Riverpod(keepAlive: true)
CadastroService cadastroService(CadastroServiceRef ref) => CadastroServiceImp();

@Riverpod(keepAlive: true)
AuthService authService(AuthServiceRef ref) => AuthServiceImpl();

@Riverpod(keepAlive: true)
CadastroServicoService cadastroServicoService(CadastroServicoServiceRef ref) =>
    CadastroServicoServiceImp();

@Riverpod(keepAlive: true)
CadastroClienteService cadastroClienteService(CadastroClienteServiceRef ref) =>
    CadastroClienteServiceImp();

@Riverpod(keepAlive: true)
FirebaseStorageService firebaseStorageService(FirebaseStorageServiceRef ref) =>
    FirebaseStorageServiceImp();

@Riverpod(keepAlive: true)
OrdemDeServicoService ordemDeServicoService(OrdemDeServicoServiceRef ref) =>
    OrdemDeServicoServiceImp();

@Riverpod(keepAlive: true)
GeolocationService geolocationService(GeolocationServiceRef ref) =>
    GeolocationServiceImpl();

@Riverpod(keepAlive: true)
ConvertAddressesRepository convertAddressesRepository(
        ConvertAddressesRepositoryRef ref) =>
    ConvertAddressesRepositoryImpl();
