import 'package:eazifly_student/core/component/bounded_time_slot_form_fields.dart';
import 'package:eazifly_student/core/component/date_type_row.dart';
import 'package:eazifly_student/core/component/nested_avatar_container.dart';
import 'package:eazifly_student/presentation/view/layout/my_programs/selection_of_educational_courses_view/widgets/dummy_data.dart';
import 'package:eazifly_student/presentation/view/layout/my_programs/selection_of_educational_courses_view/widgets/next_lecture_data_container.dart';
import 'package:eazifly_student/presentation/view/layout/my_programs/selection_of_educational_courses_view/widgets/program_state_btn.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class SelectionOfEducationalCoursesView extends StatelessWidget {
  const SelectionOfEducationalCoursesView({super.key});

  @override
  Widget build(BuildContext context) {
    var lang = context.loc!;
    return Scaffold(
      appBar: CustomAppBar(
        context,
        leadingCustomWidth: 80.w,
        mainTitle: "مجموعة مختارة من الدورات التعليمية",
        leadingText: lang.back,
        isCenterTitle: true,
        customAction: [
          InkWell(
            onTap: () => showModalSheet(
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "اليوم",
                                              style:
                                                  MainTextStyle.boldTextStyle(
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
                                                child:
                                                    const CustomTextFormField(
                                                  // filledColor:
                                                  //     MainColors.lightGray,
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
                                              horizontal: 16.w),
                                          child:
                                              const BoundedTimeSlotFormFields(),
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
                                  // arguments: index == 2 ?widget. programId : null,
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
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: SvgPicture.asset(
                Assets.iconsVerticalDots,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          StudentStats(
            horizontalPadding: 0,
            titleText: const ["نوع الإشتراك", "عدد الطلاب", "الطلاب"],
            // descText: [ "4 طلاب", "يبسي"],
            downSideWidgets: [
              Text(
                "عائلي",
                style: MainTextStyle.boldTextStyle(
                  fontSize: 12,
                  color: MainColors.blackText,
                ),
              ),
              Text(
                "4 طلاب",
                style: MainTextStyle.boldTextStyle(
                  fontSize: 12,
                  color: MainColors.blackText,
                ),
              ),
              NestedAvatarContainer(
                image: [],
                noOfItems: 4,
                number: "",
                alignment: MainAxisAlignment.center,
                avatarHeigt: 24.h,
                avatarWidth: 24.w,
                areaHeigt: 30.h,
                areaWidth: 68.w,
              ),
            ],
          ),
          const NextLectureDataContainer(),
          16.ph,
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            constraints: BoxConstraints(
              minHeight: 316.h,
            ),
            decoration: BoxDecoration(
              color: MainColors.veryLightGrayFormField,
              borderRadius: 16.cr,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "برامج المجموعة",
                  style: MainTextStyle.boldTextStyle(
                    fontSize: 14,
                  ),
                ),
                8.ph,
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => InkWell(
                    onTap: () => Navigator.pushNamed(
                        context, RoutePaths.selectionProgramItemDetailsView),
                    child: SizedBox(
                      height: 64.h,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 39.h,
                            width: 56.w,
                            decoration: BoxDecoration(
                              borderRadius: 4.cr,
                              image: const DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                  Assets.imagesPersona,
                                ),
                              ),
                            ),
                          ),
                          4.pw,
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "مجموعة مختارة من الدورات التعليمية",
                                  style: MainTextStyle.boldTextStyle(
                                    fontSize: 12,
                                    color: MainColors.black,
                                  ),
                                ),
                                4.ph,
                                Text(
                                  "إكتشفوا جمال تعلم القرآن من خلال دروسنا المصممة خصيصًا",
                                  style: MainTextStyle.mediumTextStyle(
                                    fontSize: 11,
                                    color: MainColors.grayTextColors,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                          ProgramStateButton(
                            state: index == 0 ? "ongoing" : "dated",
                          ),
                        ],
                      ),
                    ),
                  ),
                  separatorBuilder: (context, index) => 8.ph,
                  itemCount: 4,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
