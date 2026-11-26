import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_tamplate/core/core.dart';

class SettingsSectionLabel extends StatelessWidget {
  const SettingsSectionLabel(this.label, {super.key});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: Text(
        label.toUpperCase(),
        style: AppTextStyle(context).boldTextStyle(
          fontSize: 11,
          letterSpacing: 0.7,
          color: AppColors.muted,
        ),
      ),
    );
  }
}

class SettingsCardGroup extends StatelessWidget {
  const SettingsCardGroup({super.key, required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: AppColors.line),
      ),
      child: Column(children: children),
    );
  }
}

class SettingsNavRow extends StatelessWidget {
  const SettingsNavRow({
    super.key,
    required this.iconPath,
    required this.title,
    this.subtitle,
    this.onTap,
    this.trailing,
    this.isDanger = false,
  });

  final String iconPath;
  final String title;
  final String? subtitle;
  final VoidCallback? onTap;
  final Widget? trailing;
  final bool isDanger;

  @override
  Widget build(BuildContext context) {
    final text = AppTextStyle(context);

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        child: Row(
          children: [
            Container(
              width: 38.r,
              height: 38.r,
              decoration: BoxDecoration(
                color: isDanger ? AppColors.coralSoft : AppColors.pearl,
                borderRadius: BorderRadius.circular(11.r),
              ),
              child: Center(
                child: SvgPicture.asset(
                  iconPath,
                  width: 18.r,
                  height: 18.r,
                  colorFilter: ColorFilter.mode(
                    isDanger ? AppColors.dangerDark : AppColors.ink,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
            Gap.h(12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: text.semiBoldTextStyle(
                      fontSize: 14.5,
                      color: isDanger ? AppColors.dangerDark : AppColors.ink,
                    ),
                  ),
                  if (subtitle != null) ...[
                    Gap(2),
                    Text(
                      subtitle!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: text.regularTextStyle(
                        fontSize: 12,
                        color: AppColors.muted,
                      ),
                    ),
                  ],
                ],
              ),
            ),
            Gap.h(8),
            trailing ??
                SvgPicture.asset(
                  IconPath.hwChevRight,
                  width: 15.r,
                  height: 15.r,
                ),
          ],
        ),
      ),
    );
  }
}

class SettingsToggleRow extends StatelessWidget {
  const SettingsToggleRow({
    super.key,
    this.iconPath,
    required this.title,
    this.subtitle,
    required this.value,
    required this.onChanged,
  });

  final String? iconPath;
  final String title;
  final String? subtitle;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    final text = AppTextStyle(context);

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Row(
        children: [
          if (iconPath != null) ...[
            Container(
              width: 38.r,
              height: 38.r,
              decoration: BoxDecoration(
                color: AppColors.pearl,
                borderRadius: BorderRadius.circular(11.r),
              ),
              child: Center(
                child: SvgPicture.asset(
                  iconPath!,
                  width: 18.r,
                  height: 18.r,
                  colorFilter: const ColorFilter.mode(
                    AppColors.ink,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
            Gap.h(12),
          ],
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: text.semiBoldTextStyle(
                    fontSize: 14.5,
                    color: AppColors.ink,
                  ),
                ),
                if (subtitle != null) ...[
                  Gap(2),
                  Text(
                    subtitle!,
                    style: text.regularTextStyle(
                      fontSize: 12,
                      color: AppColors.muted,
                    ),
                  ),
                ],
              ],
            ),
          ),
          Gap.h(10),
          CupertinoSwitch(
            value: value,
            activeTrackColor: AppColors.emerald,
            inactiveTrackColor: AppColors.line,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}

class SettingsBinaryToggle extends StatelessWidget {
  const SettingsBinaryToggle({
    super.key,
    required this.leftLabel,
    required this.rightLabel,
    required this.leftSelected,
    required this.onSelect,
  });

  final String leftLabel;
  final String rightLabel;
  final bool leftSelected;
  final ValueChanged<bool> onSelect;

  @override
  Widget build(BuildContext context) {
    final text = AppTextStyle(context);

    return Container(
      padding: EdgeInsets.all(4.r),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.line),
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => onSelect(true),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 150),
                padding: EdgeInsets.symmetric(vertical: 12.h),
                decoration: BoxDecoration(
                  color: leftSelected ? AppColors.ink : AppColors.transparent,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Text(
                  leftLabel,
                  textAlign: TextAlign.center,
                  style: text.semiBoldTextStyle(
                    fontSize: 14,
                    color: leftSelected ? AppColors.white : AppColors.muted,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () => onSelect(false),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 150),
                padding: EdgeInsets.symmetric(vertical: 12.h),
                decoration: BoxDecoration(
                  color: !leftSelected ? AppColors.ink : AppColors.transparent,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Text(
                  rightLabel,
                  textAlign: TextAlign.center,
                  style: text.semiBoldTextStyle(
                    fontSize: 14,
                    color: !leftSelected ? AppColors.white : AppColors.muted,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
