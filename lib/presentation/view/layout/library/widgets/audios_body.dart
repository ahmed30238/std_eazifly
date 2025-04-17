  import 'package:eazifly_student/core/extensions/context.dart';
import 'package:eazifly_student/core/extensions/num_extentions.dart';
import 'package:eazifly_student/core/theme/text_styles.dart/styles.dart';
import 'package:eazifly_student/presentation/view/layout/library/widgets/best_sellers_list.dart';
import 'package:eazifly_student/presentation/view/layout/library/widgets/for_you_list.dart';
import 'package:eazifly_student/presentation/view/layout/library/widgets/most_popular_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AudiosBody extends StatelessWidget {
  const AudiosBody({super.key});

  @override
  Widget build(BuildContext context) {
    var lang = context.loc!;
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        24.ph,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Text(
            lang.mostPopular,
            style: MainTextStyle.boldTextStyle(fontSize: 16),
          ),
        ),
        8.ph,
        const MostPopularList(),
        24.ph,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Text(
            lang.forYou,
            style: MainTextStyle.boldTextStyle(fontSize: 16),
          ),
        ),
        8.ph,
        const ForYouList(),
        24.ph,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Text(
            lang.mostSellers,
            style: MainTextStyle.boldTextStyle(fontSize: 16),
          ),
        ),
        8.ph,
        const BestSellersList(),
        16.ph,
      ],
    );
  }
}








