import 'package:eazifly_student/core/extensions/num_extentions.dart';
import 'package:eazifly_student/core/routes/paths.dart';
import 'package:eazifly_student/presentation/view/home_meetings_view/widgets/all_meeting_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllItemsList extends StatelessWidget {
  const AllItemsList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => 12.ph,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => AllMeetingItem(
        onItemTap: () =>
            Navigator.pushNamed(context, RoutePaths.meetingDataPath),
        onTap: () {},
        isRecorded: index != 0,
      ),
      itemCount: 6,
    );
  }
}
