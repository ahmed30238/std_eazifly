import 'package:eazifly_student/core/component/custom_rich_text.dart';
import 'package:eazifly_student/core/helper_methods/helper_methods.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class SchedulesBody extends StatelessWidget {
  const SchedulesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => const ScheduleItem(),
      separatorBuilder: (context, index) => 8.ph,
      itemCount: 8,
    );
  }
}

class ScheduleItem extends StatelessWidget {
  const ScheduleItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
      height: 74.h,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: MainColors.veryLightGrayFormField,
      ),
      child: SizedBox(
        height: 74.h,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                children: [
                  Text(
                    "تاريخ المحاضرة",
                    style: MainTextStyle.boldTextStyle(
                      fontSize: 11,
                      color: MainColors.grayTextColors,
                    ),
                  ),
                  8.ph,
                  Text(
                    "الإثنين  12-3-2025",
                    style: MainTextStyle.boldTextStyle(
                      fontSize: 12,
                      color: MainColors.black,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Text(
                    "وقت المحاضرة",
                    style: MainTextStyle.boldTextStyle(
                      fontSize: 11,
                      color: MainColors.grayTextColors,
                    ),
                  ),
                  8.ph,
                  Expanded(
                    child: Text(
                      "12:45 الي 1:00 ",
                      style: MainTextStyle.boldTextStyle(
                        fontSize: 12,
                        color: MainColors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            27.pw,
            InkWell(
              onTap: () {
                showModalSheet(
                  isFixedSize: true,
                  maxHeight: 323.h,
                  minHeight: 322.h,
                  context,
                  widget: CustomBottomSheetDesign(
                    widget: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Column(
                        children: [
                          16.ph,
                          SizedBox(
                            height: 36.h,
                            child: Text(
                              "برجاء تحديد المواعيد الجديدة",
                              style: MainTextStyle.boldTextStyle(fontSize: 15),
                            ),
                          ),
                          32.ph,
                          Row(
                            children: [
                              Text(
                                "اليوم",
                                style:
                                    MainTextStyle.boldTextStyle(fontSize: 12),
                              ),
                              16.pw,
                              SizedBox(
                                width: 291.w,
                                child: const InkWell(
                                  child: CustomTextFormField(
                                    filledColor: MainColors.lightGray,
                                    enabled: false,
                                    hintText: "السبت",
                                  ),
                                ),
                              ),
                            ],
                          ),
                          20.ph,
                          Row(
                            children: [
                              Text(
                                "الوقت",
                                style:
                                    MainTextStyle.boldTextStyle(fontSize: 12),
                              ),
                              16.pw,
                              SizedBox(
                                height: 54.h,
                                width: 291.w,
                                child: ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) =>
                                      const TimeSlot(),
                                  separatorBuilder: (context, index) => 12.pw,
                                  itemCount: 4,
                                ),
                              ),
                            ],
                          ),
                          40.ph,
                          CustomElevatedButton(
                            height: 48.h,
                            color: MainColors.blueTextColor,
                            text: "تحديد موعد جديد",
                            radius: 16.r,
                            onPressed: () {
                              back(context);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              child: Text(
                "تعديل الموعد",
                style: MainTextStyle.boldTextStyle(
                  fontSize: 12,
                  color: MainColors.blueTextColor,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TimeSlot extends StatelessWidget {
  const TimeSlot({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54.h,
      width: 135.w,
      decoration: BoxDecoration(
        color: MainColors.veryLightGrayFormField,
        borderRadius: 8.cr,
      ),
      child: CustomRichText(
        text1: "${DateTime.now().hour} : ${DateTime.now().minute}",
        text1Style: MainTextStyle.boldTextStyle(fontSize: 14),
        text2Style: MainTextStyle.boldTextStyle(fontSize: 14),
        spaceText: "  الي  ",
        spaceStyle: MainTextStyle.boldTextStyle(fontSize: 12),
        text2: "${DateTime.now().hour} : ${DateTime.now().minute}",
      ).center(),
    );
  }
}
