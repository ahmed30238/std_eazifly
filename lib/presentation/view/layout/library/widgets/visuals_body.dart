import 'package:eazifly_student/core/component/custom_elevated_btn.dart';
import 'package:eazifly_student/core/extensions/num_extentions.dart';
import 'package:eazifly_student/core/images/my_images.dart';
import 'package:eazifly_student/core/theme/colors/main_colors.dart';
import 'package:eazifly_student/core/theme/text_styles.dart/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class VisualsBody extends StatelessWidget {
  const VisualsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) => VisualsBodyItem(
        index: index,
      ),
      separatorBuilder: (context, index) => 10.ph,
      itemCount: 4,
    );
  }
}

class VisualsBodyItem extends StatelessWidget {
  final int index;
  const VisualsBodyItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minHeight: 127.h),
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      margin: EdgeInsets.only(
        right: 16.w,
        left: 16.w,
        top: index != 0 ? 0 : 16.h,
        bottom: index == 3 ? 16.h : 0, // todo last item list length - 1
      ),
      width: 343.w,
      decoration: BoxDecoration(
        color: MainColors.veryLightGrayFormField,
        borderRadius: 16.cr,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          16.ph,
          Text(
            "مجموعة قصص مختارة ",
            style: MainTextStyle.boldTextStyle(
              fontSize: 14,
            ),
          ),
          4.ph,
          Text(
            "مجموعة كتب مختارة لمذاكرة الرياضيات للصف السادس الابتدائي مثال :هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنكحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد ",
            style: MainTextStyle.boldTextStyle(
                fontSize: 12, color: MainColors.grayTextColors),
          ),
          16.ph,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                child: Row(
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          MyImages.iconsPlay,
                        ),
                        4.pw,
                        Text(
                          "3566",
                          style: MainTextStyle.boldTextStyle(
                            fontSize: 14,
                            color: MainColors.blackText,
                          ),
                        ),
                      ],
                    ),
                    16.pw,
                    Row(
                      children: [
                        SvgPicture.asset(
                          MyImages.iconsHeart,
                        ),
                        4.pw,
                        Text(
                          "153",
                          style: MainTextStyle.boldTextStyle(
                            fontSize: 14,
                            color: MainColors.blackText,
                          ),
                        ),
                      ],
                    ),
                    16.pw,
                    Row(
                      children: [
                        SvgPicture.asset(
                          MyImages.iconsPeople,
                        ),
                        4.pw,
                        Text(
                          "344",
                          style: MainTextStyle.boldTextStyle(
                            fontSize: 14,
                            color: MainColors.blackText,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              CustomLowSizeButton(
                width: 112.w,
                fontSize: 12,
                borderRadius: 12.cr,
                btnColor: MainColors.lightblue,
                height: 26.h,
                // color:
                textColor: MainColors.blueTextColor,
                text: "أضف إلى مكتبتك",
                onTap: () {},
              ),
            ],
          ),
          12.ph,
        ],
      ),
    );
  }
}
