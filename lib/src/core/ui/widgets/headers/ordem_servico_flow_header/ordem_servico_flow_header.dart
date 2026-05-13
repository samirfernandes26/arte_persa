import 'package:arte_persa/src/core/ui/constants/images_constants.dart';
import 'package:flutter/material.dart';

class OrdemServicoFlowHeader extends StatelessWidget {
  const OrdemServicoFlowHeader({
    super.key,
    required this.onBackTap,
  });

  final VoidCallback onBackTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: onBackTap,
                borderRadius: BorderRadius.circular(20),
                child: const Padding(
                  padding: EdgeInsets.all(8),
                  child: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    size: 30,
                    color: Color(0xFF2E2218),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Image.asset(
              ImagesConstants.logo,
              height: 82,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}
