import 'package:flutter/material.dart';

class AnimatedBorder extends StatefulWidget {
  final Widget child;
  final Color borderColor;
  final double borderWidth;
  final double radius;

  const AnimatedBorder({
    Key? key,
    required this.child,
    this.borderColor = Colors.blue,
    this.borderWidth = 1.5,
    this.radius = 5.0,
  }) : super(key: key);

  @override
  State<AnimatedBorder> createState() => _AnimatedBorderState();
}

class _AnimatedBorderState extends State<AnimatedBorder>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat(); // حركة مستمرة
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: BorderPainter(
        animation: _controller,
        color: Theme.of(context).primaryColor,
        width: widget.borderWidth,
        radius: widget.radius,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.radius),
        ),
        child: widget.child,
      ),
    );
  }
}

class BorderPainter extends CustomPainter {
  final Animation<double> animation;
  final Color color;
  final double width;
  final double radius;

  BorderPainter({
    required this.animation,
    required this.color,
    required this.width,
    required this.radius,
  }) : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    final rrect = RRect.fromRectAndRadius(rect, Radius.circular(radius));
    final paint = Paint()
      ..color = color.withOpacity(0.2)
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;

    canvas.drawRRect(rrect, paint);

    final path = Path()..addRRect(rrect);
    final totalLength =
        path.computeMetrics().fold(0.0, (sum, m) => sum + m.length);

    // الكرة الأولى (نفس الكود الأصلي)
    final currentLength = animation.value * totalLength;

    // الكرة الثانية (تتحرك بنصف المسافة خلف الكرة الأولى)
    final secondBallLength = (animation.value + 0.5) % 1.0 * totalLength;

    final metrics = path.computeMetrics();
    double drawnLength = 0.0;
    bool firstBallDrawn = false;
    bool secondBallDrawn = false;

    for (var metric in metrics) {
      if (!firstBallDrawn && drawnLength + metric.length >= currentLength) {
        final pos = metric.getTangentForOffset(currentLength - drawnLength);
        if (pos != null) {
          canvas.drawCircle(pos.position, 4, Paint()..color = color);
        }
        firstBallDrawn = true;
      }

      if (!secondBallDrawn && drawnLength + metric.length >= secondBallLength) {
        final pos = metric.getTangentForOffset(secondBallLength - drawnLength);
        if (pos != null) {
          canvas.drawCircle(pos.position, 4, Paint()..color = color);
        }
        secondBallDrawn = true;
      }

      if (firstBallDrawn && secondBallDrawn) break;
      drawnLength += metric.length;
    }
  }

  @override
  bool shouldRepaint(BorderPainter oldDelegate) => true;
}
