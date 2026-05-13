import 'package:flutter/material.dart';

class NotificacaoDialog extends StatelessWidget {
  const NotificacaoDialog({super.key, this.notificacao});

  final NotificacaoModel? notificacao;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      surfaceTintColor: Colors.transparent,
      backgroundColor: context.brightness == Brightness.dark
          ? context.theme.colorScheme.onSurface
          : null,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      icon: Icon(
        Icons.notifications_none,
        color: context.brightness == Brightness.light
            ? Colors.blueAccent
            : Colors.white,
        size: 56,
      ),
      title: Text(
        notificacao!.title.toUpperCase(),
        style: TextStyle(
          color: context.brightness == Brightness.light
              ? Colors.blueAccent
              : Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
      ),
      content: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (notificacao!.imageUrl != null)
              Image.network(
                notificacao!.imageUrl!,
                fit: BoxFit.fitWidth,
                height: 240,
                width: double.maxFinite,
              ),
            const SizedBox(height: 8),
            Text(
              notificacao!.descricao,
              textAlign: TextAlign.justify,
              style: TextStyle(
                color: context.brightness == Brightness.light
                    ? Colors.blueAccent
                    : Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
      ),
      actions: [
        Button(
          textButton: 'Fechar',
          colorText: Colors.white,
          colorButton: Colors.redAccent,
          fontWeight: FontWeight.w700,
          onPressed: () => context.navigator.pop(),
        ),
      ],
    );
  }
}
