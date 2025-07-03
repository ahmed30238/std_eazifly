import 'package:eazifly_student/presentation/controller/change_lecturer_controller/changelecturer_cubit.dart';
import 'package:eazifly_student/presentation/controller/lecture/lecture_cubit.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

handleTap({
  required ChangelecturerCubit cubit,
  required BuildContext context,
}) async {
  if (cubit.noChosenReason()) {
    customAdaptiveDialog(
      context,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        decoration: BoxDecoration(
          borderRadius: 16.cr,
          color: MainColors.white,
        ),
        height: 160.h,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              Assets.iconsRejectRequest,
            ),
            8.ph,
            Text(
              "برجاء اختيار سبب تغيير المعلم",
              style: MainTextStyle.boldTextStyle(
                fontSize: 15,
                color: MainColors.red,
              ),
            ),
          ],
        ),
      ),
    );
  } else if (cubit.selectedStudentId == -1) {
    customAdaptiveDialog(
      context,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        decoration: BoxDecoration(
          borderRadius: 16.cr,
          color: MainColors.white,
        ),
        height: 160.h,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              Assets.iconsRejectRequest,
            ),
            8.ph,
            Text(
              "برجاء اختيار الطالب الذي تود تغيير المعلم له",
              style: MainTextStyle.boldTextStyle(
                fontSize: 15,
                color: MainColors.red,
              ),
            ),
          ],
        ),
      ),
    );
  } else {
    await cubit
        .getUserSubscriptionData(
      programId: context.read<LectureCubit>().currentProgramId,
      userId: cubit.selectedStudentId,
    )
        .then(
      (value) {
        cubit.incrementBodyIndex();
      },
    );
  }
}
