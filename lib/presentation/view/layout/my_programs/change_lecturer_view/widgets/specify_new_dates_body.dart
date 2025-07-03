import 'dart:developer';

import 'package:eazifly_student/core/component/custom_tapbar.dart';
import 'package:eazifly_student/core/component/titled_form_field.dart';
import 'package:eazifly_student/core/enums/week_days.dart';
import 'package:eazifly_student/presentation/controller/change_lecturer_controller/changelecturer_cubit.dart';
import 'package:eazifly_student/presentation/view/set_appointments_view/widgets/lecturer_item.dart';
import 'package:eazifly_student/presentation/view/set_appointments_view/widgets/list_of_days_to_choose_from_item.dart';
import 'package:eazifly_student/presentation/view/set_appointments_view/widgets/specified_hour_row.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class SpecifyNewDatesBody extends StatelessWidget {
  const SpecifyNewDatesBody({super.key});

  @override
  Widget build(BuildContext context) {
    var lang = context.loc!;
    var cubit = ChangelecturerCubit.get(context);
    return Column(
      children: [
        24.ph,
        SizedBox(
          height: 36.h,
          child: Text(
            "برجاء تحديد المواعيد الجديدة",
            style: MainTextStyle.boldTextStyle(
              fontSize: 14,
            ),
          ),
        ),
        8.ph,
        BlocBuilder(
          bloc: cubit,
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
            height: 345.h,
            child: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              controller: cubit.controller,
              children: [
                Column(
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
                        children: cubit.subTabbarBody(context: context),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    32.ph,
                    GestureDetector(
                      onTap: () {
                        showModalSheet(
                          isFixedSize: true,
                          context,
                          minHeight: 495.h,
                          maxHeight: 496.h,
                          isDismissed: true,
                          widget: BlocProvider.value(
                            value: cubit,
                            child: CustomBottomSheetDesign(
                              radius: 16.r,
                              widget: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    24.ph,
                                    SizedBox(
                                      height: 20.h,
                                      child: Text(
                                        "اختر 3 ايام",
                                        style: MainTextStyle.mediumTextStyle(
                                          fontSize: 12,
                                          color: MainColors.grayTextColors,
                                        ),
                                      ),
                                    ),
                                    BlocBuilder(
                                      bloc: cubit,
                                      builder: (context, state) => Expanded(
                                        child: ListView.separated(
                                          separatorBuilder: (context, index) =>
                                              4.ph,
                                          itemBuilder: (context, index) {
                                            for (var i = 0; i < 7; i++) {
                                              cubit.chosenDays.add(false);
                                            }
                                            return ListOfDaysToChooseFromItem(
                                              onChanged: (p0) =>
                                                  cubit.changeChosenDays(index),
                                              day: WeekDaysEnum
                                                  .values[index].title,
                                              value: cubit.chosenDays[index],
                                            );
                                          },
                                          itemCount: 7,
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.center,
                                      child: CustomElevatedButton(
                                        radius: 16.r,
                                        text: lang.choose,
                                        color: MainColors.blueTextColor,
                                        onPressed: () {
                                          log("${cubit.chosenDays[0]}");
                                        },
                                        height: 48.h,
                                        width: 279.w,
                                      ),
                                    ),
                                    32.ph,
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      child: TitledFormFieldItem(
                        verticalSpace: 8.ph,
                        enabled: false,
                        suffIcon: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: SvgPicture.asset(Assets.iconsArrowDown),
                        ),
                        iconWidget: 0.ph,
                        titleText: lang.days,
                        formfieldHintText: lang.choose,
                      ),
                    ),
                    32.ph,
                    const SpecifiedHourRow(),
                    32.ph,
                    Text(
                      lang.chooseAppropriateLecturer,
                      style: MainTextStyle.boldTextStyle(
                        fontSize: 12,
                      ),
                    ),
                    8.ph,
                    SizedBox(
                      height: 48.h,
                      child: BlocBuilder(
                        bloc: cubit,
                        builder: (context, state) => ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            bool isSelected =
                                cubit.selectedLecturerIndex == index;
                            return InkWell(
                              onTap: () {
                                cubit.changeLecturerIndex(index);
                              },
                              child: LecturerItem(
                                image: "",
                                instructorName: "",
                                isSelected: isSelected,
                              ),
                            );
                          },
                          separatorBuilder: (context, index) => 8.pw,
                          itemCount: 4,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        // 44.ph,
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     Text(
        //       "اليوم",
        //       style: MainTextStyle.boldTextStyle(
        //         fontSize: 12,
        //       ),
        //     ),
        //     16.pw,
        //     SizedBox(
        //       width: 299.w,
        //       child: InkWell(
        //         onTap: () => weekDaysModalSheet(context, cubit),
        //         child: BlocBuilder(
        //           bloc: cubit,
        //           builder: (context, state) => CustomTextFormField(
        //             controller: cubit.dayController,
        //             enabled: false,
        //             hintText: "اختر",
        //           ),
        //         ),
        //       ),
        //     ),
        //   ],
        // ),
        // 20.ph,
        // Padding(
        //   padding: EdgeInsets.symmetric(horizontal: 16.w),
        //   child: const BoundedTimeSlotFormFields(),
        // ),
        const Spacer(),
        CustomElevatedButton(
          radius: 16.r,
          width: 343.w,
          height: 48.w,
          color: MainColors.blueTextColor,
          text: "التالي",
          onPressed: () {
            cubit.incrementBodyIndex();
          },
        ),
        32.ph,
      ],
    );
  }
}
