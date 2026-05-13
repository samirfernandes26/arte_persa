import 'package:flutter/material.dart';

class OrdemServicoSignaturePad extends StatefulWidget {
  const OrdemServicoSignaturePad({
    super.key,
    required this.onChanged,
  });

  final ValueChanged<bool> onChanged;

  @override
  State<OrdemServicoSignaturePad> createState() =>
      _OrdemServicoSignaturePadState();
}

class _OrdemServicoSignaturePadState extends State<OrdemServicoSignaturePad> {
  final List<Offset?> _points = [];

  void _addPoint(Offset point) {
    setState(() {
      _points.add(point);
    });
    widget.onChanged(_points.whereType<Offset>().isNotEmpty);
  }

  void _endStroke() {
    setState(() {
      _points.add(null);
    });
    widget.onChanged(_points.whereType<Offset>().isNotEmpty);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.96),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xFFCBAE8D),
          width: 1.2,
        ),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: GestureDetector(
              onPanStart: (details) => _addPoint(details.localPosition),
              onPanUpdate: (details) => _addPoint(details.localPosition),
              onPanEnd: (_) => _endStroke(),
              child: CustomPaint(
                painter: _SignaturePainter(_points),
                child: const SizedBox.expand(),
              ),
            ),
          ),
          Positioned(
            left: 12,
            right: 12,
            bottom: 12,
            child: Container(
              height: 1,
              color: const Color(0xFFD6C2A8),
            ),
          ),
        ],
      ),
    );
  }
}

class _SignaturePainter extends CustomPainter {
  _SignaturePainter(this.points);

  final List<Offset?> points;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 3.4
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    for (var i = 0; i < points.length - 1; i++) {
      final current = points[i];
      final next = points[i + 1];
      if (current != null && next != null) {
        canvas.drawLine(current, next, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant _SignaturePainter oldDelegate) {
    return oldDelegate.points != points;
  }
}
