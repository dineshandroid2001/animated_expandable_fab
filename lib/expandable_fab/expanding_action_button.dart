import 'package:flutter/material.dart';

class ExpandingActionButton extends StatelessWidget {
  const ExpandingActionButton({
    super.key,
    required this.index,
    required this.itemSpacing,
    required this.progress,
    required this.child,
    this.onTap,
  });

  /// The index of this button in the list (0 = closest to FAB).
  final int index;

  /// Vertical spacing between each button.
  final double itemSpacing;

  final Animation<double> progress;
  final Widget child;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: progress,
      builder: (context, child) {
        final bottomOffset = 4.0 + (index + 1) * itemSpacing * progress.value;
        return Positioned(
          right: 4.0,
          bottom: bottomOffset,
          child: child!,
        );
      },
      child: FadeTransition(
        opacity: progress,
        child: GestureDetector(
          onTap: onTap,
          child: child,
        ),
      ),
    );
  }
}
