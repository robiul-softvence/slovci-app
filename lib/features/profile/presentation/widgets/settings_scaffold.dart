import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter_tamplate/core/common/widgets/bottom_action_bar.dart';
import 'package:flutter_tamplate/core/core.dart';

class SettingsScaffold extends StatelessWidget {
  const SettingsScaffold({
    super.key,
    required this.title,
    required this.children,
    this.trailing,
    this.footer,
    this.backgroundColor = AppColors.pearl,
  });

  final String title;
  final List<Widget> children;
  final Widget? trailing;
  final BottomActionBar? footer;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    final text = AppTextStyle(context);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          backgroundColor: backgroundColor,
          body: SafeArea(
            bottom: false,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(20.w, 8.h, 20.w, 8.h),
                  child: Row(
                    children: [
                      Material(
                        color: backgroundColor == AppColors.white
                            ? AppColors.pearl
                            : AppColors.white,
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
                      ),
                      Expanded(
                        child: Text(
                          title,
                          textAlign: TextAlign.center,
                          style: text.boldTextStyle(
                            fontSize: 18,
                            color: AppColors.ink,
                          ),
                        ),
                      ),
                      trailing ?? SizedBox(width: 40.r),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.fromLTRB(20.w, 12.h, 20.w, 28.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: children,
                    ),
                  ),
                ),
                ?footer,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
