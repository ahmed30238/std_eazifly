import 'dart:developer';

import 'package:eazifly_student/data/models/order_and_subscribe/filter_plans_model.dart';
import 'package:eazifly_student/data/models/order_and_subscribe/get_plan_with_details_model.dart';
import 'package:eazifly_student/presentation/controller/program_subscription_plan/programsubscriptionplan_cubit.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class ConfirmPaymentView extends StatefulWidget {
  final int methodId;
  const ConfirmPaymentView({
    super.key,
    required this.methodId,
  });

  @override
  State<ConfirmPaymentView> createState() => _ConfirmPaymentViewState();
}

class _ConfirmPaymentViewState extends State<ConfirmPaymentView> {
  late ProgramsubscriptionplanCubit programsubscriptionplanCubit;
  @override
  void initState() {
    programsubscriptionplanCubit = ProgramsubscriptionplanCubit.get(context);
    programsubscriptionplanCubit.getPamyentMethodDetails(
      methodId: widget.methodId,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var lang = context.loc!;
    FilterPlansDataModel? orderData =
        programsubscriptionplanCubit.filterPlansEntity?.data;
    log(
      "this is plan id ${programsubscriptionplanCubit.planId}",
    );
    PlanDetailsModel? filteredOrderData = programsubscriptionplanCubit
        .getPlansWithDetailsEntity?.data
        ?.firstWhere(
            (element) => element.id == programsubscriptionplanCubit.planId,
            orElse: () => PlanDetailsModel());
    log("this is it ${filteredOrderData?.program}");
    return Scaffold(
      appBar: CustomAppBar(
        context,
        mainTitle: lang.confirmPaymentProcess,
        leadingText: "",
        isCenterTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(12.r),
            // margin: EdgeInsets.symmetric(horizontal: 16.w),
            width: double.infinity,
            height: 402.h,
            decoration: BoxDecoration(
              borderRadius: 12.cr,
              color: MainColors.veryLightGrayFormField,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  orderData?.program ?? filteredOrderData?.program ?? "",
                  style: MainTextStyle.boldTextStyle(
                    fontSize: 14,
                  ),
                ),
                12.ph,
                ProgramDetailsItem(
                  title: programDetailsTitles[0],
                  value:
                      "${orderData?.subscripeDays ?? filteredOrderData?.subscripeDays} يوم",
                ),
                ProgramDetailsItem(
                  title: programDetailsTitles[1],
                  value:
                      "${orderData?.duration ?? filteredOrderData?.duration} دقيقة",
                ),
                ProgramDetailsItem(
                  title: programDetailsTitles[2],
                  value:
                      "${programsubscriptionplanCubit.studentNumberController.text.isEmpty ? programsubscriptionplanCubit.studentCount.toString() : programsubscriptionplanCubit.studentNumberController.text} طالب",
                ),
                ProgramDetailsItem(
                  title: programDetailsTitles[3],
                  value:
                      "${orderData?.numberOfSessionPerWeek ?? filteredOrderData?.numberOfSessionPerWeek} حصة",
                ),
                ProgramDetailsItem(
                  title: programDetailsTitles[4],
                  value: programsubscriptionplanCubit.startDate.text,
                ),
                3.ph,
                 CustomHorizontalDivider(
                  color: MainColors.lightGray,
                ),
                ...List.generate(
                  3,
                  (index) {
                    String price =
                        orderData?.price ?? filteredOrderData?.price ?? "";
                    String discountPrice = orderData?.discountPrice ??
                        filteredOrderData?.discountPrice ??
                        "";
                    double priceValue = double.tryParse(price) ?? 0.0;
                    double discountPriceValue =
                        double.tryParse(discountPrice) ?? 0.0;
                    double discountValue = priceValue - discountPriceValue;

                    return ProgramDetailsItem(
                      title: cashDetailsTitles[index],
                      value: index == 0
                          ? price
                          : index == 1
                              ? discountValue.toInt().toString()
                              : orderData?.discountPrice ??
                                  filteredOrderData?.discountPrice ??
                                  "",
                      textStyle: index == 2
                          ? MainTextStyle.boldTextStyle(
                              fontSize: 15,
                              color: MainColors.blueTextColor,
                            )
                          : null,
                    );
                  },
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
              color: MainColors.checkBoxBorderGray,
            ),
          ),
          8.ph,
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
            height: 82.h,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: 12.cr,
              color: MainColors.veryLightGrayFormField,
            ),
            child: Row(
              children: [
                Container(
                  width: 24.w,
                  height: 24.h,
                  decoration:  BoxDecoration(
                    shape: BoxShape.circle,
                    color: MainColors.blueTextColor,
                  ),
                  child: Center(
                    child: Text(
                      "1",
                      style: MainTextStyle.boldTextStyle(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                16.pw,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        getPaymentInstructionText(
                          currency: orderData?.currency ?? "ج.م",
                          programsubscriptionplanCubit
                              .getPaymentMethodDetailsEntity?.data?.title,
                          double.tryParse(
                                orderData?.discountPrice ??
                                    filteredOrderData?.discountPrice ??
                                    "",
                              ) ??
                              0.0,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: MainTextStyle.boldTextStyle(
                          fontSize: 12,
                          color: MainColors.blackText,
                        ),
                      ),
                      8.ph,
                      Text(
                        programsubscriptionplanCubit
                                .getPaymentMethodDetailsEntity?.data?.payOn ??
                            'معلومات الدفع',
                        style: MainTextStyle.regularTextStyle(
                          fontSize: 10,
                          color: MainColors.grayTextColors,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          16.ph,
          GestureDetector(
            onTap: () => programsubscriptionplanCubit.pickImages(),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
              height: 98.h,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: 12.cr,
                color: MainColors.veryLightGrayFormField,
              ),
              child: BlocBuilder(
                bloc: programsubscriptionplanCubit,
                builder: (context, state) {
                  final images = programsubscriptionplanCubit.images;
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "2",
                        style: MainTextStyle.boldTextStyle(
                          fontSize: 12,
                          color: MainColors.blackText,
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
                              color: MainColors.blackText,
                            ),
                          ),
                          8.ph,
                          Container(
                            width: 68.w,
                            height: 34.h,
                            decoration: BoxDecoration(
                              color: MainColors.lightblue,
                              borderRadius: 16.cr,
                            ),
                            child: SvgPicture.asset(
                              Assets.iconsUploadImage,
                              fit: BoxFit.scaleDown,
                            ).center(),
                          ),
                        ],
                      ),
                      if (images.isNotEmpty) ...[
                        const Spacer(),
                        ClipRRect(
                          borderRadius: 16.cr,
                          child: Image.file(
                            images.first,
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
            // margin: EdgeInsets.symmetric(horizontal: 16.w),
            height: 166.63.h,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: 12.cr,
              color: MainColors.veryLightGrayFormField,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "مثال لطريقة التحويل",
                  style: MainTextStyle.boldTextStyle(
                    fontSize: 12,
                    color: MainColors.blackText,
                  ),
                ),
                8.ph,
                Text(
                  "قم بأخد سكرين شوت من المبلغ المحول كما في المثال ",
                  style: MainTextStyle.boldTextStyle(
                    fontSize: 12,
                    color: MainColors.checkBoxBorderGray,
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
            bloc: programsubscriptionplanCubit,
            builder: (context, state) => CustomElevatedButton(
              text: "إتمام الدفع",
              width: 343.w,
              onPressed: programsubscriptionplanCubit.createOrderLoader
                  ? () {}
                  : () async {
                      await programsubscriptionplanCubit.createOrder(
                        programId: programsubscriptionplanCubit.programId,
                        context: context,
                      );
                    },
              color: MainColors.blueTextColor,
              radius: 16.r,
              child: programsubscriptionplanCubit.createOrderLoader
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
                    color: MainColors.checkBoxBorderGray,
                  ),
            ),
            Text(
              value,
              style: textStyle ??
                  MainTextStyle.boldTextStyle(
                    fontSize: 12,
                    color: MainColors.checkBoxBorderGray,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

// دالة مساعدة لتنسيق نص تعليمات الدفع
String getPaymentInstructionText(String? paymentMethodTitle, double amount,
    {String? currency}) {
  final formattedAmount = "${amount.toStringAsFixed(0)} $currency";

  switch (paymentMethodTitle?.toLowerCase()) {
    case 'فودافون كاش':
    case 'vodafone cash':
      return "قم بتحويل مبلغ $formattedAmount عبر فودافون كاش";

    case 'انستاباي':
    case 'instapay':
      return "قم بالدفع بمبلغ $formattedAmount عبر انستاباي";

    case 'اورانج مني':
    case 'orange money':
      return "قم بتحويل مبلغ $formattedAmount عبر اورانج مني";

    case 'اتصالات كاش':
    case 'etisalat cash':
      return "قم بتحويل مبلغ $formattedAmount عبر اتصالات كاش";

    case 'فيزا':
    case 'visa':
    case 'ماستركارد':
    case 'mastercard':
      return "قم بالدفع بمبلغ $formattedAmount عبر البطاقة الائتمانية";

    case 'محفظة الكترونية':
    case 'e-wallet':
      return "قم بالدفع بمبلغ $formattedAmount عبر المحفظة الالكترونية";

    default:
      return "قم بدفع مبلغ $formattedAmount عبر ${paymentMethodTitle ?? 'طريقة الدفع المحددة'}";
  }
}
