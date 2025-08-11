import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class SchdeuleTypeRow extends StatelessWidget {
  final Function(int) changeDateTypeIndex;
  final int cubitIndex;
  const SchdeuleTypeRow({
    super.key,
    required this.cubitIndex,
    required this.changeDateTypeIndex,

  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        2,
        (index) {
          bool isSelected = index == cubitIndex;
          return InkWell(
            onTap: () {
              changeDateTypeIndex(index);
            },
            child: Container(
              margin: EdgeInsets.only(
                left: index == 0 ? 16.w : 0,
              ),
              height: 127.h,
              width: 130.w,
              decoration: BoxDecoration(
                color: isSelected ? MainColors.surface : MainColors.background,
                borderRadius: 16.cr,
                border: Border.all(
                  color: isSelected
                      ? MainColors.primary
                      : MainColors.transparent,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    index == 1 ? Assets.iconsClock : Assets.iconsFlexibleClock,
                  ),
                  16.ph,
                  Text(
                    index == 0 ? "مواعيد مرنة" : "مواعيد ثابتة",
                    style: MainTextStyle.boldTextStyle(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}