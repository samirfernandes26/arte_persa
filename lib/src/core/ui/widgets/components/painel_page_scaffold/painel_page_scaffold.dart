import 'package:arte_persa/src/core/ui/widgets/components/painel_styles/painel_styles.dart';
import 'package:arte_persa/src/core/ui/widgets/drawer/painel_drawer/painel_drawer.dart';
import 'package:arte_persa/src/screens/painel/painel_navigation.dart';
import 'package:flutter/material.dart';

class PainelPageScaffold extends StatelessWidget {
  const PainelPageScaffold({
    super.key,
    required this.selectedItem,
    required this.username,
    required this.body,
  });

  final PainelDrawerItem selectedItem;
  final String username;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PainelStyles.backgroundColor,
      extendBodyBehindAppBar: true,
      drawer: PainelDrawer(
        selectedItem: selectedItem,
        username: username,
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        shadowColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 0,
        toolbarHeight: 58,
        leadingWidth: 64,
        leading: Builder(
          builder: (context) {
            return Padding(
              padding: const EdgeInsets.only(left: 12, top: 8),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.92),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: PainelStyles.shadowColor.withValues(alpha: 0.20),
                      blurRadius: 14,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: IconButton(
                  onPressed: () => Scaffold.of(context).openDrawer(),
                  icon: const Icon(
                    Icons.menu_rounded,
                    color: PainelStyles.accentDark,
                  ),
                ),
              ),
            );
          },
        ),
      ),
      body: body,
    );
  }
}
