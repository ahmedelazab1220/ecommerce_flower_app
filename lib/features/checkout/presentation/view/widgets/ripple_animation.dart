import 'package:flutter/material.dart';

import '../../../../../core/assets/app_colors.dart';

class RippleAnimation extends StatefulWidget {
  const RippleAnimation({super.key});

  @override
  _RippleAnimationState createState() => _RippleAnimationState();
}

class _RippleAnimationState extends State<RippleAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const baseSize = 150 / 2;
    return SizedBox(
      width: 150,
      height: 150,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (_, __) {
          return Stack(
            alignment: Alignment.center,
            children: List.generate(3, (i) {
              final progress = (_controller.value + i * 0.3) % 1;
              final diameter = baseSize + progress * baseSize;
              final opacity = (1 - progress).clamp(0.0, 1.0);
              return Container(
                width: diameter,
                height: diameter,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.green.withValues(alpha: opacity * 0.7),
                ),
              );
            })..add(
              Container(
                width: baseSize,
                height: baseSize,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.green,
                ),
                child: const Icon(
                  Icons.check,
                  color: AppColors.white,
                  size: 40,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
