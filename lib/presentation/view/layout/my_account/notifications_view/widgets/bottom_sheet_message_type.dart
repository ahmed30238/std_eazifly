import 'package:eazifly_student/core/extensions/num_extentions.dart';
import 'package:eazifly_student/core/theme/colors/main_colors.dart';
import 'package:eazifly_student/core/theme/text_styles.dart/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class BottomSheetMessageTypeRow extends StatelessWidget {
  final String messageType;
  final String messageData;
  final Function(bool)? onChange;
  final bool switchValue;

  const BottomSheetMessageTypeRow({
    super.key,
    required this.messageData,
    required this.messageType,
    required this.onChange,
    required this.switchValue,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 62.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                messageType,
                style: MainTextStyle.boldTextStyle(
                  fontSize: 15,
                  color: MainColors.blackText,
                ),
              ),
              4.ph,
              Text(
                messageData,
                style: MainTextStyle.regularTextStyle(
                  fontSize: 12,
                  color: MainColors.grayTextColors,
                ),
              ),
            ],
          ),
          CupertinoSwitch(
            value: switchValue,
            onChanged: onChange,
          )
        ],
      ),
    );
  }
}