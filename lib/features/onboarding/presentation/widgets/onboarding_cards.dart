import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_tamplate/core/core.dart';

/// Section header with optional coral inline highlight (e.g. "· 3 recommended").
class OnboardingSectionTitle extends StatelessWidget {
  const OnboardingSectionTitle({
    super.key,
    required this.title,
    this.accent,
  });

  final String title;
  final String? accent;

  @override
  Widget build(BuildContext context) {
    final text = AppTextStyle(context);

    if (accent == null) {
      return Text(
        title,
        style: text.semiBoldTextStyle(
          fontSize: 17,
          lineHeight: 22,
          color: AppColors.ink,
        ),
      );
    }

    return RichText(
      text: TextSpan(
        style: text.semiBoldTextStyle(
          fontSize: 17,
          lineHeight: 22,
          color: AppColors.ink,
        ),
        children: [
          TextSpan(text: title),
          TextSpan(
            text: '  ·  $accent',
            style: text.semiBoldTextStyle(
              fontSize: 15,
              lineHeight: 22,
              color: AppColors.cta,
            ),
          ),
        ],
      ),
    );
  }
}

/// 24 px circular radio/check badge used on selectable onboarding cards.
class OnboardingCheckBadge extends StatelessWidget {
  const OnboardingCheckBadge({super.key, required this.selected});

  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24.r,
      height: 24.r,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: selected ? AppColors.coral : AppColors.white,
        border: Border.all(
          color: selected ? AppColors.coral : AppColors.line,
          width: 1.5,
        ),
      ),
      child: selected
          ? Center(
              child: SvgPicture.asset(
                IconPath.obCheck,
                width: 13.r,
                height: 13.r,
                colorFilter: const ColorFilter.mode(
                  AppColors.white,
                  BlendMode.srcIn,
                ),
              ),
            )
          : null,
    );
  }
}

/// Tinted rounded info banner with blue info icon (used on 01b, 02, 03, 03b).
class OnboardingInfoBanner extends StatelessWidget {
  const OnboardingInfoBanner({
    super.key,
    required this.text,
    this.backgroundColor = AppColors.pearl,
    this.iconPath = IconPath.obInfo,
    this.textColor = AppColors.muted,
  });

  final String text;
  final Color backgroundColor;
  final String iconPath;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    final style = AppTextStyle(context);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 1.h),
            child: SvgPicture.asset(
              iconPath,
              width: 18.r,
              height: 18.r,
            ),
          ),
          Gap.h(10),
          Expanded(
            child: Text(
              text,
              style: style.regularTextStyle(
                fontSize: 13,
                lineHeight: 18,
                color: textColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Selectable peach-outline pill button (used for Gender, Demo model, etc.).
class OnboardingChoicePill extends StatelessWidget {
  const OnboardingChoicePill({
    super.key,
    required this.label,
    required this.selected,
    required this.onTap,
    this.height = 46,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;
  final double height;

  @override
  Widget build(BuildContext context) {
    final text = AppTextStyle(context);

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 160),
        height: height.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: selected ? AppColors.peach : AppColors.pearl,
          borderRadius: BorderRadius.circular(14.r),
          border: Border.all(
            color: selected ? AppColors.coral : AppColors.transparent,
            width: 1.5,
          ),
        ),
        child: Text(
          label,
          style: text.semiBoldTextStyle(
            fontSize: AppTextStyle.md,
            lineHeight: 18,
            color: selected ? AppColors.cta : AppColors.ink,
          ),
        ),
      ),
    );
  }
}

/// Ink-selected pill chip (used in Body Map list, Injury conditions, Diet, Session length).
class OnboardingTagChip extends StatelessWidget {
  const OnboardingTagChip({
    super.key,
    required this.label,
    required this.selected,
    required this.onTap,
    this.selectedBg = AppColors.ink,
    this.selectedText = AppColors.white,
    this.unselectedBg = AppColors.pearl,
    this.unselectedText = AppColors.ink,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;
  final Color selectedBg;
  final Color selectedText;
  final Color unselectedBg;
  final Color unselectedText;

  @override
  Widget build(BuildContext context) {
    final text = AppTextStyle(context);

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: selected ? selectedBg : unselectedBg,
          borderRadius: BorderRadius.circular(99.r),
        ),
        child: Text(
          label,
          style: text.semiBoldTextStyle(
            fontSize: 13,
            lineHeight: 16,
            color: selected ? selectedText : unselectedText,
          ),
        ),
      ),
    );
  }
}

/// Pearl segmented bar with white active pill (used on 02b, 03b, 04, 04d).
class OnboardingSegmentedControl<T> extends StatelessWidget {
  const OnboardingSegmentedControl({
    super.key,
    required this.items,
    required this.selected,
    required this.onSelect,
    required this.labelBuilder,
    this.subtitleBuilder,
    this.selectedTextColor = AppColors.cta,
    this.padding = 4,
  });

  final List<T> items;
  final T selected;
  final ValueChanged<T> onSelect;
  final String Function(T) labelBuilder;
  final String? Function(T)? subtitleBuilder;
  final Color selectedTextColor;
  final double padding;

  @override
  Widget build(BuildContext context) {
    final text = AppTextStyle(context);

    return Container(
      padding: EdgeInsets.all(padding.r),
      decoration: BoxDecoration(
        color: AppColors.pearl,
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: Row(
        children: items.map((item) {
          final isSelected = item == selected;
          final sub = subtitleBuilder?.call(item);

          return Expanded(
            child: GestureDetector(
              onTap: () => onSelect(item),
              behavior: HitTestBehavior.opaque,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 160),
                padding: EdgeInsets.symmetric(
                  vertical: sub != null ? 10.h : 11.h,
                  horizontal: 4.w,
                ),
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.white : AppColors.transparent,
                  borderRadius: BorderRadius.circular(11.r),
                  boxShadow: isSelected
                      ? [
                          BoxShadow(
                            color: AppColors.ink.withValues(alpha: 0.06),
                            blurRadius: 6,
                            offset: const Offset(0, 2),
                          ),
                        ]
                      : null,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      labelBuilder(item),
                      textAlign: TextAlign.center,
                      style: text.boldTextStyle(
                        fontSize: sub != null ? 18 : 14,
                        lineHeight: sub != null ? 22 : 18,
                        color: isSelected ? selectedTextColor : AppColors.ink,
                      ),
                    ),
                    if (sub != null) ...[
                      Gap(2),
                      Text(
                        sub,
                        style: text.regularTextStyle(
                          fontSize: AppTextStyle.sm,
                          lineHeight: 15,
                          color: AppColors.muted,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
