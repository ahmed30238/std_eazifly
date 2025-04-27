import 'package:eazifly_student/core/component/bullet.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class ProgramFeatureTab extends StatelessWidget {
  const ProgramFeatureTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.only(left: 8.w, right: 8.w, top: 8.h),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) => Container(
        padding: EdgeInsets.all(8.r),
        height: index == 0 ? 47 : 40.h,
        child: Row(
          children: [
            Expanded(
              child: Bullet(
                index == 0
                    ? "12 ملف مخلص للمحاضرات ."
                    : "متابعة دورية لمستوي التقدم .",
                style: MainTextStyle.boldTextStyle(
                  fontSize: 12,
                ),
              ),
            ),
            if (index == 0) ...{
              InkWell(
                onTap: () {},
                child: Column(
                  children: [
                    SvgPicture.asset(
                      MyImages.iconsFile,
                    ),
                    Text(
                      "تحميل",
                      style: MainTextStyle.boldTextStyle(
                        fontSize: 10,
                        color: MainColors.blueTextColor,
                      ),
                    )
                  ],
                ),
              )
            }
          ],
        ),
      ),
      itemCount: 4,
    );
  }
}
