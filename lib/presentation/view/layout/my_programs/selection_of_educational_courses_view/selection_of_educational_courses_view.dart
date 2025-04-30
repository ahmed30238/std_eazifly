import 'package:eazifly_student/core/component/nested_avatar_container.dart';
import 'package:eazifly_student/core/helper_methods/helper_methods.dart';
import 'package:eazifly_student/presentation/view/layout/my_programs/selection_of_educational_courses_view/widgets/next_lecture_data_container.dart';
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

                  // crossAxisAlignment: CrossAxisAlignment.start,
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
                                        const SchdeuleTypeRow(),
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
                                Navigator.pushNamed(
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

class BoundedTimeSlotFormFields extends StatelessWidget {
  final MainAxisAlignment? alignment;
  const BoundedTimeSlotFormFields({super.key, this.alignment});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: alignment ?? MainAxisAlignment.center,
      children: [
        Expanded(
          child: Text(
            "من",
            style: MainTextStyle.boldTextStyle(fontSize: 12),
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
            style: MainTextStyle.boldTextStyle(fontSize: 12),
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
    );
  }
}

class SchdeuleTypeRow extends StatelessWidget {
  const SchdeuleTypeRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        2,
        (index) {
          bool isSelected = index == 1;
          return Container(
            margin: EdgeInsets.only(
              left: index == 0 ? 16.w : 0,
            ),
            height: 127.h,
            width: 130.w,
            decoration: BoxDecoration(
              color: isSelected ? MainColors.lightblue : MainColors.white,
              borderRadius: 16.cr,
              border: Border.all(
                color: isSelected ? MainColors.blueTextColor : MainColors.black,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(Assets.iconsClock),
                16.ph,
                Text(
                  "مواعيد مرنة",
                  style: MainTextStyle.boldTextStyle(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

var titles = [
  "أهداف البرنامج",
  "تغيير مواعيد البرنامج",
  "تغيير المحاضر",
  "إعدادات الطلاب المشتركين",
  "تاريخ المحاضرات ",
];
var paths = [
  RoutePaths.programGoalsView,
  "",
  RoutePaths.changeLecturerView,
  RoutePaths.subscribedStudentsSettingsView,
  RoutePaths.lectureHistoryView,
];

class ProgramStateButton extends StatelessWidget {
  final String state;
  const ProgramStateButton({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    switch (state) {
      case "ongoing":
        return CustomLowSizeButton(
          height: 28.h,
          width: 96.w,
          text: "اعادة دخول",
          onTap: () {},
        );
      case "dated":
        return CustomLowSizeButton(
          btnColor: MainColors.lightgreenTeal,
          textColor: MainColors.greenTeal,
          height: 28.h,
          width: 96.w,
          text: "بعد  2 يوم",
          onTap: () {},
        );

      default:
        return const Text("Unknown");
    }
  }
}
