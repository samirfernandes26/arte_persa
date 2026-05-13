import 'package:arte_persa/src/core/ui/widgets/forms/fields/cadastro_text_field/cadastro_text_field.dart';
import 'package:arte_persa/src/screens/ordens_servico/ordem_servico_mock_data.dart';
import 'package:flutter/material.dart';

class OrdemServicoObservationBlock extends StatelessWidget {
  const OrdemServicoObservationBlock({
    super.key,
    required this.label,
    required this.controller,
    required this.imageCount,
    required this.onCameraTap,
  });

  final String label;
  final TextEditingController controller;
  final int imageCount;
  final VoidCallback onCameraTap;

  @override
  Widget build(BuildContext context) {
    final images = OrdemServicoMockData.previewImages.take(imageCount).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 17,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: CadastroTextField(
                controller: controller,
                maxLines: 4,
              ),
            ),
            const SizedBox(width: 12),
            _CameraButton(onTap: onCameraTap),
          ],
        ),
        if (images.isNotEmpty) ...[
          const SizedBox(height: 12),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: images
                .map(
                  (image) => Container(
                    width: 78,
                    height: 78,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          image.backgroundColor.withValues(alpha: 0.92),
                          image.backgroundColor.withValues(alpha: 0.72),
                        ],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.10),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Icon(
                      image.icon,
                      size: 34,
                      color: Colors.white,
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ],
    );
  }
}

class _CameraButton extends StatelessWidget {
  const _CameraButton({
    required this.onTap,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          width: 58,
          height: 58,
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.96),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: const Color(0xFFD0B088),
              width: 1.2,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.08),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: const Icon(
            Icons.photo_camera_outlined,
            color: Color(0xFF8E633A),
            size: 28,
          ),
        ),
      ),
    );
  }
}
