import 'package:flutter/material.dart';

class Dialog {
  static void showTopMessage({
    required BuildContext context,
    required String message,
    Color backgroundColor = Colors.black87,
    Duration duration = const Duration(seconds: 2),
  }) {
    final overlay = Overlay.of(context);
    late OverlayEntry entry;
    final animationController = AnimationController(
      vsync: Navigator.of(context),
      duration: const Duration(milliseconds: 300),
    );

    final opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeInOut),
    );

    final offsetAnimation =
        Tween<Offset>(
          begin: const Offset(0, -1),
          end: const Offset(0, 0),
        ).animate(
          CurvedAnimation(parent: animationController, curve: Curves.easeInOut),
        );

    entry = OverlayEntry(
      builder: (context) => Positioned(
        top: MediaQuery.of(context).padding.top + 16,
        left: 20,
        right: 20,
        child: Material(
          color: Colors.transparent,
          child: SlideTransition(
            position: offsetAnimation,
            child: FadeTransition(
              opacity: opacityAnimation,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Text(
                  message,
                  style: const TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
      ),
    );

    overlay.insert(entry);
    animationController.forward();

    Future.delayed(duration, () async {
      await animationController.reverse();
      entry.remove();
      animationController.dispose();
    });
  }
}
