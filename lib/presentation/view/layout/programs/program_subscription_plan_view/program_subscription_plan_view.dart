import 'package:eazifly_student/core/component/avatar_image.dart';
import 'package:eazifly_student/core/component/custom_drop_down.dart';
import 'package:eazifly_student/core/component/shimmer_widget.dart';
import 'package:eazifly_student/core/component/titled_form_field.dart';
import 'package:eazifly_student/presentation/controller/program_subscription_plan/programsubscriptionplan_cubit.dart';
import 'package:eazifly_student/presentation/controller/program_subscription_plan/programsubscriptionplan_state.dart';
import 'package:eazifly_student/presentation/view/layout/programs/program_subscription_plan_view/widgets/lesson_duration_card_item.dart';
import 'package:eazifly_student/presentation/view/layout/programs/program_subscription_plan_view/widgets/subscribtion_plan_card_item.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';
import 'package:flutter_html/flutter_html.dart';

class ProgramSubscriptionPlanView extends StatefulWidget {
  final int programId;
  final String programTitle;
  final String programDescription;
  final String programImage;
  const ProgramSubscriptionPlanView({
    super.key,
    required this.programId,
    required this.programDescription,
    required this.programTitle,
    required this.programImage,
  });

  @override
  State<ProgramSubscriptionPlanView> createState() =>
      _ProgramSubscriptionPlanViewState();
}

