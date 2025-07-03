import 'package:eazifly_student/core/component/bounded_time_slot_form_fields.dart';
import 'package:eazifly_student/core/component/date_type_row.dart';
import 'package:eazifly_student/presentation/view/layout/my_programs/selection_of_educational_courses_view/widgets/dummy_data.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

Future<dynamic> lectureAppBarModalSheet(BuildContext context, int programId) {
  return showModalSheet(
    isFixedSize: true,
    minHeight: 313.h,
    maxHeight: 314.h,
    context,
    widget: CustomBottomSheetDesign(
      widget: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        children: [
          24.ph,
          ...List.generate(
            5,
            (index) => InkWell(
              onTap: index == 1
                  ? () {
                      back(context);
                      showModalSheet(
                        isFixedSize: true,
                        minHeight: 483.h,
                        maxHeight: 483.h,
                        context,
                        widget: CustomBottomSheetDesign(
                          widget: Column(
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
                              SchdeuleTypeRow(
                                changeDateTypeIndex: (g) {},
                                cubitIndex: 0,
                              ),
                              44.ph,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "اليوم",
                                    style: MainTextStyle.boldTextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                  16.pw,
                                  SizedBox(
                                    width: 299.w,
                                    child: InkWell(
                                      onTap: () => showDatePicker(
                                        firstDate: DateTime.now(),
                                        lastDate: DateTime(3060),
                                        context: context,
                                      ),
                                      child: const CustomTextFormField(
                                        enabled: false,
                                        hintText: "السبت",
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              20.ph,
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 16.w,
                                ),
                                child: const BoundedTimeSlotFormFields(),
                              ),
                              const Spacer(),
                              CustomElevatedButton(
                                radius: 16.r,
                                width: 343.w,
                                height: 48.w,
                                color: MainColors.blueTextColor,
                                text: "اختيار",
                                onPressed: () {
                                  back(context);
                                  Navigator.pushNamed(
                                    context,
                                    RoutePaths.lectureView,
                                    arguments: false,
                                  );
                                },
                              ),
                              32.ph,
                            ],
                          ),
                        ),
                      );
                    }
                  : () {
                      back(context);
                      Navigator.pushNamed(
                        arguments: index == 2 ? programId : null,
                        context,
                        paths[index],
                      );
                    },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12.h),
                margin: EdgeInsets.symmetric(horizontal: 16.h),
                height: 45,
                child: Text(
                  titles[index],
                  style: MainTextStyle.boldTextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
