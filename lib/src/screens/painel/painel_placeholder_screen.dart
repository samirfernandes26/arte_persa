import 'package:arte_persa/src/core/ui/widgets/components/painel_background_scaffold/painel_background_scaffold.dart';
import 'package:arte_persa/src/core/ui/widgets/components/painel_page_scaffold/painel_page_scaffold.dart';
import 'package:arte_persa/src/core/ui/widgets/components/painel_styles/painel_styles.dart';
import 'package:arte_persa/src/screens/painel/painel_navigation.dart';
import 'package:arte_persa/src/screens/painel/painel_session.dart';
import 'package:flutter/material.dart';

class PainelPlaceholderScreen extends StatelessWidget {
  const PainelPlaceholderScreen({
    super.key,
    required this.item,
  });

  final PainelDrawerItem item;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: PainelSession.loadUsername(),
      builder: (context, snapshot) {
        final username = snapshot.data ?? 'Visitante';

        return PainelPageScaffold(
          selectedItem: item,
          username: username,
          body: PainelBackgroundScaffold(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.label,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: PainelStyles.textPrimary,
                      ),
                ),
                const SizedBox(height: 18),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.90),
                    borderRadius: BorderRadius.circular(28),
                    border: Border.all(
                      color: PainelStyles.borderColor.withValues(alpha: 0.75),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: PainelStyles.shadowColor.withValues(alpha: 0.28),
                        blurRadius: 24,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        item.icon,
                        size: 54,
                        color: PainelStyles.accentDark,
                      ),
                      const SizedBox(height: 14),
                      Text(
                        item.label,
                        textAlign: TextAlign.center,
                        style:
                            Theme.of(context).textTheme.headlineSmall?.copyWith(
                                  color: PainelStyles.textPrimary,
                                  fontWeight: FontWeight.w700,
                                ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        item.placeholderDescription,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: PainelStyles.textSecondary,
                              height: 1.4,
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
