part of './observacao_tile.dart';

Widget _renderLabel({
  required String titulo,
  required String conteudo,
  Color? colorConteudo,
  double? fontSizeConteudo,
  FontWeight? fontWeightConteudo,
}) {
  return Row(
    children: [
      Text(
        titulo,
        style: TextStyle(
          color: Colors.grey.shade900,
          fontWeight: FontWeight.w900,
          fontSize: 16,
        ),
      ),
      const SizedBox(
        width: 8,
      ),
      Text(
        conteudo,
        style: TextStyle(
          color: colorConteudo ?? Colors.white,
          fontSize: fontSizeConteudo ?? 16,
          fontWeight: fontWeightConteudo ?? FontWeight.normal,
        ),
      ),
    ],
  );
}

Widget renderImage({
  required String pathImage,
  required double size,
  required double borderRadio,
}) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(borderRadio),
    child: Image.file(
      File(pathImage),
      width: size,
      height: size,
      fit: BoxFit.cover,
    ),
  );
}

AlertDialog renderDialog({
  ImageModel? image,
  String? descricao,
  required BuildContext context,
}) {
  return AlertDialog(
    backgroundColor: Colors.grey.shade700,
    title: Text(
      'Visualização da observação',
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.grey.shade900,
        fontSize: 24,
      ),
    ),
    content: SingleChildScrollView(
      child: Column(
        children: [
          if (image?.pathLocal != null)
            renderImage(
              pathImage: image!.pathLocal!,
              borderRadio: 30.0,
              size: 320,
            )
          else if (image?.pathDownloadImage != null)
            renderImage(
              pathImage: image!.pathDownloadImage!,
              borderRadio: 30.0,
              size: 320,
            ),
          const SizedBox(
            height: 16,
          ),
          Text(
            descricao ?? '',
            overflow: TextOverflow.clip,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: Colors.grey.shade900,
              fontSize: 16,
            ),
            textAlign: TextAlign.justify,
          ),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
            width: 160,
            child: Button(
              textButton: 'Fechar',
              colorText: Colors.white,
              colorButton: Colors.orange.shade200,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          )
        ],
      ),
    ),
  );
}
