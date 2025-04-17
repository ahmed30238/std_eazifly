import 'package:eazifly_student/core/component/separated_widget.dart';
import 'package:eazifly_student/core/extensions/num_extentions.dart';
import 'package:eazifly_student/core/theme/colors/main_colors.dart';
import 'package:eazifly_student/presentation/view/layout/my_programs/widgets/session_collection_item.dart';
import 'package:eazifly_student/presentation/view/layout/my_programs/widgets/session_dates_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CollectionSessionList extends StatelessWidget {
  const CollectionSessionList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minHeight: 300.h,
      ),
      decoration: BoxDecoration(
        color: MainColors.veryLightGrayFormField,
        borderRadius: 16.cr,
      ),
      child: Column(
        children: [
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) =>
                const SessionCollectionItem(),
            separatorBuilder: (context, index) => const SeparatedWidget(
              dividerColor: MainColors.lightGray,
              verticalPadding: 0,
            ),
            itemCount: 4,
          ),
          12.ph,
          const SessionDatesDetails()
        ],
      ),
    );
  }
}