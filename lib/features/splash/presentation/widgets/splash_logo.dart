import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_tamplate/core/core.dart';

/// White rounded tile with the MILON mark (Figma node "Logo", 120 × 120).
class SplashLogo extends StatelessWidget {
  const SplashLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120.r,
      height: 120.r,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(32.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.cta.withValues(alpha: 0.3),
            offset: Offset(0, 16.r),
            blurRadius: 20.r,
          ),
        ],
      ),
      child: SvgPicture.asset(
        IconPath.milonLogo,
        width: 75.28.r,
        height: 49.28.r,
      ),
    );
  }
}
