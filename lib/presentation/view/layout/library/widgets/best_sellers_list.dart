import 'package:eazifly_student/core/extensions/num_extentions.dart';
import 'package:eazifly_student/core/images/my_images.dart';
import 'package:eazifly_student/presentation/view/layout/library/widgets/program_with_stats_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BestSellersList extends StatelessWidget {
  const BestSellersList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => ProgramWithStatsContainer(
          onTap: () {},
          image: Assets.imagesPersona,
          likes: "2",
          noOfSubscription: "1",
          title: "dsfdsfsd",
          views: "3",
        ),
        separatorBuilder: (context, index) => 12.pw,
        itemCount: 4,
      ),
    );
  }
}
