import 'package:eazifly_student/core/component/custom_tapbar.dart';
import 'package:eazifly_student/presentation/controller/group_program_management_controller/grouppackagemanagement_cubit.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class FixedDatesBody extends StatelessWidget {
  const FixedDatesBody({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<GrouppackagemanagementCubit>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        16.ph,
        CustomTabBar(
          tabs: [
            Text(
              "تكرار الحصص اسبوعيا",
              style: MainTextStyle.boldTextStyle(fontSize: 12),
            ),
            Text(
              "تحديد كل المواعيد",
              style: MainTextStyle.boldTextStyle(fontSize: 12),
            ),
          ],
          controller: cubit.fixedDateController!,
        ),
        SizedBox(
          height: 270.h,
          child: TabBarView(
            controller: cubit.fixedDateController,
            children: cubit.bodiesMethod(context: context),
          ),
        ),
      ],
    );
  }
}
