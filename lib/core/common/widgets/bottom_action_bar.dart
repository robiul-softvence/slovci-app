import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_tamplate/core/utils/constants/colors.dart';
import 'package:flutter_tamplate/core/utils/constants/sizer.dart';

/// Figma "Footer CTA": white bar pinned to the bottom with the main action
/// and a secondary line below it (12 px gap, 20 px side padding).
class BottomActionBar extends StatelessWidget {
  const BottomActionBar({super.key, required this.primary, this.secondary});

  final Widget primary;
  final Widget? secondary;

  @override
  Widget build(BuildContext context) {
    // Figma reserves 34 px for the home indicator; never go below 24 px on
    // devices without one.
    final bottomInset = math.max(
      MediaQuery.viewPaddingOf(context).bottom,
      24.0,
    );

    return ColoredBox(
      color: AppColors.white,
      child: Padding(
        padding: EdgeInsets.fromLTRB(20.w, 12, 20.w, bottomInset),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            primary,
            if (secondary != null) ...[const SizedBox(height: 12), secondary!],
          ],
        ),
      ),
    );
  }
}
