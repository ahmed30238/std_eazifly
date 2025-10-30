import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class LectureDataContainer extends StatelessWidget {
  const LectureDataContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.r),
      height: 149.h,
      width: 287.w,
      decoration: BoxDecoration(
        color: MainColors.background,
        borderRadius: 12.cr,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 54.h,
                width: 111.5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "اسم الطالب",
                      style: MainTextStyle.mediumTextStyle(
                        fontSize: 12,
                        color: MainColors.onSurfaceSecondary,
                      ),
                    ),
                    8.ph,
                    Text(
                      "احمد سلامة",
                      style: MainTextStyle.boldTextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
              8.pw,
              SvgPicture.asset(Assets.iconsRepeatCircle),
              8.pw,
              SizedBox(
                height: 54.h,
                width: 111.5.w,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "اسم المعلم",
                      style: MainTextStyle.boldTextStyle(
                        fontSize: 12,
                        color: MainColors.onSurfaceSecondary,
                      ),
                    ),
                    8.ph,
                    Text(
                      "احمد سلامة",
                      style: MainTextStyle.boldTextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const CustomHorizontalDivider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 54.h,
                width: 127.5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "موعد المحاضرة",
                      style: MainTextStyle.mediumTextStyle(
                        fontSize: 12,
                        color: MainColors.onSurfaceSecondary,
                      ),
                    ),
                    8.ph,
                    Text(
                      "بعد  2 س 4 د",
                      style: MainTextStyle.boldTextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
              8.pw,
              SizedBox(
                height: 54.h,
                width: 127.5.w,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "البرنامج",
                      style: MainTextStyle.boldTextStyle(
                        fontSize: 12,
                        color: MainColors.onSurfaceSecondary,
                      ),
                    ),
                    8.ph,
                    Text(
                      "دورات في التفسير",
                      style: MainTextStyle.boldTextStyle(fontSize: 12),
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
