import 'package:eazifly_student/domain/entities/get_programs_entities.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';
import 'package:flutter_html/flutter_html.dart';

class ProgramFeatureTab extends StatelessWidget {
  final GetProgramsProgramEntity programEntity;
  const ProgramFeatureTab({super.key, required this.programEntity});

  @override
  Widget build(BuildContext context) {
    return Html(
      data: programEntity.advantages ?? "",
      style: htmlStyle,
    );
    // ListView.builder(
    //   padding: EdgeInsets.only(left: 8.w, right: 8.w, top: 8.h),
    //   physics: const NeverScrollableScrollPhysics(),
    //   shrinkWrap: true,
    //   itemBuilder: (context, index) => Container(
    //     padding: EdgeInsets.all(8.r),
    //     height: 40.h,
    //     child: Expanded(
    //       child: Bullet(
    //         "متابعة دورية لمستوي التقدم .",
    //         style: MainTextStyle.boldTextStyle(
    //           fontSize: 12,
    //         ),
    //       ),
    //     ),
    //   ),
    //   itemCount: 4,
    // );
  }
}
