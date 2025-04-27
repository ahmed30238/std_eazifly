import 'package:eazifly_student/core/component/bullet.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class ProgramDetailsTap extends StatelessWidget {
  const ProgramDetailsTap({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.only(left: 8.w, right: 8.w, top: 8.h),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) => Container(
        padding: EdgeInsets.all(8.r),
        height: 40.h,
        child: Bullet(
          "تلاوة (تجويد): تعلم النطق الصحيح للقرآن والتغني بتلاوته",
          style: MainTextStyle.boldTextStyle(
            fontSize: 12,
          ),
        ),
      ),
      itemCount: 4,
    );
  }
}
