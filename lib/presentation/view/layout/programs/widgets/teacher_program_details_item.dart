import 'package:eazifly_student/presentation/view/layout/programs/widgets/dummy_data.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class TeacherProgramDetailsItem extends StatelessWidget {
  final TeacherProgramDetailsModel model;
  // final GetProgramEntities? dataModel;
  final int index;
  final int listIndex;
  const TeacherProgramDetailsItem({
    super.key,
    required this.model,
    // required this.dataModel,
    required this.index,
    required this.listIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            model.title,
            style: MainTextStyle.mediumTextStyle(
              color: MainColors.onSurfaceSecondary,
              fontSize: 12,
            ),
          ),
          4.ph,
          index == 2
              ? Container(
                  height: 26.h,
                  width: 93.w,
                  decoration: BoxDecoration(
                    borderRadius: 55.cr,
                    color: MainColors.onTertiary,
                  ),
                  child: Text(
                    "12-2-2025",
                    style: MainTextStyle.boldTextStyle(
                      fontSize: 12,
                      color: MainColors.tertiary,
                    ),
                  ).center(),
                )
              // ProgramStatusWidget(
              //     state: "{dataModel?.data?[listIndex].sessionType}")
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      model.icon,
                      fit: BoxFit.scaleDown,
                      colorFilter: ColorFilter.mode(
                        MainColors.primary,
                        BlendMode.srcIn,
                      ),
                    ),
                    4.pw,
                    Text(
                      model.subTitle,
                      style: MainTextStyle.boldTextStyle(
                        color: MainColors.onSecondary,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}

class ProgramStatusWidget extends StatelessWidget {
  const ProgramStatusWidget({super.key, required this.state});
  final String state;
  @override
  Widget build(BuildContext context) {
    switch (state) {
      case "live":
        return TextedContainer(
          width: 65.w,
          height: 26.h,
          radius: 55.r,
          text: "حاليا",
          containerColor: MainColors.primaryLight,
          textColor: MainColors.success,
          fontSize: 12,
        );
      case "completed":
        return TextedContainer(
          width: 65.w,
          height: 26.h,
          radius: 55.r,
          text: "مكتمل",
          containerColor: MainColors.primaryLight,
          textColor: MainColors.success,
          fontSize: 12,
        );

      default:
        return TextedContainer(
          width: 65.w,
          height: 26.h,
          radius: 55.r,
          text: "مشكلة",
          containerColor: MainColors.primaryLight,
          textColor: MainColors.success,
          fontSize: 12,
        );
    }
  }
}
