import 'package:eazifly_student/core/component/avatar_image.dart';
import 'package:eazifly_student/domain/entities/my_programs/get_assigned_children_to_program_entity.dart';
import 'package:eazifly_student/presentation/controller/account_data/update_child_profile_controller/updatechildprofile_cubit.dart';
import 'package:eazifly_student/presentation/controller/my_programs/myprograms_cubit.dart';
import 'package:eazifly_student/presentation/view/layout/my_programs/subscribed_students_settings_view/widgets/student_more_bottom_sheet.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class StudentDataItem extends StatelessWidget {
  const StudentDataItem({
    super.key,
    required this.student,
    required this.programId,
  });

  final GetAssignedChildrenToProgramDatumEntity student;
  final int programId;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 145.h,
      width: 343.w,
      decoration: BoxDecoration(
        borderRadius: 12.cr,
        color: MainColors.inputFill,
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //! image
              AvatarImage(
                shape: BoxShape.circle,
                imageUrl: student.image,
                height: 45.h,
                width: 45.w,
              ),
              8.pw,
              //! name and age
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${student.firstName} ${student.lastName}",
                    style: MainTextStyle.boldTextStyle(fontSize: 14),
                  ),
                  8.ph,
                  Text(
                    "${student.age} عام",
                    style: MainTextStyle.boldTextStyle(
                      fontSize: 12,
                      color: MainColors.onSurfaceSecondary,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              InkWell(
                onTap: () {
                  // الحصول على الـ cubit من الـ context الحالي وتمريره للـ bottom sheet
                  final updateChildProfileCubit =
                      context.read<UpdatechildprofileCubit>();
                  final myProgramsCubit = context.read<MyProgramsCubit>();
                  studentMoreBottomSheet(
                    context,
                    programId,
                    student.id ?? -1,
                    updateChildProfileCubit, 
                    myProgramsCubit
                  );
                },
                child: SvgPicture.asset(
                  Assets.iconsHorizontalDots,
                ),
              ),
            ],
          ),
          8.ph,
          const CustomHorizontalDivider(),
          8.ph,
          Row(
            children: [
              SizedBox(
                width: 127.5.h,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "رقم التواصل",
                      style: MainTextStyle.boldTextStyle(
                        fontSize: 12,
                        color: MainColors.onSurfaceSecondary,
                      ),
                    ),
                    8.ph,
                    Text(
                      student.instructorAssiignedData?.phone ?? "",
                      style: MainTextStyle.boldTextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
              32.pw,
              SizedBox(
                width: 127.5.h,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "المعلم",
                      style: MainTextStyle.boldTextStyle(
                        fontSize: 12,
                        color: MainColors.onSurfaceSecondary,
                      ),
                    ),
                    8.ph,
                    Text(
                      student.instructorAssiignedData?.name ?? "",
                      style: MainTextStyle.boldTextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
