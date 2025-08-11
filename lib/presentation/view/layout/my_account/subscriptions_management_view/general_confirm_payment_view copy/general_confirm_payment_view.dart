import 'dart:developer';

import 'package:eazifly_student/data/models/order_and_subscribe/filter_plans_model.dart';
import 'package:eazifly_student/data/models/subscription_management/show_plan_model.dart';
import 'package:eazifly_student/presentation/controller/add_to_library_package_details_controller/addtolibrarypackagedetails_state.dart';
import 'package:eazifly_student/presentation/controller/my_account_controllers/subscriptionmanagement_cubit.dart';
import 'package:eazifly_student/presentation/view/layout/my_account/subscriptions_management_view/confirm_payment_view/confirm_payment_view.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class GeneralConfirmPaymentView extends StatefulWidget {
  final bool isUpgrade;
  final int methodId;
  const GeneralConfirmPaymentView({
    super.key,
    required this.methodId,
    required this.isUpgrade,
  });

  @override
  State<GeneralConfirmPaymentView> createState() =>
      _GeneralConfirmPaymentViewState();
}

class _GeneralConfirmPaymentViewState extends State<GeneralConfirmPaymentView> {
  late SubscriptionmanagementCubit subscriptionmanagementCubit;

  @override
  void initState() {
    subscriptionmanagementCubit = SubscriptionmanagementCubit.get(context);
    subscriptionmanagementCubit.getPamyentMethodDetails(
      methodId: widget.methodId,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    log("isUpgrade: ${widget.isUpgrade}");
    var lang = context.loc!;

    // تحديد البيانات المراد عرضها حسب isUpgrade
    ShowPlanDataModel? orderData =
        subscriptionmanagementCubit.planDetailsEntity?.data;
    FilterPlansDataModel? upgradeData =
        subscriptionmanagementCubit.filterPlansEntity?.data;

    // اختيار البيانات المناسبة
    dynamic currentData = widget.isUpgrade ? upgradeData : orderData;

    final int price = int.tryParse(currentData?.price ?? "0") ?? 0;
    final int discountPrice =
        int.tryParse(currentData?.discountPrice ?? "0") ?? 0;
    final int discountAmount = price - discountPrice;
    final String currency = currentData?.currency ?? "";

    final List<String> values = [
      "$price $currency",
      "$discountAmount $currency",
      "$discountPrice $currency",
    ];

    return Scaffold(
      appBar: CustomAppBar(
        context,
        mainTitle: lang.confirmPaymentProcess,
        leadingText: "",
        isCenterTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        children: [
          Container(
            padding: EdgeInsets.all(12.r),
            width: double.infinity,
            height: 402.h,
            decoration: BoxDecoration(
              borderRadius: 12.cr,
              color: MainColors.inputFill,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  currentData?.program ?? "",
                  style: MainTextStyle.boldTextStyle(
                    fontSize: 14,
                  ),
                ),
                12.ph,
                ProgramDetailsItem(
                  title: programDetailsTitles[0],
                  value: "${currentData?.subscripeDays} يوم",
                ),
                ProgramDetailsItem(
                  title: programDetailsTitles[1],
                  value:
                      "${currentData?.duration} ${(int.tryParse(currentData?.duration ?? "0") ?? 0) < 30 ? "ساعة" : "دقيقة"}",
                ),
                ProgramDetailsItem(
                  title: programDetailsTitles[2],
                  value: "${subscriptionmanagementCubit.studentNumber} طالب",
                ),
                ProgramDetailsItem(
                  title: programDetailsTitles[3],
                  value: "${currentData?.numberOfSessionPerWeek} حصص",
                ),
                ProgramDetailsItem(
                  title: programDetailsTitles[4],
                  value: "",
                ),
                3.ph,
                 CustomHorizontalDivider(
                  color: MainColors.surfaceVariant,
                ),
                ...List.generate(
                  3,
                  (index) => ProgramDetailsItem(
                    title: cashDetailsTitles[index],
                    value: values[index],
                    textStyle: index == 2
                        ? MainTextStyle.boldTextStyle(
                            fontSize: 15,
                            color: MainColors.primary,
                          )
                        : null,
                  ),
                ),
                4.ph,
              ],
            ),
          ),
          20.ph,
          Text(
            "طريقة التحويل",
            style: MainTextStyle.boldTextStyle(
              fontSize: 12,
              color: MainColors.borderPrimary,
            ),
          ),
          8.ph,
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
            height: 82.h,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: 12.cr,
              color: MainColors.inputFill,
            ),
            child: Row(
              children: [
                Text(
                  "1",
                  style: MainTextStyle.boldTextStyle(
                    fontSize: 12,
                    color: MainColors.onSecondary,
                  ),
                ),
                20.pw,
                BlocBuilder(
                  bloc: subscriptionmanagementCubit,
                  builder: (context, state) {
                    // Handle loading state
                    if (subscriptionmanagementCubit
                        .getPaymentMethodDetailsLoader) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    // Handle error state
                    if (state is GetProgramPaymentMethodDetailsErrorState) {
                      return Center(
                        child: Text(
                          'Error: ${state.errorMessage}',
                          style: MainTextStyle.boldTextStyle(
                            fontSize: 12,
                            color: Colors.red,
                          ),
                        ),
                      );
                    }

                    // Handle success/loaded state
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          getPaymentInstructionText(
                            subscriptionmanagementCubit
                                    .getPaymentMethodDetailsEntity
                                    ?.data
                                    ?.title ??
                                "",
                            double.tryParse(
                                    currentData?.discountPrice ?? "0.0") ??
                                0.0,
                            currency: currency,
                          ),
                          style: MainTextStyle.boldTextStyle(
                            fontSize: 12,
                            color: MainColors.onSecondary,
                          ),
                        ),
                        8.ph,
                        Text(
                          "${subscriptionmanagementCubit.getPaymentMethodDetailsEntity?.data?.payOn}",
                          style: MainTextStyle.boldTextStyle(
                            fontSize: 12,
                            color: MainColors.onSecondary,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
          16.ph,
          GestureDetector(
            onTap: () {
              log("tapped");
              widget.isUpgrade
                  ? subscriptionmanagementCubit
                      .pickupgradeOrderImageFroGallery()
                  : subscriptionmanagementCubit.pickOrderImageFromGallery();
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
              height: 98.h,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: 12.cr,
                color: MainColors.inputFill,
              ),
              child: BlocBuilder(
                bloc: subscriptionmanagementCubit,
                builder: (context, state) {
                  final image = widget.isUpgrade
                      ? subscriptionmanagementCubit.upgradeOrderImage
                      : subscriptionmanagementCubit.renewOrderImage;
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "2",
                        style: MainTextStyle.boldTextStyle(
                          fontSize: 12,
                          color: MainColors.onSecondary,
                        ),
                      ),
                      20.pw,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "قم برفع صورة  التحويل هنا",
                            style: MainTextStyle.boldTextStyle(
                              fontSize: 12,
                              color: MainColors.onSecondary,
                            ),
                          ),
                          8.ph,
                          Container(
                            width: 68.w,
                            height: 34.h,
                            decoration: BoxDecoration(
                              color: MainColors.surface,
                              borderRadius: 16.cr,
                            ),
                            child: SvgPicture.asset(
                              Assets.iconsUploadImage,
                              fit: BoxFit.scaleDown,
                            ).center(),
                          ),
                        ],
                      ),
                      if (image != null) ...[
                        const Spacer(),
                        ClipRRect(
                          borderRadius: 16.cr,
                          child: Image.file(
                            image,
                            height: 84.h,
                            width: 104.w,
                            fit: BoxFit.cover,
                          ),
                        )
                      ]
                    ],
                  );
                },
              ),
            ),
          ),
          16.ph,
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
            height: 166.63.h,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: 12.cr,
              color: MainColors.inputFill,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "مثال لطريقة التحويل",
                  style: MainTextStyle.boldTextStyle(
                    fontSize: 12,
                    color: MainColors.onSecondary,
                  ),
                ),
                8.ph,
                Text(
                  "قم بأخد سكرين شوت من المبلغ المحول كما في المثال ",
                  style: MainTextStyle.boldTextStyle(
                    fontSize: 12,
                    color: MainColors.borderPrimary,
                  ),
                ),
                4.ph,
                Align(
                  alignment: Alignment.center,
                  child: SvgPicture.asset(
                    Assets.iconsAboutAppIcon,
                    height: 60.h,
                    width: 60.w,
                  ),
                ), // todo replace with its icon
              ],
            ),
          ),
          28.37.ph,
          BlocBuilder(
            bloc: subscriptionmanagementCubit,
            builder: (context, state) => CustomElevatedButton(
              text: "إتمام الدفع",
              width: 343.w,
              onPressed: subscriptionmanagementCubit.renewSubscriptionLoader
                  ? () {}
                  : () async {
                      if (subscriptionmanagementCubit.renewOrderImage == null &&
                          subscriptionmanagementCubit.upgradeOrderImage == null) {
                        delightfulToast(
                          message: "يجب رفع صورة التحويل",
                          context: context,
                        );
                      } else {
                        if (widget.isUpgrade) {
                          // تغيير الباقة

                          await subscriptionmanagementCubit.upgradeOrder(
                            context: context,
                            programId: subscriptionmanagementCubit.programId,
                          );
                        } else {
                          await subscriptionmanagementCubit.renewSubscription(
                            programId: subscriptionmanagementCubit.programId,
                          );
                        }
                      }
                    },
              color: MainColors.primary,
              radius: 16.r,
              child: subscriptionmanagementCubit.renewSubscriptionLoader
                  ? const CircularProgressIndicator.adaptive()
                  : null,
            ),
          ),
          32.ph,
        ],
      ),
    );
  }
}

var programDetailsTitles = [
  "خطة اللإشتراك",
  "مدة الدرس",
  "عدد الطلاب",
  "عدد الحصص الإسبوعية",
  "تاريخ البدء",
];
var cashDetailsTitles = [
  "المبلغ ",
  "الخصم",
  "الإجمالي",
];

class ProgramDetailsItem extends StatelessWidget {
  final TextStyle? textStyle;
  final String title;
  final String value;
  const ProgramDetailsItem({
    required this.title,
    required this.value,
    this.textStyle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: textStyle ??
                  MainTextStyle.boldTextStyle(
                    fontSize: 12,
                    color: MainColors.borderPrimary,
                  ),
            ),
            Text(
              value,
              style: textStyle ??
                  MainTextStyle.boldTextStyle(
                    fontSize: 12,
                    color: MainColors.borderPrimary,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
