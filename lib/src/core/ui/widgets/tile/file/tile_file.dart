import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart';
import 'package:share_plus/share_plus.dart';

class TileFile extends StatelessWidget {
  const TileFile({
    super.key,
    required this.fileEntity,
    required this.deleteFile,
  });

  final FileSystemEntity fileEntity;
  final Future<void> Function(File) deleteFile;

  @override
  Widget build(BuildContext context) {
    final navigator = Navigator.of(context);

    final isoDate = fileEntity.statSync().modified.toIso8601String();
    final dateTime = DateTime.parse(isoDate);
    final formatedDate = DateFormat('dd/MM/yyyy - HH:mm').format(dateTime);

    return ListTile(
      leading: Icon(
        Icons.folder_zip_outlined,
        color: context.brightness == Brightness.light
            ? Colors.black54
            : Colors.white,
      ),
      title: Text(
        basename(fileEntity.uri.path.toUpperCase()),
        style: TextStyle(
          color: context.brightness == Brightness.light
              ? Colors.black87
              : Colors.white,
        ),
      ),
      subtitle: Text(
        formatedDate,
        style: TextStyle(
          color: context.brightness == Brightness.light
              ? Colors.black87
              : Colors.white,
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: () async {
              try {
                await SharePlus.instance.share(
                  ShareParams(files: [XFile(fileEntity.path)]),
                );
              } catch (_) {
                if (context.mounted) {
                  // Messages.showErrors(
                  //     'Não foi possível compartilhar a cópia do banco de dados.',
                  //     context);
                }
              }
            },
            icon: const Icon(Icons.share),
            color: Colors.blue,
          ),
          const SizedBox(width: 16),
          IconButton(
            onPressed: () async {
              final canDelete = await showDialog<bool>(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Deseja realmente excluir?'),
                  content: Text(basename(fileEntity.uri.path.toUpperCase())),
                  actions: <Widget>[
                    ElevatedButton(
                      style: const ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll<Color>(
                          Colors.red,
                        ),
                      ),
                      onPressed: () {
                        navigator.pop(true);
                      },
                      child: const Text('Excluir'),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        navigator.pop(false);
                      },
                      child: const Text('Cancelar'),
                    ),
                  ],
                ),
              );

              if (canDelete ?? false) {
                await deleteFile(fileEntity as File);
              }
            },
            icon: const Icon(Icons.delete),
            color: Colors.red,
          ),
        ],
      ),
    );
  }
}
