import 'package:eazifly_student/core/component/custom_tapbar.dart';
import 'package:eazifly_student/presentation/controller/group_program_management_controller/grouppackagemanagement_cubit.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class FixedDatesBody extends StatelessWidget {
  final int programId;
  const FixedDatesBody({super.key, required this.programId});

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
        Expanded(
          // height: 270.h,
          child: TabBarView(
            controller: cubit.fixedDateController,
            children: cubit.subTabbarBody(
              context: context,
              programId: programId
            ),
          ),
        ),
      ],
    );
  }
}
