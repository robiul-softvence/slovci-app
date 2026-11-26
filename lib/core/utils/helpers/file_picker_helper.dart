// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_tamplate/core/utils/constants/enums.dart';

class MediaPicker {
  static final ImagePicker _picker = ImagePicker();

  static Future<void> show({
    required BuildContext context,
    PickerType type = PickerType.both,
    required Function(XFile?) onPicked,
  }) async {
    showDialog(
      context: context,
      builder: (dialogContext) {
        switch (type) {

          /// PHOTO ONLY
          case PickerType.photo:
            return _buildDialog(
              title: 'common.picker.select_photo'.tr,
              items: [
                _item('common.picker.take_photo'.tr, () => _pickImage(dialogContext, ImageSource.camera, onPicked)),
                _item('common.picker.choose_gallery'.tr, () => _pickImage(dialogContext, ImageSource.gallery, onPicked)),
              ],
            );

          /// VIDEO ONLY
          case PickerType.video:
            return _buildDialog(
              title: 'common.picker.select_video'.tr,
              items: [
                _item('common.picker.record_video'.tr, () => _pickVideo(dialogContext, ImageSource.camera, onPicked)),
                _item('common.picker.choose_gallery'.tr, () => _pickVideo(dialogContext, ImageSource.gallery, onPicked)),
              ],
            );

          /// BOTH
          case PickerType.both:
            return _buildDialog(
              title: 'common.picker.select_media'.tr,
              items: [
                _item('common.picker.use_camera'.tr, () async {
                  Navigator.pop(dialogContext);
                  await Future.delayed(const Duration(milliseconds: 200));
                  _showSubDialog(context, true, onPicked);
                }),
                _item('common.picker.choose_gallery'.tr, () async {
                  Navigator.pop(dialogContext);
                  await Future.delayed(const Duration(milliseconds: 200));
                  _showSubDialog(context, false, onPicked);
                }),
              ],
            );
        }
      },
    );
  }

  // ---------- SAFE SUB DIALOG ----------
  static void _showSubDialog(
    BuildContext context,
    bool isCamera,
    Function(XFile?) onPicked,
  ) {
    showDialog(
      context: context,
      builder: (ctx) => _buildDialog(
        title: isCamera ? 'common.picker.camera'.tr : 'common.picker.gallery'.tr,
        items: [
          _item(
            isCamera ? 'common.picker.take_photo'.tr : 'common.picker.pick_image'.tr,
            () => _pickImage(ctx, isCamera ? ImageSource.camera : ImageSource.gallery, onPicked),
          ),
          _item(
            isCamera ? 'common.picker.record_video'.tr : 'common.picker.pick_video'.tr,
            () => _pickVideo(ctx, isCamera ? ImageSource.camera : ImageSource.gallery, onPicked),
          ),
        ],
      ),
    );
  }

  // ---------- SAFE PICKERS ----------
  static Future<void> _pickImage(
    BuildContext context,
    ImageSource source,
    Function(XFile?) onPicked,
  ) async {
    Navigator.pop(context);
    await Future.delayed(const Duration(milliseconds: 200));

    final file = await _picker.pickImage(
      source: source,
      imageQuality: 70, // 🔥 important memory fix
    );

    onPicked(file);
  }

  static Future<void> _pickVideo(
    BuildContext context,
    ImageSource source,
    Function(XFile?) onPicked,
  ) async {
    Navigator.pop(context);
    await Future.delayed(const Duration(milliseconds: 200));

    final file = await _picker.pickVideo(source: source);
    onPicked(file);
  }

  // ---------- UI HELPERS ----------
  static AlertDialog _buildDialog({
    required String title,
    required List<Widget> items,
  }) {
    return AlertDialog(
      title: Text(title),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: items,
      ),
    );
  }

  static Widget _item(String text, VoidCallback onTap) {
    return ListTile(
      title: Text(text),
      onTap: onTap,
    );
  }
}