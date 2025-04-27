

import 'package:eazifly_student/presentation/view/group_package_management_view/widgets/btn_depending_on_state.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class ChosenTeacherItem extends StatelessWidget {
  final int index;
  final String state;
  final VoidCallback onTap;
  const ChosenTeacherItem({
    super.key,
    required this.onTap,
    required this.index,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: state == "done" ? null : onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        height: 80.h,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Text(
                  "${index + 1}",
                  style: MainTextStyle.boldTextStyle(fontSize: 14),
                ),
                8.pw,
                ImageContainer(
                  containerWidth: 56.w,
                  radius: 4.r,
                  containerHeight: 40.h,
                ),
                4.pw,
                Text(
                  "مجموعة مختارة من الدورات التعليمية",
                  style: MainTextStyle.boldTextStyle(
                    fontSize: 12,
                  ),
                ),
                const Spacer(),
                ButtonDependingOnState(state: state),
              ],
            ),
            4.ph,
            if (state != "done") ...{
              Text(
                "أضغط علي اسم البرنامج لإختيار الموعد المناسب",
                style: MainTextStyle.boldTextStyle(
                  fontSize: 11,
                ),
              ),
            }
          ],
        ),
      ),
    );
  }
}