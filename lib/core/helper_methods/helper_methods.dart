import 'dart:developer';
import 'dart:io';

import 'package:delightful_toast/delight_toast.dart';
import 'package:delightful_toast/toast/components/toast_card.dart';
import 'package:delightful_toast/toast/utils/enums.dart';
import 'package:eazifly_student/core/enums/task_deliver_status.dart';
import 'package:eazifly_student/presentation/controller/change_lecturer_controller/changelecturer_cubit.dart';
import 'package:eazifly_student/presentation/view/layout/my_programs/change_lecturer_view/widgets/bottom_sheet_day_controller.dart';
import 'package:eazifly_student/presentation/view/lecture/widgets/dummy_data.dart';
import 'package:flash/flash.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../presentation/view/subscription_details_view/widgets/imports.dart';

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

Future<dynamic> customAdaptiveDialog(
  BuildContext context, {
  EdgeInsets? insetPadding,
  bool? barrierDismissible,
  AlignmentGeometry? alignmen,
  required Widget child,
}) {
  return showAdaptiveDialog(
    useSafeArea: true,
    barrierDismissible: barrierDismissible ?? true,
    builder: (context) => Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: 16.cr,
      ),
      insetPadding: insetPadding ?? EdgeInsets.symmetric(horizontal: 16.w),
      alignment: alignmen ?? Alignment.center,
      child: child,
    ),
    context: context,
  );
}

delightfulToast({
  required String message,
  required BuildContext context,
  Color? toastColor,
}) {
  DelightToastBar(
    autoDismiss: true,
    position: DelightSnackbarPosition.top,
    // snackbarDuration: Duration(microseconds: 400),
    builder: (context) => ToastCard(
      color: toastColor,
      leading: const Icon(
        Icons.flutter_dash,
        size: 28,
      ),
      title: Text(
        message,
        style: const TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 14,
        ),
      ),
    ),
  ).show(context);
}

Future<dynamic> weekDaysModalSheet(
    BuildContext context, ChangelecturerCubit cubit) {
  return showModalSheet(
    isFixedSize: true,
    minHeight: 400.h,
    maxHeight: 401.h,
    context,
    widget: BlocProvider.value(
      value: cubit,
      child: CustomBottomSheetDesign(
        radius: 16.r,
        widget: Column(
          children: [
            24.ph,
            ...List.generate(
              7,
              (index) => BottomSheetDayContainer(
                onTap: () {
                  cubit.changeSpecifiedDay(weekDaysAr[index]);
                  back(context);
                },
                day: weekDaysAr[index],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

DeliverStatusModel deliveryState(DeliverStatus state) {
  switch (state) {
    case DeliverStatus.deliverDone:
      return DeliverStatusModel(
        text: "تم التسليم",
        color: MainColors.lightgreenTeal,
        textColor: MainColors.greenTeal,
      );
    case DeliverStatus.notDelivered:
      return DeliverStatusModel(
        text: "لم يتم التسليم",
        color: MainColors.lightRed,
        textColor: MainColors.red,
      );
    case DeliverStatus.deliverUnderReview:
      return DeliverStatusModel(
        text: "قيد المراجعة",
        color: MainColors.lightblue,
        textColor: MainColors.blueTextColor,
      );

    default:
      return DeliverStatusModel(
        text: "error",
        color: Colors.red,
        textColor: Colors.white,
      );
  }
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

Future<void> openUrl(String url) async {
  final Uri uri = Uri.parse(url);

  if (await canLaunchUrl(uri)) {
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  } else {
    throw 'لا يمكن فتح الرابط: $url';
  }
}

// إضافة هذه الدالة في ملف منفصل أو في نفس الملف
String formatTimeDifference(DateTime? nextSessionDateTime) {
  if (nextSessionDateTime == null) {
    return "غير محدد";
  }

  DateTime now = DateTime.now();
  Duration difference = nextSessionDateTime.difference(now);

  // إذا كان الوقت في الماضي
  if (difference.isNegative) {
    return "انتهت";
  }

  int totalDays = difference.inDays;
  int totalHours = difference.inHours;
  int totalMinutes = difference.inMinutes;

  // أكثر من 3 أيام - عرض التاريخ
  if (totalDays > 3) {
    return "${nextSessionDateTime.day}/${nextSessionDateTime.month}/${nextSessionDateTime.year}";
  }

  // من يوم إلى 3 أيام - عرض عدد الأيام
  if (totalDays >= 1 && totalDays <= 3) {
    return "بعد $totalDays ${totalDays == 1 ? 'يوم' : 'أيام'}";
  }

  // أقل من 24 ساعة - عرض الساعات والدقائق
  if (totalHours > 0) {
    int remainingMinutes = totalMinutes % 60;
    if (remainingMinutes > 0) {
      return "بعد $totalHours ${totalHours == 1 ? 'ساعة' : 'ساعات'} و $remainingMinutes ${remainingMinutes == 1 ? 'دقيقة' : 'دقائق'}";
    } else {
      return "بعد $totalHours ${totalHours == 1 ? 'ساعة' : 'ساعات'}";
    }
  }

  // أقل من ساعة - عرض الدقائق فقط
  if (totalMinutes > 0) {
    return "بعد $totalMinutes ${totalMinutes == 1 ? 'دقيقة' : 'دقائق'}";
  }

  return "الآن";
}
  // تنسيق الوقت
  String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }