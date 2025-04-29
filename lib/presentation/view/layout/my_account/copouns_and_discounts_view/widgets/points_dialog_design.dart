import 'package:eazifly_student/presentation/controller/layout/layout_cubit.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class PointsDialogDesign extends StatelessWidget {
  const PointsDialogDesign({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: 24.r, vertical: 24.h),
      height: 172.h,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(Assets.iconsCelebrate),
              8.pw,
              Text(
                "لديك 120 نقطة",
                style:
                    MainTextStyle.boldTextStyle(fontSize: 16),
              ),
              8.pw,
              SvgPicture.asset(Assets.iconsCelebrate),
            ],
          ),
          8.ph,
          Text(
            "يمكنك إستبدال النقاط عند الإشتراك في برامج جديد او اللإشتراك الشهري توجهة الأن للإستماع بالخصومات",
            style: MainTextStyle.mediumTextStyle(
              fontSize: 12,
            ),
          ),
          16.ph,
          CustomLowSizeButton(
            text: "انتقل للبرامج",
            onTap: () {
              LayoutCubit.get(context).changeIndex(1);
              Navigator.pushNamed(
                context,
                RoutePaths.layoutPath,
              );
            },
            width: 134.w,
            height: 37.h,
            btnColor: MainColors.blueMoreTextColor,
            borderRadius: 12.cr,
            textColor: MainColors.white,
          ),
        ],
      ),
    );
  }
}