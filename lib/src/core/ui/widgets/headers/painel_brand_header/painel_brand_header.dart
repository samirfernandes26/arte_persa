import 'package:arte_persa/src/core/ui/constants/images_constants.dart';
import 'package:arte_persa/src/core/ui/widgets/components/painel_styles/painel_styles.dart';
import 'package:arte_persa/src/core/ui/widgets/components/painel_user_avatar/painel_user_avatar.dart';
import 'package:arte_persa/src/screens/painel/painel_session.dart';
import 'package:flutter/material.dart';

class PainelBrandHeader extends StatelessWidget {
  const PainelBrandHeader({
    super.key,
    required this.username,
    this.leading,
    this.compactLogoHeight = 82,
    this.expandedLogoHeight = 98,
  });

  final String username;
  final Widget? leading;
  final double compactLogoHeight;
  final double expandedLogoHeight;

  @override
  Widget build(BuildContext context) {
    final displayName = PainelSession.formatDisplayName(username);

    return LayoutBuilder(
      builder: (context, constraints) {
        final compact = constraints.maxWidth < 430;
        final headerHeight = compact ? 112.0 : 128.0;
        final logoHeight = compact ? compactLogoHeight : expandedLogoHeight;
        final nameFontSize = compact ? 16.0 : 18.0;
        final subtitleFontSize = compact ? 13.5 : 14.5;

        return SizedBox(
          height: headerHeight,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              if (leading != null)
                Align(
                  alignment: Alignment.topLeft,
                  child: leading!,
                ),
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: EdgeInsets.only(top: compact ? 2 : 0),
                  child: Image.asset(
                    ImagesConstants.logo,
                    height: logoHeight,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: compact ? 160 : 186,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PainelUserAvatar(
                        username: username,
                        radius: compact ? 24 : 26,
                      ),
                      const SizedBox(width: 10),
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 4),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                displayName,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: nameFontSize,
                                  color: PainelStyles.textPrimary,
                                  fontWeight: FontWeight.w700,
                                  height: 1.05,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Seja Bem vindo',
                                style: TextStyle(
                                  fontSize: subtitleFontSize,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
