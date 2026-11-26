import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter_tamplate/core/common/widgets/bottom_action_bar.dart';
import 'package:flutter_tamplate/core/core.dart';

/// Shared layout of the account screens (Figma 00b – 00f): back button,
/// H1 title + subtitle, scrollable form, pinned footer CTA.
class AuthScaffold extends StatelessWidget {
  const AuthScaffold({
    super.key,
    required this.title,
    required this.subtitle,
    required this.children,
    required this.footer,
  });

  final String title;
  final String subtitle;
  final List<Widget> children;
  final BottomActionBar footer;

  @override
  Widget build(BuildContext context) {
    final text = AppTextStyle(context);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          backgroundColor: AppColors.white,
          body: SafeArea(
            bottom: false,
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.fromLTRB(20.w, 8, 20.w, 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const _BackButton(),
                        const SizedBox(height: 16),
                        Text(
                          title,
                          style: text.boldTextStyle(
                            fontSize: 26,
                            lineHeight: 32,
                            color: AppColors.ink,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          subtitle,
                          style: text.regularTextStyle(
                            fontSize: AppTextStyle.md,
                            lineHeight: 20,
                            color: AppColors.muted,
                          ),
                        ),
                        ...children,
                      ],
                    ),
                  ),
                ),
                footer,
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Figma "IconBox/chevL": 40 px pearl circle.
class _BackButton extends StatelessWidget {
  const _BackButton();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.pearl,
      shape: const CircleBorder(),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: Get.back,
        child: SizedBox.square(
          dimension: 40.r,
          child: Center(
            child: SvgPicture.asset(
              IconPath.chevLeft,
              width: 20.r,
              height: 20.r,
            ),
          ),
        ),
      ),
    );
  }
}

/// "Already have an account? Log in" style line under the footer CTA.
class AuthFooterLink extends StatelessWidget {
  const AuthFooterLink({
    super.key,
    required this.prompt,
    required this.action,
    required this.onTap,
  });

  final String prompt;
  final String action;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final text = AppTextStyle(context);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          prompt,
          style: text.regularTextStyle(
            fontSize: AppTextStyle.md,
            lineHeight: 20,
            color: AppColors.muted,
          ),
        ),
        const SizedBox(width: 4),
        GestureDetector(
          onTap: onTap,
          behavior: HitTestBehavior.opaque,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Text(
              action,
              style: text.semiBoldTextStyle(
                fontSize: AppTextStyle.md,
                lineHeight: 20,
                color: AppColors.cta,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
