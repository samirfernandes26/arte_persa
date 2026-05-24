import 'package:arte_persa/src/core/rest_client/rest_client.dart';
import 'package:arte_persa/src/shared/infra/database/database.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart' show Ref;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'provider.g.dart';

@Riverpod(keepAlive: true)
RestClient restClient(Ref ref) => RestClient();

@Riverpod(keepAlive: true)
Database database(Ref ref) => Database();
