part of './item_card.dart';

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
  return Align(
    alignment: Alignment.centerLeft,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(borderRadio),
      child: Image.file(
        File(pathImage),
        width: size,
        height: size,
        fit: BoxFit.cover,
      ),
    ),
  );
}
