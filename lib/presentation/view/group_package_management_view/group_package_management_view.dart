import 'package:eazifly_student/presentation/controller/group_program_management_controller/grouppackagemanagement_cubit.dart';
import 'package:eazifly_student/presentation/view/layout/my_account/student_management_view/widgets/std_data_item.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class GroupPackageManagementView extends StatelessWidget {
  const GroupPackageManagementView({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = GrouppackagemanagementCubit.get(context);
    var lang = context.loc!;
    return Scaffold(
      appBar: CustomAppBar(
        context,
        mainTitle: "إدارة مجموعة برامج",
        leadingText: lang.back,
        isCenterTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                SizedBox(
                  height: 56.h,
                  child: const Text("Stepper").center(),
                ),
                24.ph,
                const StudentStats(
                  length: 2,
                ),
                24.ph,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "الطلاب المسجلين",
                        style: MainTextStyle.boldTextStyle(
                          fontSize: 12,
                        ),
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.add,
                        size: 20,
                        color: MainColors.blueTextColor,
                      ),
                      4.pw,
                      Text(
                        "أضافة طالب جديد",
                        style: MainTextStyle.boldTextStyle(
                          fontSize: 12,
                          color: MainColors.blueTextColor,
                        ),
                      ),
                    ],
                  ),
                ),
                4.ph,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        MyImages.iconsBulb,
                      ),
                      Text(
                        "أختر الطلاب الذي تود إشراكهم في البرنامج",
                        style: MainTextStyle.mediumTextStyle(
                          fontSize: 11,
                          color: MainColors.checkBoxBorderGray,
                        ),
                      ),
                    ],
                  ),
                ),
                16.ph,
                Expanded(
                  child: ListView.separated(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    itemBuilder: (context, index) {
                      for (int i = 0; i < 13; i++) {
                        cubit.chosen.add(false);
                      }
                      return Row(
                        children: [
                          BlocBuilder(
                            bloc: cubit,
                            builder: (context, state) => Checkbox.adaptive(
                              activeColor: MainColors.blueTextColor,
                              visualDensity: const VisualDensity(
                                  horizontal: -4, vertical: -4),
                              value: cubit.chosen[index],
                              onChanged: (value) {
                                cubit.changeChosen(index);
                              },
                            ),
                          ),
                          StudentDataItem(
                            width: 311.w,
                            index: index,
                            hasIcon: false,
                          ),
                        ],
                      );
                    },
                    itemCount: 13,
                    separatorBuilder: (context, index) => 10.ph,
                  ),
                ),
              ],
            ),
          ),
          8.ph,
          CustomElevatedButton(
            text: lang.next,
            color: MainColors.blueTextColor,
            height: 48.h,
            width: 343.w,
            radius: 16.r,
            onPressed: () {},
          ),
          32.ph,
        ],
      ),
    );
  }
}
