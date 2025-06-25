import 'package:eazifly_student/core/component/custom_tapbar.dart';
import 'package:eazifly_student/presentation/controller/set_appointment_controller/setappointments_cubit.dart';
import 'package:eazifly_student/presentation/view/layout/my_programs/change_lecturer_view/widgets/bottom_sheet_day_controller.dart';
import 'package:eazifly_student/presentation/view/set_appointments_view/widgets/flexible_hour_body.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class ScreenTabbarView extends StatelessWidget {
  const ScreenTabbarView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = SetappointmentsCubit.get(context);

    return BlocBuilder(
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
                SizedBox(
                  height: 200.h,
                  child: TabBarView(
                    controller: cubit.fixedDateController,
                    children: [
                      Column(
                        children: [
                          16.ph,
                          Row(
                            children: [
                              Text(
                                "اليوم",
                                style:
                                    MainTextStyle.boldTextStyle(fontSize: 12),
                              ),
                              8.pw,
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    showModalSheet(
                                      isFixedSize: true,
                                      minHeight: 400.h,
                                      maxHeight: 401.h,
                                      context,
                                      widget: BlocProvider.value(
                                        value: cubit,
                                        child: CustomBottomSheetDesign(
                                          radius: 16.r,
                                          widget: Column(
                                            children: [
                                              24.ph,
                                              ...List.generate(
                                                7,
                                                (index) =>
                                                    BottomSheetDayContainer(
                                                  onTap: () {
                                                    cubit.changeSpecifiedDay(
                                                        weekDaysAr[index]);
                                                    back(context);
                                                  },
                                                  day: weekDaysAr[index],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  child: CustomTextFormField(
                                    controller: cubit.dayController,
                                    hintText: "",
                                    enabled: false,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          16.ph,
                          Row(
                            children: [
                              Text(
                                "الموعد",
                                style:
                                    MainTextStyle.boldTextStyle(fontSize: 12),
                              ),
                              8.pw,
                              const Expanded(
                                child: CustomTextFormField(
                                  hintText: "24 ساعة",
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          16.ph,
                          Text(
                            "حصة ${0 + 1}",
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
                                style:
                                    MainTextStyle.boldTextStyle(fontSize: 12),
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
                                style:
                                    MainTextStyle.boldTextStyle(fontSize: 12),
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
                    ],
                  ),
                ),
              ],
            ),
            const FlexibleHourBody()
          ],
        ),
      ),
    );
  }
}
