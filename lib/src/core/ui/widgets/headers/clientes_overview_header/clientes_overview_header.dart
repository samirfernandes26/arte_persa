import 'package:arte_persa/src/core/ui/constants/images_constants.dart';
import 'package:arte_persa/src/core/ui/widgets/components/painel_styles/painel_styles.dart';
import 'package:arte_persa/src/core/ui/widgets/components/painel_user_avatar/painel_user_avatar.dart';
import 'package:arte_persa/src/screens/painel/painel_session.dart';
import 'package:flutter/material.dart';

class ClientesOverviewHeader extends StatelessWidget {
  const ClientesOverviewHeader({
    super.key,
    required this.username,
    required this.onCreateTap,
  });

  final String username;
  final VoidCallback onCreateTap;

  @override
  Widget build(BuildContext context) {
    final displayName = PainelSession.formatDisplayName(username);

    return LayoutBuilder(
      builder: (context, constraints) {
        final compact = constraints.maxWidth < 430;
        final headerHeight = compact ? 112.0 : 128.0;
        final logoHeight = compact ? 82.0 : 98.0;
        final nameFontSize = compact ? 16.0 : 18.0;
        final subtitleFontSize = compact ? 13.5 : 14.5;

        return SizedBox(
          height: headerHeight,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: _AddClientButton(onTap: onCreateTap),
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
                          username: username, radius: compact ? 24 : 26),
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

class _AddClientButton extends StatelessWidget {
  const _AddClientButton({
    required this.onTap,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(22),
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: Text(
            '+',
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  color: PainelStyles.accentDark,
                  fontWeight: FontWeight.w300,
                  height: 0.8,
                ),
          ),
        ),
      ),
    );
  }
}
