import 'package:eazifly_student/core/component/hexagon.dart';
import 'package:eazifly_student/core/extensions/num_extentions.dart';
import 'package:eazifly_student/core/images/my_images.dart';
import 'package:eazifly_student/core/theme/colors/main_colors.dart';
import 'package:eazifly_student/core/theme/text_styles.dart/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PlayerItem extends StatelessWidget {
  final int index;
  const PlayerItem({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      height: 64.h,
      width: 343.w,
      decoration: BoxDecoration(
        color: MainColors.white,
        borderRadius: 12.cr,
      ),
      child: Row(
        children: [
          Text(
            "$index",
            style: MainTextStyle.boldTextStyle(fontSize: 14),
          ),
          8.pw,
          ClipPath(
            clipper: HexaGon(),
            child: Container(
              height: 30.h,
              width: 30.w,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    Assets.imagesPersona,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          4.pw,
          Text(
            "احمد سلامة",
            style: MainTextStyle.boldTextStyle(fontSize: 14),
          ),
          const Spacer(),
          SvgPicture.asset(
            Assets.iconsCoin,
          ),
          Text(
            "211",
            style: MainTextStyle.boldTextStyle(fontSize: 15),
          ),
        ],
      ),
    );
  }
}
