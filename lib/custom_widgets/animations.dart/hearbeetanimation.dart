import 'package:flutter/material.dart';
import 'package:food_delivery/constants/colors.dart';
import 'package:food_delivery/custom_widgets/text.dart';
import 'dart:math';

class HeartbeatButton extends StatefulWidget {
  const HeartbeatButton({super.key});

  @override
  State<HeartbeatButton> createState() => _HeartbeatButtonState();
}

class _HeartbeatButtonState extends State<HeartbeatButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    )..repeat(reverse: true); // Creates the beat animation

    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut, // Smooth grow/shrink
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose(); // Always dispose controllers
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scaleAnimation,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(555),
          color: AppColors.softGreen,
          border: Border.all(color: AppColors.lightGrey),
        ),
        child: const MainBody(
          title: "Active",
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class ConicGlowBorderPainter extends CustomPainter {
  final double rotation;

  ConicGlowBorderPainter({required this.rotation});

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final radius = 555.0;

    final rrect = RRect.fromRectAndRadius(
      rect.inflate(4),
      Radius.circular(radius),
    );

    final sweepGradient = SweepGradient(
      startAngle: 0,
      endAngle: 2 * pi,
      transform: GradientRotation(2 * pi * rotation),
      colors: const [
        Color(0xFFFF0000),
        Color(0xFFFF7300),
        Color(0xFFFFFB00),
        Color(0xFF48FF00),
        Color(0xFF00FFD5),
        Color(0xFF002BFF),
        Color(0xFF7A00FF),
        Color(0xFFFF00C8),
        Color(0xFFFF0000),
      ],
    );

    final paint =
        Paint()
          ..shader = sweepGradient.createShader(rect.inflate(2))
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1
          ..maskFilter = const MaskFilter.blur(
            BlurStyle.normal,
            1,
          ); // glow effect

    canvas.drawRRect(rrect, paint);
  }

  @override
  bool shouldRepaint(covariant ConicGlowBorderPainter oldDelegate) =>
      oldDelegate.rotation != rotation;
}
