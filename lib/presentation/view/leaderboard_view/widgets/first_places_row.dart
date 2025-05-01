import 'package:eazifly_student/core/images/my_images.dart';
import 'package:eazifly_student/presentation/view/leaderboard_view/widgets/places_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FirstPlacesRow extends StatelessWidget {
  const FirstPlacesRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        PlacesWidget(
          height: 75.h,
          width: 75.w,
          avatar: Assets.imagesPngImage,
          board: Assets.iconsSilverBoard,
          medal: Assets.iconsSilverMedal2,
        ),
        PlacesWidget(
          height: 100.h,
          width: 100.w,
          avatar: Assets.imagesPngImage,
          board: Assets.iconsGoldBoard,
          medal: Assets.iconsGoldMedal,
        ),
        PlacesWidget(
          height: 75.h,
          width: 75.w,
          avatar: Assets.imagesEditedPersona,
          board: Assets.iconsBronzeBoard,
          medal: Assets.iconsBronzeMedal,
        ),
      ],
    );
  }
}
