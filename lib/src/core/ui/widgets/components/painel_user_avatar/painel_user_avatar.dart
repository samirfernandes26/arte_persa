import 'package:arte_persa/src/screens/painel/painel_session.dart';
import 'package:arte_persa/src/core/ui/widgets/components/painel_styles/painel_styles.dart';
import 'package:flutter/material.dart';

class PainelUserAvatar extends StatelessWidget {
  const PainelUserAvatar({
    super.key,
    required this.username,
    this.imageProvider,
    this.radius = 31,
  });

  final String username;
  final ImageProvider<Object>? imageProvider;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            PainelStyles.accentColor,
            Color(0xFFE2C79E),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: PainelStyles.shadowColor.withValues(alpha: 0.25),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: CircleAvatar(
        radius: radius,
        backgroundColor: Colors.white,
        backgroundImage: imageProvider,
        child: imageProvider == null
            ? Text(
                PainelSession.initials(username),
                style: TextStyle(
                  color: PainelStyles.accentDark,
                  fontWeight: FontWeight.w700,
                  fontSize: radius * 0.58,
                ),
              )
            : null,
      ),
    );
  }
}
