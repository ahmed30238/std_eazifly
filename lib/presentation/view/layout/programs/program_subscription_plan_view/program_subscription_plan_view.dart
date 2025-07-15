import 'dart:developer';

import 'package:eazifly_student/core/component/avatar_image.dart';
import 'package:eazifly_student/core/component/custom_drop_down.dart';
import 'package:eazifly_student/core/component/shimmer_widget.dart';
import 'package:eazifly_student/core/component/titled_form_field.dart';
import 'package:eazifly_student/presentation/view/layout/programs/program_subscription_plan_view/widgets/lesson_duration_card_item.dart';
import 'package:eazifly_student/presentation/view/layout/programs/program_subscription_plan_view/widgets/subscribtion_plan_card_item.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';
import 'package:flutter_html/flutter_html.dart';

// إنشاء Abstract Class للـ Cubit
abstract class SubscriptionPlanCubit extends Cubit<dynamic> {
  // الخصائص المشتركة
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController studentNumberController = TextEditingController();
  TextEditingController startDate = TextEditingController();
  TextEditingController copounController = TextEditingController();

  bool getPlansLoader = false;
  int planSubscribeDaysIndex = 0;
  int lessonDurationIndex = 0;

  SubscriptionPlanCubit(super.initialState);

  // الوظائف المشتركة التي يجب تنفيذها في كل Cubit
  void getPlans({required int programId});
  void changePlanIndex(int index);
  void changelessonDurationIndex(int index);
  void updateStartDate(DateTime date);
  void filterPlans({required int programId, required BuildContext context});
  void checkCopouns({required BuildContext context});

  // الـ Entity المشترك (يمكن أن يكون مختلف حسب النوع)
  dynamic get getPlansEntity;
}

class ProgramSubscriptionPlanView extends StatefulWidget {
  final int programId;
  final String programTitle;
  final String programDescription;
  final String programImage;
  final bool isUpgrade;
  final SubscriptionPlanCubit cubit;
  final String appBarTitle;
  final String leadingText;

  const ProgramSubscriptionPlanView({
    super.key,
    required this.programId,
    required this.programDescription,
    required this.programTitle,
    required this.programImage,
    required this.cubit,
    this.appBarTitle = "تفاصيل البرنامج",
    this.leadingText = "البرامج",
    this.isUpgrade = false,
  });

  @override
  State<ProgramSubscriptionPlanView> createState() =>
      _ProgramSubscriptionPlanViewState();
}

class _ProgramSubscriptionPlanViewState
    extends State<ProgramSubscriptionPlanView> {
  late SubscriptionPlanCubit cubit;

  @override
  void initState() {
    cubit = widget.cubit; // استخدام الـ Cubit الممرر
    cubit.getPlans(programId: widget.programId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // var lang = context.loc!;
    return Scaffold(
      appBar: CustomAppBar(
        context,
        mainTitle: widget.appBarTitle, // استخدام العنوان المخصص
        leadingText: widget.leadingText, // استخدام النص المخصص
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
                    child: BlocBuilder(
                      bloc: cubit,
                      builder: (context, state) {
                        if (cubit.getPlansLoader) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        if (state.toString().contains('Error')) {
                          return const Center(
                            child: Text('حدث خطأ في تحميل البيانات'),
                          );
                        }

                        if (!cubit.getPlansLoader) {
                          final subscribeDays = _getSubscribeDays();

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
                        final lessonDuration = _getLessonDuration();
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
                        return SizedBox(
                          width: 343.w,
                          height: 48.h,
                          child: const ShimmerWidget(),
                        );
                      }
                      return CustomizedDropdownWidget(
                        hintText: "عدد الحصص أسبوعيا",
                        validator: (val) =>
                            val == null ? "من فضلك اختر الحصص" : null,
                        items: _getNumberOfSessionPerWeek()
                            ?.map(
                              (e) => DropdownMenuItem(
                                value: e,
                                child: Text(e),
                              ),
                            )
                            .toList(),
                        onChanged: (val) {
                          log("this is programId ${widget.programId.toString()}");
                          cubit.filterPlans(
                              programId: widget.programId, context: context);
                        },
                      );
                    },
                  ),
                  16.ph,
                  GestureDetector(
                    onTap: () async {
                      DateTime? selectedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2030),
                        locale: const Locale('ar', 'SA'),
                        builder: (context, child) {
                          return Theme(
                            data: Theme.of(context).copyWith(
                              colorScheme: const ColorScheme.light(
                                primary: Colors.blue,
                                onPrimary: Colors.white,
                                onSurface: Colors.black,
                              ),
                            ),
                            child: child!,
                          );
                        },
                      );

                      if (selectedDate != null) {
                        cubit.updateStartDate(selectedDate);
                      }
                    },
                    child: TitledFormFieldItem(
                      titleText: "تاريخ البدء",
                      iconWidget: 0.ph,
                      formfieldHintText: "12-5-2025",
                      controller: cubit.startDate,
                      validator: customValidation,
                      enabled: false,
                    ),
                  ),
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
                    crossAxisAlignment: CrossAxisAlignment.end,
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
                      8.pw,
                      CustomElevatedButton(
                        radius: 16.r,
                        height: 58.h,
                        borderColor: MainColors.blueTextColor,
                        textColor: MainColors.blueTextColor,
                        text: "تأكيد",
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
                      ),
                    ],
                  ),
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
                  arguments: {
                    "cubit": cubit,
                    "itemId": widget.programId,
                  },
                  context,
                  widget.isUpgrade
                      ? RoutePaths.generalCompleteUpgradePaymentProcessScreen
                      : RoutePaths.completePaymentProcessScreen,
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

  // Helper methods لاستخراج البيانات من الـ Entity المختلف
  List<String>? _getSubscribeDays() {
    final entity = cubit.getPlansEntity;
    // تحقق من نوع الـ Entity وقم باستخراج البيانات المناسبة
    if (entity?.data != null) {
      return entity.data.subscripeDays;
    }
    return null;
  }

  List<String>? _getLessonDuration() {
    final entity = cubit.getPlansEntity;
    if (entity?.data != null) {
      return entity.data.duration;
    }
    return null;
  }

  List<String>? _getNumberOfSessionPerWeek() {
    final entity = cubit.getPlansEntity;
    if (entity?.data != null) {
      return entity.data.numberOfSessionPerWeek;
    }
    return null;
  }
}

var planIcons = [
  Assets.iconsLoadingSand,
  Assets.iconsSecurityTime,
  Assets.iconsCalender
];
