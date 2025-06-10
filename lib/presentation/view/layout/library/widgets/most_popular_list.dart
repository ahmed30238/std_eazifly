import 'package:eazifly_student/core/extensions/num_extentions.dart';
import 'package:eazifly_student/data/models/library/get_library_categories_model.dart';
import 'package:eazifly_student/presentation/view/layout/library/widgets/program_with_stats_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MostPopularList extends StatelessWidget {
  final LibraryCategoryDatumModel? voiceListCategories;
  final VoidCallback onTap;
  const MostPopularList({
    super.key,
    required this.voiceListCategories,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 220.h,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            var listItem = voiceListCategories?.lists?[index];
            return ProgramWithStatsContainer(
              image: listItem?.image ?? "",
              likes: "2",
              noOfSubscription: "1",
              title: listItem?.title ?? "",
              views: "3",
            );
          },
          separatorBuilder: (context, index) => 12.pw,
          itemCount: voiceListCategories?.lists?.length ?? 0,
        ),
      ),
    );
  }
}
