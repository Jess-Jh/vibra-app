import 'package:flutter/material.dart';

class AnimatedPlayIndicator extends StatefulWidget {
  final bool isPlaying;
  const AnimatedPlayIndicator({super.key, required this.isPlaying});

  @override
  State<AnimatedPlayIndicator> createState() => _AnimatedPlayIndicatorState();
}

class _AnimatedPlayIndicatorState extends State<AnimatedPlayIndicator>
    with TickerProviderStateMixin {
  late final List<AnimationController> _controllers;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(4, (i) {
      final controller =
          AnimationController(
            vsync: this,
            duration: Duration(milliseconds: 300 + i * 100),
            lowerBound: 0.2,
            upperBound: 1.0,
          )..addListener(() {
            setState(() {});
          });
      if (widget.isPlaying) controller.repeat(reverse: true);
      return controller;
    });
  }

  @override
  void didUpdateWidget(covariant AnimatedPlayIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isPlaying != oldWidget.isPlaying) {
      for (final controller in _controllers) {
        widget.isPlaying ? controller.repeat(reverse: true) : controller.stop();
      }
    }
  }

  @override
  void dispose() {
    for (final controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(4, (i) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 1),
          child: Container(
            width: 4,
            height: 20 * _controllers[i].value,
            decoration: BoxDecoration(
              color: Colors.greenAccent,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        );
      }),
    );
  }
}
