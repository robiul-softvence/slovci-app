import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_tamplate/core/core.dart';

class _BodyHotspot {
  const _BodyHotspot({
    required this.zone,
    required this.viewLabel,
    required this.fx,
    required this.fy,
  });

  final String zone;
  final String viewLabel;
  final double fx;
  final double fy;
}

/// Interactive Front & Back body map widget for "02 · Injury Body Map".
class InjuryBodyMapCards extends StatelessWidget {
  const InjuryBodyMapCards({
    super.key,
    required this.selectedZones,
    required this.onTapZone,
  });

  final Set<String> selectedZones;
  final void Function(String zone, String viewLabel) onTapZone;

  static const _frontHotspots = <_BodyHotspot>[
    _BodyHotspot(
      zone: 'Shoulders',
      viewLabel: 'Front view · Left side',
      fx: 0.30,
      fy: 0.26,
    ),
    _BodyHotspot(
      zone: 'Shoulders',
      viewLabel: 'Front view · Right side',
      fx: 0.70,
      fy: 0.26,
    ),
    _BodyHotspot(
      zone: 'Wrists & Hands',
      viewLabel: 'Front view · Both sides',
      fx: 0.16,
      fy: 0.65,
    ),
    _BodyHotspot(
      zone: 'Wrists & Hands',
      viewLabel: 'Front view · Both sides',
      fx: 0.84,
      fy: 0.65,
    ),
    _BodyHotspot(
      zone: 'Knees',
      viewLabel: 'Front view · Both sides',
      fx: 0.40,
      fy: 0.74,
    ),
    _BodyHotspot(
      zone: 'Knees',
      viewLabel: 'Front view · Both sides',
      fx: 0.60,
      fy: 0.74,
    ),
  ];

  static const _backHotspots = <_BodyHotspot>[
    _BodyHotspot(
      zone: 'Shoulders',
      viewLabel: 'Back view · Left side',
      fx: 0.30,
      fy: 0.26,
    ),
    _BodyHotspot(
      zone: 'Shoulders',
      viewLabel: 'Back view · Right side',
      fx: 0.70,
      fy: 0.26,
    ),
    _BodyHotspot(
      zone: 'Back',
      viewLabel: 'Back view · Upper back',
      fx: 0.50,
      fy: 0.35,
    ),
    _BodyHotspot(
      zone: 'Back',
      viewLabel: 'Back view · Lower back',
      fx: 0.50,
      fy: 0.51,
    ),
    _BodyHotspot(
      zone: 'Thighs & Calves',
      viewLabel: 'Back view · Both sides',
      fx: 0.40,
      fy: 0.82,
    ),
    _BodyHotspot(
      zone: 'Thighs & Calves',
      viewLabel: 'Back view · Both sides',
      fx: 0.60,
      fy: 0.82,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _BodyMapPanel(
            title: 'FRONT',
            svgPath: IconPath.obBodyMapFront,
            hotspots: _frontHotspots,
            selectedZones: selectedZones,
            onTapZone: onTapZone,
          ),
        ),
        Gap.h(12),
        Expanded(
          child: _BodyMapPanel(
            title: 'BACK',
            svgPath: IconPath.obBodyMapBack,
            hotspots: _backHotspots,
            selectedZones: selectedZones,
            onTapZone: onTapZone,
          ),
        ),
      ],
    );
  }
}

class _BodyMapPanel extends StatelessWidget {
  const _BodyMapPanel({
    required this.title,
    required this.svgPath,
    required this.hotspots,
    required this.selectedZones,
    required this.onTapZone,
  });

  final String title;
  final String svgPath;
  final List<_BodyHotspot> hotspots;
  final Set<String> selectedZones;
  final void Function(String zone, String viewLabel) onTapZone;

  @override
  Widget build(BuildContext context) {
    final text = AppTextStyle(context);

    return Container(
      height: 318.h,
      padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 8.w),
      decoration: BoxDecoration(
        color: AppColors.pearl,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: text.boldTextStyle(
              fontSize: 11,
              lineHeight: 14,
              letterSpacing: 0.8,
              color: AppColors.muted,
            ),
          ),
          Gap(6),
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                final w = constraints.maxWidth;
                final h = constraints.maxHeight;
                return Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned.fill(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6.w),
                        child: SvgPicture.asset(
                          svgPath,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    ...hotspots.map((spot) {
                      final isSelected = selectedZones.contains(spot.zone);
                      final markerSize = isSelected ? 30.r : 18.r;
                      return Positioned(
                        left: (w * spot.fx) - (markerSize / 2),
                        top: (h * spot.fy) - (markerSize / 2),
                        child: GestureDetector(
                          onTap: () => onTapZone(spot.zone, spot.viewLabel),
                          behavior: HitTestBehavior.opaque,
                          child: _HotspotDot(selected: isSelected),
                        ),
                      );
                    }),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _HotspotDot extends StatelessWidget {
  const _HotspotDot({required this.selected});

  final bool selected;

  @override
  Widget build(BuildContext context) {
    if (selected) {
      return Container(
        width: 30.r,
        height: 30.r,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.coral.withValues(alpha: 0.22),
        ),
        child: Center(
          child: Container(
            width: 16.r,
            height: 16.r,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.coral,
              border: Border.all(color: AppColors.white, width: 2),
            ),
          ),
        ),
      );
    }

    // The Figma body_map SVGs already draw the dashed coral rings for unselected
    // joints; keep a generous transparent hit target so there is no double ring.
    return SizedBox(width: 28.r, height: 28.r);
  }
}
