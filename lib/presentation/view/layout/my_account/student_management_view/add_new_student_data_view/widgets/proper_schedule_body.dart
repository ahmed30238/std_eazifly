import 'package:eazifly_student/presentation/controller/add_new_student_data_to_program_controller/add_new_student_data_to_program_cubit.dart';
import 'package:eazifly_student/presentation/controller/add_new_student_data_to_program_controller/add_new_student_data_to_program_state.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class ProperScheduleBody extends StatelessWidget {
  const ProperScheduleBody({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = AddNewStudentDataToProgramCubit.get(context);

    return Column(
      children: [
        Expanded(
          child: ListView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            children: [
              16.ph,
              Text(
                "أختر نوع المواعيد المناسب",
                style: MainTextStyle.boldTextStyle(
                  fontSize: 12,
                  color: MainColors.checkBoxBorderGray,
                ),
              ),
              4.ph,
              BlocBuilder<AddNewStudentDataToProgramCubit,
                  AddNewStudentDataToProgramState>(
                builder: (context, state) => CustomFilledTabBar(
                  innerRadius: 12.r,
                  margin: EdgeInsets.zero,
                  outerRadius: 12.cr,
                  controller: cubit.controller!,
                  onTap: (value) {
                    cubit.controller?.animateTo(value);
                    cubit.changeTapbarIndex(value);
                  },
                  tabs: List.generate(
                    cubit.tabs.length,
                    (index) {
                      bool isSelected = cubit.controller?.index == index;
                      return Text(
                        cubit.tabs[index],
                        style: MainTextStyle.boldTextStyle(
                          fontSize: 12,
                          color: isSelected ? Colors.white : Colors.black,
                        ),
                      );
                    },
                  ),
                ),
              ),
              BlocBuilder(
                bloc: cubit,
                builder: (context, state) => SizedBox(
                  height: cubit.controller?.index == 0 ? 300.h : 172 * 9.h,
                  child: TabBarView(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: cubit.controller,
                    children: [
                      Column(
                        children: [
                          12.ph,
                          Container(
                            height: 70.h,
                            width: 343.w,
                            decoration: BoxDecoration(
                              borderRadius: 12.cr,
                              color: MainColors.veryLightGrayFormField,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "عدد الحصص المتاحة",
                                  style: MainTextStyle.boldTextStyle(
                                    fontSize: 11,
                                    color: MainColors.grayTextColors,
                                  ),
                                ),
                                Text(
                                  "8",
                                  style: MainTextStyle.boldTextStyle(
                                    fontSize: 12,
                                    color: MainColors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          12.ph,
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "اليوم",
                                  style:
                                      MainTextStyle.boldTextStyle(fontSize: 12),
                                ),
                              ),
                              16.pw,
                              Expanded(
                                flex: 9,
                                child: InkWell(
                                  onTap: () => showDatePicker(
                                    context: context,
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime(2030),
                                  ),
                                  child: CustomTextFormField(
                                    enabled: false,
                                    hintText: "اختر",
                                    suffixIconWidget: Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 16.w,
                                      ),
                                      child: SvgPicture.asset(
                                        Assets.iconsCalender,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          12.ph,
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "من",
                                  style:
                                      MainTextStyle.boldTextStyle(fontSize: 12),
                                ),
                              ),
                              16.pw,
                              const Expanded(
                                flex: 8,
                                child: CustomTextFormField(
                                  keyboardType: TextInputType.datetime,
                                  hintText: "        aa / mm / hh",
                                ),
                              ),
                              15.5.pw,
                              Expanded(
                                child: Text(
                                  "الي",
                                  style:
                                      MainTextStyle.boldTextStyle(fontSize: 12),
                                ),
                              ),
                              16.pw,
                              const Expanded(
                                flex: 8,
                                child: CustomTextFormField(
                                  keyboardType: TextInputType.datetime,
                                  hintText: "        aa / mm / hh",
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      // ! second screen
                      Column(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                12.ph,
                                Container(
                                  height: 70.h,
                                  width: 343.w,
                                  decoration: BoxDecoration(
                                    borderRadius: 12.cr,
                                    color: MainColors.veryLightGrayFormField,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "عدد الحصص المتاحة",
                                        style: MainTextStyle.boldTextStyle(
                                          fontSize: 11,
                                          color: MainColors.grayTextColors,
                                        ),
                                      ),
                                      Text(
                                        "8",
                                        style: MainTextStyle.boldTextStyle(
                                          fontSize: 12,
                                          color: MainColors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                12.ph,
                                Expanded(
                                  child: ListView.separated(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) =>
                                        ClassSpecifyingTimeWidget(
                                      index: index,
                                    ),
                                    separatorBuilder: (context, index) => 10.ph,
                                    itemCount: 8,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        8.ph,
        CustomElevatedButton(
          width: 343.w,
          text: "التالي",
          onPressed: () {
            cubit.incrementScreenIndex();
          },
          color: MainColors.blueTextColor,
          radius: 16.r,
        ),
        32.ph,
      ],
    );
  }
}

class ClassSpecifyingTimeWidget extends StatelessWidget {
  final int index;
  const ClassSpecifyingTimeWidget({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 12.h,
        horizontal: 8.w,
      ),
      height: 172.h,
      decoration: BoxDecoration(
        color: MainColors.veryLightGrayFormField,
        borderRadius: 12.cr,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "حصة ${index + 1}",
            style: MainTextStyle.boldTextStyle(
              fontSize: 14,
              color: MainColors.blueTextColor,
            ),
          ),
          Row(
            children: [
              Text(
                "اليوم",
                style: MainTextStyle.boldTextStyle(
                  fontSize: 12,
                ),
              ),
              16.pw,
              Expanded(
                child: InkWell(
                  onTap: () => showDatePicker(
                    context: context,
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2030),
                  ),
                  child: CustomTextFormField(
                    enabled: false,
                    hintText: "اختر",
                    suffixIconWidget: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                      ),
                      child: SvgPicture.asset(
                        Assets.iconsCalender,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          12.ph,
          Row(
            children: [
              Text(
                "من",
                style: MainTextStyle.boldTextStyle(fontSize: 12),
              ),
              16.pw,
              const Expanded(
                child: CustomTextFormField(
                  keyboardType: TextInputType.datetime,
                  hintText: "        aa / mm / hh",
                ),
              ),
              15.5.pw,
              Text(
                "الي",
                style: MainTextStyle.boldTextStyle(fontSize: 12),
              ),
              16.pw,
              const Expanded(
                child: CustomTextFormField(
                  keyboardType: TextInputType.datetime,
                  hintText: "        aa / mm / hh",
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
