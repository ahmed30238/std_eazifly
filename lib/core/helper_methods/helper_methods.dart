import 'dart:developer';
import 'dart:io';

import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';

String? customValidation(String? value) {
  if (value!.isEmpty) {
    return 'required';
  }
  return null;
}

void shareApp({required BuildContext context}) async {
  final box = context.findRenderObject() as RenderBox?;
  if (Platform.isAndroid) {
    await Share.share(
      AppsStoreLinkEnum.androidId,
    );
  } else if (Platform.isIOS) {
    await Share.share(
      AppsStoreLinkEnum.iosId,
      sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size,
    );
  }
}

class AppsStoreLinkEnum {
  static const String androidId = 'android';
  static const String iosId = 'ios';
}

String formatDate(DateTime value) {
  String formattedDate = "";

  try {
    DateFormat format = DateFormat("yyyy-MM-dd");
    DateTime date = format.parse(value.toIso8601String());
    formattedDate = date.toString();
  } on FormatException catch (e) {
    log('Invalid date format: $e');
  }
  return formattedDate;
}

Future<dynamic> showModalSheet(
  BuildContext context, {
  final bool? isDismissed,
  final bool? safeArea,
  final bool? isFixedSize,
  final double? minHeight,
  final double? maxHeight,
  required Widget widget,
}) {
  return showModalBottomSheet(
    isScrollControlled: isFixedSize ?? true,
    constraints: BoxConstraints(
      minHeight: minHeight ?? 700.h,
      maxHeight: maxHeight ?? 800.h,
    ),

    isDismissible: isDismissed ?? true,
    useSafeArea: safeArea ?? true,
    context: context,
    useRootNavigator: true,
    builder: (context) => widget,
  );
}

Future<XFile?> pickImageFromGallery() async {
  final ImagePicker picker = ImagePicker();
  final XFile? image = await picker.pickImage(source: ImageSource.gallery);

  return image;
}

void back(context) => Navigator.pop(context);

Future<List<XFile>?> pickMultiImageFromGallery() async {
  final ImagePicker picker = ImagePicker();
  final List<XFile> images = await picker.pickMultiImage();

  return images;
}

void showFlashBar({required BuildContext context, required String message}) {
  showFlash(
    context: context,
    duration: const Duration(seconds: 2),
    builder: (_, controller) {
      return Flash(
        controller: controller,

        position: FlashPosition.bottom,
        // margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        // borderRadius: BorderRadius.circular(10),
        child: FlashBar(
          controller: controller,
          content: Text(
            message,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
          ),
          showProgressIndicator: false,
          progressIndicatorBackgroundColor: Colors.transparent,
          progressIndicatorValueColor: AlwaysStoppedAnimation<Color>(
              Theme.of(context).colorScheme.primary),
        ),
      );
    },
  );
}
