import 'package:eazifly_student/domain/entities/get_programs_entities.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';
import 'package:flutter_html/flutter_html.dart';

class ProgramItem extends StatelessWidget {
  final VoidCallback onTap;
  final GetProgramsProgramEntity programEntity;
  const ProgramItem({
    super.key,
    required this.onTap,
    required this.programEntity,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        color: MainColors.veryLightGrayFormField,
        constraints: BoxConstraints(minHeight: 250.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageContainer(
              containerHeight: 163.h,
              containerWidth: double.infinity,
              image: programEntity.image,
              radius: 0,
            ),
            12.ph,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Text(
                programEntity.title ?? "",
                style: MainTextStyle.boldTextStyle(fontSize: 14),
              ),
            ),
            4.ph,
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Html(data: programEntity.description ?? "",),
                // Text(
                //   stripHtmlTags(programEntity.description ?? ""),
                //   style: MainTextStyle.mediumTextStyle(
                //     fontSize: 12,
                //     color: MainColors.grayTextColors,
                //   ),
                // ),
                ),
            12.ph,
            // const CustomHorizontalDivider(),
            // SizedBox(
            //   height: 60.h,
            //   child: Row(
            //     children: List.generate(
            //       3,
            //       (index) => TeacherProgramDetailsItem(
            //         model: teacherProgramDetailsList[index],
            //         listIndex: index,
            //         index: index,
            //       ),
            //     ),
            //   ),
            // ),
            // 16.ph,
          ],
        ),
      ),
    );
  }
}
