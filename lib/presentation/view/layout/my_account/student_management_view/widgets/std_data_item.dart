import 'package:eazifly_student/core/component/image_conainer.dart';
import 'package:eazifly_student/core/extensions/num_extentions.dart';
import 'package:eazifly_student/core/helper_methods/helper_methods.dart';
import 'package:eazifly_student/core/images/my_images.dart';
import 'package:eazifly_student/core/theme/colors/main_colors.dart';
import 'package:eazifly_student/core/theme/text_styles.dart/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
class StudentDataItem extends StatelessWidget {
  final int index;
  const StudentDataItem({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        right: 8.w,
        left: 8.w,
        top: index == 0 ? 12 : 0,
        bottom: index == 12 ? 12 : 0,
      ),
      height: 65.h,
      width: 343.w,
      decoration: BoxDecoration(
        borderRadius: 12.cr,
        color: MainColors.veryLightGrayFormField,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //! image
          ImageContainer(
            shape: BoxShape.circle,
            image: "assets/images/ahmed.png",
            containerHeight: 45.h,
            containerWidth: 45.w,
          ),
          8.pw,
          //! name and age
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Ahmed Salama",
                style: MainTextStyle.boldTextStyle(fontSize: 14),
              ),
              8.ph,
              Text(
                "15 عام",
                style: MainTextStyle.boldTextStyle(
                  fontSize: 12,
                  color: MainColors.grayTextColors,
                ),
              ),
            ],
          ),
          20.pw,
          //! phone
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "رقم التواصل",
                style: MainTextStyle.boldTextStyle(
                  fontSize: 12,
                  color: MainColors.grayTextColors,
                ),
              ),
              8.ph,
              Text(
                "01030837974",
                style: MainTextStyle.boldTextStyle(fontSize: 14),
              ),
            ],
          ),
          const Spacer(),
          InkWell(
              onTap: () {
                showModalSheet(
                  minHeight: 350.h,
                  maxHeight: 351.h,
                  isFixedSize: true,
                  context,
                  widget: Container(
                    height: 200.h,
                    width: 375.w,
                    decoration: BoxDecoration(
                      borderRadius: 12.cr,
                      color: MainColors.white,
                    ),
                    child: Column(
                      children: [
                        16.ph,
                        Text(
                          "تعديل بيانات الطالب",
                          style: MainTextStyle.boldTextStyle(fontSize: 14),
                        ),
                        16.ph,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(MyImages.iconsProfile),
                            8.pw,
                            Text(
                              "تعديل",
                              style: MainTextStyle.boldTextStyle(fontSize: 14),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
              child: SvgPicture.asset(MyImages.iconsProfile))
        ],
      ),
    );
  }
}