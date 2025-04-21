import 'package:eazifly_student/core/component/image_conainer.dart';
import 'package:eazifly_student/core/extensions/num_extentions.dart';
import 'package:eazifly_student/core/theme/colors/main_colors.dart';
import 'package:eazifly_student/core/theme/text_styles.dart/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatItem extends StatelessWidget {
  final VoidCallback onTap;
  const ChatItem({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: SizedBox(
              height: 72.h,
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ImageContainer(
                    containerHeight: 48.h,
                    containerWidth: 48.w,
                    borderWidth: 1.w,
                    shape: BoxShape.circle,
                  ),
                  12.pw,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'ياسر أشرف',
                              style: MainTextStyle.boldTextStyle(
                                color: MainColors.blackText,
                                fontSize: 15,
                              ),
                            ),
                            Text(
                              '8:35 AM',
                              textAlign: TextAlign.right,
                              style: MainTextStyle.regularTextStyle(
                                color: MainColors.grayTextColors,
                                fontSize: 12,
                              ),
                            )
                          ],
                        ),
                        4.ph,
                        Expanded(
                          child: Text(
                            'مثال :هذا النص هو جزء من عملية تحسين تجربة المستخدم من خلال النص.',
                            style: MainTextStyle.regularTextStyle(
                              color: MainColors.grayTextColors,
                              fontSize: 12,
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          // Divider(
          //   thickness: 1,
          //   color: MainColors.lightGray,
          // )
        ],
      ),
    );
  }
}
