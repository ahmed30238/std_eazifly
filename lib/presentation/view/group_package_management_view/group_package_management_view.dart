import 'package:eazifly_student/core/component/icon_stepper.dart';
import 'package:eazifly_student/presentation/controller/group_program_management_controller/grouppackagemanagement_cubit.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class GroupPackageManagementView extends StatelessWidget {
  const GroupPackageManagementView({super.key});

  @override
  Widget build(BuildContext context) {
    const stepIcons = [MyImages.iconsPeople, MyImages.iconsLecturerIcon];
    final List<String> titles = [
      "إختيار الطلاب",
      "إختيار المعلمين",
    ];
    var cubit = GrouppackagemanagementCubit.get(context);
    var lang = context.loc!;
    return Scaffold(
      appBar: CustomAppBar(
        context,
        mainTitle: "إدارة مجموعة برامج",
        leadingText: lang.back,
        onLeadinTap: () => cubit.decrementStepperIndex(context),
        isCenterTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  height: 60.h,
                  child: BlocBuilder(
                    bloc: cubit,
                    builder: (context, state) => StepProgressView(
                      titles: titles,
                      key: const Key("value"),
                      icons: stepIcons,
                      width: MediaQuery.of(context).size.width,
                      curStep: cubit.stepperIndex,
                      color: MainColors.blueTextColor,
                    ),
                  ),
                ),
                24.ph,
                StudentStats(
                  horizontalPadding: 0,
                  itemWidth: 167.5.w,
                  alignment: MainAxisAlignment.center,
                  length: 2,
                ),
                24.ph,
                Expanded(
                  child: BlocBuilder(
                    bloc: cubit,
                    builder: (context, state) =>
                        cubit.bodies[cubit.stepperIndex],
                  ),
                ),
              ],
            ),
          ),
          8.ph,
          BlocBuilder(
            bloc: cubit,
            builder: (context, state) => CustomElevatedButton(
              text: cubit.stepperIndex == 1 ? lang.next : "بدء البرامج",
              color: MainColors.blueTextColor,
              height: 48.h,
              width: 343.w,
              radius: 16.r,
              onPressed: () {
                cubit.incrementStepperIndex(context);
              },
            ),
          ),
          32.ph,
        ],
      ),
    );
  }
}
