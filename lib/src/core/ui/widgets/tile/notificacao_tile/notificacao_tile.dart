import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';

class NotificacaoTile extends StatelessWidget {
  final NotificacaoModel notificacao;
  final void Function()? onTap;
  final void Function()? onLongPress;
  final void Function()? onDelete;
  final bool isViewed;

  const NotificacaoTile({
    super.key,
    this.onTap,
    this.onDelete,
    this.onLongPress,
    this.isViewed = true,
    required this.notificacao,
  });

  @override
  Widget build(BuildContext context) {
    return Slidable(
      enabled: true,
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          IconButton(
            icon: const Icon(Icons.delete),
            color: Colors.blueAccent,
            iconSize: 32,
            onPressed: onDelete,
          ),
        ],
      ),
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 5,
        surfaceTintColor: context.theme.colorScheme.surface,
        child: ListTile(
          onTap: onTap,
          onLongPress: onLongPress,
          leading: Stack(
            children: [
              const Icon(
                Icons.notifications_active,
                size: 36,
                color: Colors.blueAccent,
              ),
              if (notificacao.readedAt == null)
                Positioned(
                  child: Container(
                    width: 10,
                    height: 10,
                    decoration: const BoxDecoration(
                      color: Colors.redAccent,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
            ],
          ),
          contentPadding: const EdgeInsets.all(16),
          title: Text(
            notificacao.title.toUpperCase(),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          titleTextStyle: context.theme.textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.w700,
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                notificacao.descricao,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: context.theme.textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w300,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                (DateFormat(
                  'dd/MM/yyyy HH:mm',
                ).format(notificacao.sendedAt!)).toString(),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: context.theme.textTheme.labelSmall?.copyWith(
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
          trailing: Icon(
            Icons.done_all,
            color: notificacao.readedAt != null
                ? Colors.blueAccent
                : Colors.grey,
          ),
        ),
      ),
    );
  }
}
