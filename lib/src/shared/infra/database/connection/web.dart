import 'package:drift/drift.dart';
import 'package:drift/wasm.dart';
import 'package:flutter/foundation.dart';

DatabaseConnection connect() {
  return DatabaseConnection.delayed(
    Future(() async {
      final db = await WasmDatabase.open(
        databaseName: 'arte-persa',
        sqlite3Uri: Uri.parse('sqlite3.wasm'),
        driftWorkerUri: Uri.parse('drift_worker.js'),
      );

      if (db.missingFeatures.isEmpty) {
        debugPrint(
          'Using ${db.chosenImplementation} due to unsupported '
          'browser features: ${db.missingFeatures}',
        );
      }

      return db.resolvedExecutor;
    }),
  );
}

Future<void> validateDatabaseSchema(GeneratedDatabase database) async {}
