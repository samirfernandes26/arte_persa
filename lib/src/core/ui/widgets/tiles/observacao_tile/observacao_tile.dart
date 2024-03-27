import 'dart:io';

import 'package:arte_persa/src/core/ui/widgets/buttons/buttons.dart';
import 'package:arte_persa/src/model/image_model.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

part './components.dart';

class ObservacaoTile extends StatelessWidget {
  const ObservacaoTile({
    super.key,
    this.descricao,
    this.image,
  });

  final ImageModel? image;
  final String? descricao;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      borderOnForeground: false,
      color: Colors.transparent,
      child: InkWell(
        overlayColor: MaterialStateProperty.all(
          Colors.orange.shade300.withOpacity(0.30),
        ),
        // onTap: () async {
        //   await showDialog(
        //     context: context,
        //     builder: (context) => renderDialog(
        //       image: image,
        //       descricao: descricao,
        //     ),
        //   );
        // },
        onTap: () async {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return renderDialog(
                context: context,
                image: image,
                descricao: descricao,
              );
            },
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (image?.pathLocal != null)
                renderImage(
                  pathImage: image!.pathLocal!,
                  borderRadio: 10.0,
                  size: 40,
                )
              else if (image?.pathDownloadImage != null)
                renderImage(
                  pathImage: image!.pathDownloadImage!,
                  borderRadio: 10.0,
                  size: 40,
                ),
              const SizedBox(
                width: 8,
              ),
              Flexible(
                child: AutoSizeText(
                  descricao ?? '',
                  maxLines: 4,
                  minFontSize: 12,
                  maxFontSize: 12,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.grey.shade900),
                  textAlign: TextAlign.justify,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
