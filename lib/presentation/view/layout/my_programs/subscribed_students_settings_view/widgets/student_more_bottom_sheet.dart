import 'package:eazifly_student/presentation/controller/account_data/update_child_profile_controller/updatechildprofile_cubit.dart';
import 'package:eazifly_student/presentation/controller/my_programs/myprograms_cubit.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

Future<dynamic> studentMoreBottomSheet(
  BuildContext context,
  int programId,
  int userId,
  UpdatechildprofileCubit updateChildProfileCubit,
  MyProgramsCubit myProgramsCubit,
) {
  return showModalSheet(
    minHeight: 260.h,
    maxHeight: 261.h,
    isFixedSize: true,
    context,
    widget: Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      height: 260.h,
      width: 375.w,
      decoration: BoxDecoration(
        borderRadius: 12.cr,
        color: MainColors.background,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          24.ph,
          InkWell(
            onTap: () {
              Navigator.pushNamed(
                context,
                RoutePaths.lectureView,
                arguments: {
                  "programId": programId,
                },
              );
            },
            child: SizedBox(
              height: 45.h,
              child: Text(
                "عرض باقي البيانات",
                style: MainTextStyle.boldTextStyle(fontSize: 14),
              ),
            ),
          ),
          InkWell(
            onTap: () => Navigator.pushNamed(
              arguments: userId,
              context,
              RoutePaths.updateChildProfile,
            ),
            child: SizedBox(
              height: 45.h,
              child: Text(
                "تعديل بيانات الطالب",
                style: MainTextStyle.boldTextStyle(fontSize: 14),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              back(context);
              showDeleteConfirmationDialog(
                context,
                userId,
                programId,
                updateChildProfileCubit,
                myProgramsCubit,
              );
            },
            child: SizedBox(
              height: 45.h,
              child: Text(
                "حذف الطالب",
                style: MainTextStyle.boldTextStyle(fontSize: 14),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(
                context,
                RoutePaths.lectureHistoryView,
              );
            },
            child: SizedBox(
              height: 45.h,
              child: Text(
                "تاريخ المحاضرات ",
                style: MainTextStyle.boldTextStyle(fontSize: 14),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

void showDeleteConfirmationDialog(
  BuildContext context,
  int userId,
  int programId,
  UpdatechildprofileCubit updateChildProfileCubit,
  MyProgramsCubit myProgramsCubit,
) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        title: Row(
          children: [
            Icon(
              Icons.warning_amber_rounded,
              color: MainColors.tertiary,
              size: 24.w,
            ),
            SizedBox(width: 8.w),
            Text(
              "تأكيد الحذف",
              style: MainTextStyle.boldTextStyle(fontSize: 16),
            ),
          ],
        ),
        content: Text(
          "هل أنت متأكد من حذف هذا الطالب؟\nلن يمكنك التراجع عن هذا الإجراء.",
          style: MainTextStyle.boldTextStyle(fontSize: 14),
          textAlign: TextAlign.center,
        ),
        actions: [
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[300],
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    "إلغاء",
                    style: MainTextStyle.regularTextStyle(fontSize: 14),
                  ),
                ),
              ),
              10.pw,
              Expanded(
                child: ElevatedButton(
                  onPressed: () async {
                    await updateChildProfileCubit
                        .removeAssignedStudent(
                      userId: userId,
                      programId: programId,
                    )
                        .then(
                      (value) {
                        back(context);
                        myProgramsCubit.getAssignedChildrenToProgram(
                            programId: programId);
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    "نعم، احذف",
                    style: MainTextStyle.boldTextStyle(
                      fontSize: 14,
                      color: MainColors.background,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      );
    },
  );
}
