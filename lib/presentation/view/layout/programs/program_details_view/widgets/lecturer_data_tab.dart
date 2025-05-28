import 'package:eazifly_student/core/component/avatar_image.dart';
import 'package:eazifly_student/domain/entities/get_programs_entities.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class LecturerDataTab extends StatelessWidget {
  final GetProgramsProgramEntity programEntity;

  const LecturerDataTab({super.key, required this.programEntity});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        var instructor = programEntity.instructors?[index];
        return LecturerContainerWidget(
          instructorEntity: instructor!,
        );
      },
      itemCount: programEntity.instructors?.length ?? 0,
      separatorBuilder: (context, index) => const CustomHorizontalDivider(),
    );
  }
}

class LecturerContainerWidget extends StatelessWidget {
  final InstructorEntity instructorEntity;
  const LecturerContainerWidget({
    super.key,
    required this.instructorEntity,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      height: 348.h,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 72.h,
            child: Row(
              children: [
                AvatarImage(
                  height: 40.h,
                  width: 40.w,
                  imageUrl: instructorEntity.image ?? "",
                  shape: BoxShape.circle,
                ),
                12.pw,
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      instructorEntity.nameAr ?? "",
                      style: MainTextStyle.boldTextStyle(fontSize: 12),
                    ),
                    4.ph,
                    Text(
                      "${instructorEntity.age} عام",
                      style: MainTextStyle.mediumTextStyle(
                        fontSize: 11,
                        color: MainColors.grayTextColors,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // const CustomHorizontalDivider(),
          // const ItemDetailsCard(
          //   titles: [
          //     "عدد الطلاب",
          //     "البرامج السابقة",
          //     "بيانات",
          //   ],
          // ),
          // const CustomHorizontalDivider(),

          // 12.ph,
          // Text(
          //   "تقييمات المعلم",
          //   style: MainTextStyle.boldTextStyle(
          //     fontSize: 12,
          //     color: MainColors.grayTextColors,
          //   ),
          // ),
          // 8.ph,
          // Expanded(
          //   child: ListView.builder(
          //     physics: const NeverScrollableScrollPhysics(),
          //     shrinkWrap: true,
          //     itemBuilder: (context, index) => Container(
          //       padding: EdgeInsets.all(8.r),
          //       constraints: BoxConstraints(minHeight: 72.h),
          //       child: Column(
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         children: [
          //           Row(
          //             crossAxisAlignment: CrossAxisAlignment.start,
          //             children: [
          //               ImageContainer(
          //                 containerHeight: 20.h,
          //                 containerWidth: 20.w,
          //                 shape: BoxShape.circle,
          //               ),
          //               8.pw,
          //               Text(
          //                 "إسم الطالب",
          //                 style: MainTextStyle.boldTextStyle(
          //                   fontSize: 12,
          //                 ),
          //               ),
          //               const Spacer(),
          //               StarsWidget(
          //                 rating: 5,
          //                 starSize: 15.r,
          //               )
          //             ],
          //           ),
          //           Text(
          //             index == 1
          //                 ? "إستفدت جدا من هذا البرنامج وأيضا المعلم كان متعاون معنا جدا إستفدت جدا من هذا البرنامج وأيضا المعلم كان متعاون معنا جدا "
          //                 : "إستفدت جدا من هذا البرنامج وأيضا المعلم كان متعاون معنا جدا",
          //             style: MainTextStyle.boldTextStyle(
          //               fontSize: 11,
          //               color: MainColors.grayTextColors,
          //             ),
          //           )
          //         ],
          //       ),
          //     ),
          //     itemCount: 1,
          //   ),
          // ),
        ],
      ),
    );
  }
}