class _ProgramSubscriptionPlanViewState
    extends State<ProgramSubscriptionPlanView> {
  late ProgramsubscriptionplanCubit cubit;
  @override
  void initState() {
    cubit = ProgramsubscriptionplanCubit.get(context);
    cubit.getPlans(programId: widget.programId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var lang = context.loc!;
    return Scaffold(
      appBar: CustomAppBar(
        context,
        mainTitle: "تفاصيل البرنامج",
        leadingText: lang.thePrograms,
        isCenterTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Form(
              key: cubit.formKey,
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                children: [
                  16.ph,
                  AvatarImage(
                    height: 188.h,
                    width: double.infinity,
                    radius: 16.r,
                    imageUrl: widget.programImage,
                    // fit: BoxFit.cover,
                  ),
                  16.ph,
                  SizedBox(
                    height: 29.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.programTitle,
                          style: MainTextStyle.boldTextStyle(fontSize: 14),
                        ),
                        // TextedContainer(
                        //   text: "540 ج.م",
                        //   radius: 8.r,
                        //   width: 67.w,
                        //   containerColor: MainColors.lightblue,
                        //   textColor: MainColors.blueTextColor,
                        // ),
                      ],
                    ),
                  ),
                  8.ph,
                  Html(data: widget.programDescription),
                  24.ph,
                  const CustomHorizontalDivider(),
                  16.ph,
                  SizedBox(
                    height: 21.h,
                    child: Text(
                      "خطة الاشتراك",
                      style: MainTextStyle.boldTextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ),
                  12.ph,
                  SizedBox(
                    height: 69.h,
                    child: BlocBuilder<ProgramsubscriptionplanCubit,
                        ProgramsubscriptionplanState>(
                      bloc: cubit,
                      builder: (context, state) {
                        // حالة التحميل
                        if (cubit.getPlansLoader) {
                          return const Center(
                            child:
                                CircularProgressIndicator(), // أو أي Loader تفضله
                          );
                        }

                        // حالة الخطأ
                        if (state is GetPlansErrorState) {
                          return Center(
                            child: Text('حدث خطأ: ${state.errorMessage}'),
                          );
                        }

                        // حالة النجاح
                        if (!cubit.getPlansLoader) {
                          final subscribeDays =
                              cubit.getPlansEntity?.data?.subscripeDays;

                          return ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) =>
                                SubscriptionPlanCardItem(
                              isSelected: index == cubit.planSubscribeDaysIndex,
                              day: subscribeDays?[index] ?? "no data",
                              icons: planIcons[index],
                              onTap: () {
                                cubit.changePlanIndex(index);
                              },
                            ),
                            separatorBuilder: (context, index) =>
                                const SizedBox(width: 10),
                            itemCount: subscribeDays?.length ?? 0,
                          );
                        }

                        // الحالة الافتراضية
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    ),
                  ),
                  16.ph,
                  SizedBox(
                    height: 21.h,
                    child: Text(
                      "مدة الدرس",
                      style: MainTextStyle.boldTextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ),
                  12.ph,
                  SizedBox(
                    height: 69.h,
                    child: BlocBuilder(
                      bloc: cubit,
                      builder: (context, state) {
                        final lessonDuration =
                            cubit.getPlansEntity?.data?.duration;
                        return ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) =>
                              LessonDurationCardItem(
                            duration: lessonDuration?[index] ?? "",
                            isSelected: index == cubit.lessonDurationIndex,
                            icons: planIcons[index],
                            onTap: () {
                              cubit.changelessonDurationIndex(index);
                            },
                          ),
                          separatorBuilder: (context, index) => 10.pw,
                          itemCount: lessonDuration?.length ?? 0,
                        );
                      },
                    ),
                  ),
                  20.ph,
                  const CustomHorizontalDivider(),
                  16.ph,
                  TitledFormFieldItem(
                    titleText: "عدد الطلاب",
                    iconWidget: 0.ph,
                    keyboardType: TextInputType.number,
                    controller: cubit.studentNumberController,
                    formfieldHintText: "عدد الطلاب",
                    validator: customValidation,
                  ),
                  16.ph,
                  Text(
                    "عدد الحصص أسبوعيا",
                    style: MainTextStyle.boldTextStyle(
                      fontSize: 14,
                      color: MainColors.blackText,
                    ),
                  ),
                  8.ph,
                  BlocBuilder(
                    bloc: cubit,
                    builder: (context, state) {
                      if (cubit.getPlansLoader) {
                        SizedBox(
                          width: 343.w,
                          height: 48.h,
                          child: const ShimmerWidget(),
                        );
                      }
                      return CustomizedDropdownWidget(
                        hintText: "عدد الحصص أسبوعيا",
                        validator: (val) =>
                            val == null ? "من فضلك اختر الحصص" : null,
                        items:
                            cubit.getPlansEntity?.data?.numberOfSessionPerWeek!
                                .map(
                                  (e) => DropdownMenuItem(
                                    value: e,
                                    child: Text(e),
                                  ),
                                )
                                .toList(),
                        onChanged: (val) {
                          cubit.filterPlans(programId: widget.programId);
                        },
                      );
                    },
                  ),

                  // 16.ph,
                  // TitledFormFieldItem(
                  //   titleText: "تاريخ البدء",
                  //   iconWidget: 0.ph,
                  //   formfieldHintText: "12-5-2025",
                  // ),
                  16.ph,
                  const CustomHorizontalDivider(),
                  16.ph,
                  16.ph,
                  SizedBox(
                    height: 21.h,
                    child: Text(
                      "الكوبونات والخصومات",
                      style: MainTextStyle.boldTextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ),
                  16.ph,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: TitledFormFieldItem(
                          titleText: "كوبون خصم",
                          iconWidget: 0.ph,
                          formfieldHintText: "asd151",
                          validator: customValidation,
                          controller: cubit.copounController,
                        ),
                      ),
                      OutlinedButton(
                        onPressed: () {
                          if (cubit.copounController.text.isNotEmpty) {
                            cubit.checkCopouns(context: context);
                          } else {
                            delightfulToast(
                              message: "ادخل الكوبون",
                              context: context,
                            );
                          }
                        },
                        child: Text(
                          "تأكيد",
                          style: MainTextStyle.boldTextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                  // 16.ph,
                  // TitledFormFieldItem(
                  //   titleText: "كوبون مشاركة صديق",
                  //   iconWidget: 0.ph,
                  //   formfieldHintText: "ASD151",
                  // ),
                  16.ph,
                  SizedBox(
                    height: 21.h,
                    child: Text(
                      "خدمات اضافية",
                      style: MainTextStyle.boldTextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ),
                  16.ph,
                  ...List.generate(
                    2,
                    (index) => Row(
                      children: [
                        Checkbox.adaptive(
                          activeColor: MainColors.blueTextColor,
                          value: index == 0,
                          onChanged: (val) {},
                        ),
                        Text(
                          index == 0
                              ? "إختيار موعد الحصص مخصص"
                              : "تسجيل الحصص الخاص بك",
                          style: MainTextStyle.boldTextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  16.ph,
                  const CustomHorizontalDivider(),
                  43.ph,
                  Row(
                    children: [
                      Checkbox.adaptive(
                        activeColor: MainColors.blueTextColor,
                        value: false,
                        onChanged: (val) {},
                      ),
                      Text(
                        "أوافق علي الشروط والأحكام و سياسة الخصوصية",
                        style: MainTextStyle.boldTextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          8.ph,
          CustomElevatedButton(
            text: "اشتراك",
            onPressed: () async {
              if (cubit.formKey.currentState!.validate()) {
                Navigator.pushNamed(
                  arguments: cubit,
                  context,
                  RoutePaths.completePaymentProcessScreen,
                );
              }
            },
            color: MainColors.blueTextColor,
            width: 343.w,
            radius: 16.r,
          ),
          32.ph,
        ],
      ),
    );
  }
}

var planIcons = [
  Assets.iconsLoadingSand,
  Assets.iconsSecurityTime,
  Assets.iconsCalender
];
