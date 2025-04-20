
import 'package:eazifly_student/core/component/texted_container.dart';
import 'package:eazifly_student/core/extensions/num_extentions.dart';
import 'package:eazifly_student/core/theme/colors/main_colors.dart';
import 'package:eazifly_student/core/theme/text_styles.dart/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomNotificationListTile extends StatelessWidget {
  final String title;
  final String subTitle;
  final String icon;
  final double? height;
  final bool isTurned;
  final bool isWhats;
  final Widget? iconWidget;
  final Widget? widget;
  final Function(bool)? onChanged;
  final ValueNotifier<bool>? controller;
  const CustomNotificationListTile({
    super.key,
    required this.icon,
    this.height,
    required this.title,
    this.controller,
    required this.subTitle,
    this.isWhats = false,
    this.iconWidget,
    this.widget,
    required this.onChanged,
    this.isTurned = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 62.h,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(
            icon,
          ),
          16.pw,
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: MainTextStyle.boldTextStyle(
                  fontSize: 15,
                  color: MainColors.blackText,
                ),
              ),
              4.ph,
              Text(
                subTitle,
                style: MainTextStyle.regularTextStyle(
                  fontSize: 12,
                  color: MainColors.blackText,
                ),
              ),

              isTurned ? widget ?? 0.ph : 0.ph,
              //     ? SizedBox(
              //       // width: 400.w,
              //       child: Row(
              //           children: List.generate(
              //             3,
              //             (index) => const Expanded(child: WhatsAppContainer()),
              //           ),
              //         ),
              //     )
              //     : 0.ph,
            ],
          ),
          const Spacer(),
          Row(
            children: [
              isWhats
                  ? const TextedContainer(
                      text: "Whatsapp",
                    )
                  : 0.pw,
              8.pw,
              iconWidget ??
                  CupertinoSwitch(
                    value: isTurned,
                    onChanged: onChanged,
                  ),
              // AdvancedSwitch(
              //   key: const Key("ar"),
              //   activeColor: MainColors.greenTeal,
              //   inactiveColor: MainColors.formFieldGrayBorderColor,
              //   width: 40.w,
              //   height: 22.w,
              //   controller: NotificationCubit.get(context).controller00,
              //   thumb: ValueListenableBuilder<bool>(
              //     valueListenable:
              //         NotificationCubit.get(context).controller00,
              //     builder: (_, value, __) {
              //       return Icon(
              //         value ? Icons.circle : Icons.circle,
              //         size: 20.r,
              //         color: MainColors.white,
              //       );
              //     },
              //   ),
              // ),
            ],
          ),
        ],
      ),
    );
  }
}
