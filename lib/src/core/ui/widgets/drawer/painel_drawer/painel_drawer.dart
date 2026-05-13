import 'package:arte_persa/src/core/ui/widgets/components/painel_styles/painel_styles.dart';
import 'package:arte_persa/src/core/ui/widgets/components/painel_user_avatar/painel_user_avatar.dart';
import 'package:arte_persa/src/screens/painel/painel_navigation.dart';
import 'package:arte_persa/src/screens/painel/painel_session.dart';
import 'package:arte_persa/src/shared/infra/routes/route_generator.dart';
import 'package:flutter/material.dart';

class PainelDrawer extends StatelessWidget {
  const PainelDrawer({
    super.key,
    required this.selectedItem,
    required this.username,
  });

  final PainelDrawerItem selectedItem;
  final String username;

  @override
  Widget build(BuildContext context) {
    final displayName = PainelSession.formatDisplayName(username);

    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.horizontal(
          right: Radius.circular(PainelStyles.drawerRadius),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.96),
          borderRadius: const BorderRadius.horizontal(
            right: Radius.circular(PainelStyles.drawerRadius),
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(18, 18, 12, 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    PainelUserAvatar(username: username, radius: 28),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            displayName,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 16,
                              color: PainelStyles.textPrimary,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            'Menu principal',
                            style: TextStyle(
                              fontSize: 13,
                              color: PainelStyles.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                for (final item in PainelDrawerItem.values) ...[
                  _PainelDrawerTile(
                    item: item,
                    selected: item == selectedItem,
                    onTap: () {
                      final navigator = Navigator.of(context);
                      navigator.pop();
                      if (item == selectedItem) {
                        return;
                      }
                      navigator.pushNamedAndRemoveUntil(
                        item.routeName,
                        (_) => false,
                      );
                    },
                  ),
                  const SizedBox(height: 8),
                ],
                const Spacer(),
                const Divider(height: 1),
                const SizedBox(height: 12),
                _PainelDrawerActionTile(
                  icon: Icons.logout_rounded,
                  label: 'Sair',
                  onTap: () async {
                    Navigator.of(context).pop();
                    await PainelSession.clearSession();
                    if (!context.mounted) {
                      return;
                    }
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      RouteGeneratorKeys.authLogin,
                      (_) => false,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _PainelDrawerTile extends StatelessWidget {
  const _PainelDrawerTile({
    required this.item,
    required this.selected,
    required this.onTap,
  });

  final PainelDrawerItem item;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: selected ? PainelStyles.selectedDrawerColor : Colors.transparent,
      borderRadius: BorderRadius.circular(18),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(18),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
          child: Row(
            children: [
              Icon(
                item.icon,
                color: selected
                    ? PainelStyles.accentDark
                    : PainelStyles.textSecondary,
              ),
              const SizedBox(width: 14),
              Text(
                item.label,
                style: TextStyle(
                  fontSize: 16,
                  color: selected
                      ? PainelStyles.accentDark
                      : PainelStyles.textPrimary,
                  fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PainelDrawerActionTile extends StatelessWidget {
  const _PainelDrawerActionTile({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(18),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(18),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
          child: Row(
            children: [
              const Icon(
                Icons.logout_rounded,
                color: PainelStyles.textSecondary,
              ),
              const SizedBox(width: 14),
              Text(
                label,
                style: const TextStyle(
                  fontSize: 16,
                  color: PainelStyles.textPrimary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
