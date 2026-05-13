import 'dart:io';

import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:path/path.dart' as path;

class FileViewer extends StatelessWidget {
  final String? filePath;

  const FileViewer({super.key, required this.filePath});

  @override
  Widget build(BuildContext context) {
    if (filePath == null) {
      return const Center(
        child: Text(
          'Esta ocorrência contém um arquivo. Acesse o site para visualizá-lo!',
          style: TextStyle(
            color: Colors.blueAccent,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
      );
    }

    String ext = path.extension(filePath!).toLowerCase().replaceFirst('.', '');

    switch (ext) {
      case 'jpg':
      case 'jpeg':
      case 'png':
      case 'gif':
        // Imagem local
        return Center(
          child: SizedBox(
            height: 200, // idem para altura
            child: Image.file(File(filePath!), fit: BoxFit.contain),
          ),
        );
      case 'pdf':
      case 'docx':
      case 'xlsx':
      case 'mp4':
        return Button(
          leadingIcon: const Icon(
            size: 32,
            Icons.text_snippet_outlined,
            color: Colors.blueAccent,
          ),
          textButton: 'Abrir ${filePath!.split(Platform.pathSeparator).last}',
          fontWeight: FontWeight.w700,
          colorText: Colors.blueAccent,
          colorBorder: Colors.blueAccent,
          colorButton: Colors.white,
          sizeBorde: 2,
          onPressed: () => OpenFile.open(filePath!),
          useFlexible: true,
        );

      default:
        return Center(child: Text('Tipo de arquivo “.$ext” não suportado'));
    }
  }
}
