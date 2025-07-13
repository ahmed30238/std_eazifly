import 'dart:developer';

import 'package:eazifly_student/data/models/library/plans/get_library_plans_model.dart';
import 'package:eazifly_student/presentation/controller/add_to_library_package_details_controller/addtolibrarypackagedetails_cubit.dart';
import 'package:eazifly_student/presentation/view/layout/my_account/subscriptions_management_view/confirm_payment_view/confirm_payment_view.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class ConfirmLibraryPaymentView extends StatefulWidget {
  final int methodId;
  const ConfirmLibraryPaymentView({
    super.key,
    required this.methodId,
  });

  @override
  State<ConfirmLibraryPaymentView> createState() => _ConfirmPaymentViewState();
}

class _ConfirmPaymentViewState extends State<ConfirmLibraryPaymentView> {
  late AddtolibrarypackagedetailsCubit libraryCubit;
  @override
  void initState() {
    libraryCubit = context.read<AddtolibrarypackagedetailsCubit>();
    libraryCubit.getPaymentMethodDetails(
      methodId: widget.methodId,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var lang = context.loc!;
    log("${libraryCubit.planId} plan id and ${libraryCubit.getLibraryPlansEntity?.data?.first.id} and found ");
    var orderDetail = libraryCubit.getLibraryPlansEntity?.data?.firstWhere(
      (element) => element.id == libraryCubit.planId,
      orElse: () => LibraryPlanModel(), // في حالة عدم وجود العنصر
    );
    // var orderData = libraryCubit.getLibraryPlansEntity?.data;
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
            constraints: BoxConstraints(
              minHeight: 200.h,
            ),
            decoration: BoxDecoration(
              borderRadius: 12.cr,
              color: MainColors.veryLightGrayFormField,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  orderDetail?.title ?? "",
                  style: MainTextStyle.boldTextStyle(
                    fontSize: 14,
                  ),
                ),
                12.ph,
                Text(
                  orderDetail?.description ?? "",
                  style: MainTextStyle.boldTextStyle(
                    fontSize: 14,
                  ),
                ),
                3.ph,
                const CustomHorizontalDivider(
                  color: MainColors.lightGray,
                ),
                ...List.generate(
                  3,
                  (index) => ProgramDetailsItem(
                    title: cashDetailsTitles[index],
                    value: index == 0
                        ? orderDetail?.price.toString() ?? ""
                        : index == 1
                            ? "0"
                            : orderDetail?.price.toString() ?? "",
                    textStyle: index == 2
                        ? MainTextStyle.boldTextStyle(
                            fontSize: 15,
                            color: MainColors.blueTextColor,
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
              color: MainColors.checkBoxBorderGray,
            ),
          ),
          8.ph,
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
            // margin: EdgeInsets.symmetric(horizontal: 16.w),
            height: 82.h,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: 12.cr,
              color: MainColors.veryLightGrayFormField,
            ),
            child: Row(
              children: [
                Text(
                  "1",
                  style: MainTextStyle.boldTextStyle(
                    fontSize: 12,
                    color: MainColors.blackText,
                  ),
                ),
                20.pw,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      getPaymentInstructionText(
                          libraryCubit
                                  .getPaymentMethodDetailsEntity?.data?.title ??
                              "",
                          orderDetail?.price?.toDouble() ?? 0.0),
                      style: MainTextStyle.boldTextStyle(
                        fontSize: 12,
                        color: MainColors.blackText,
                      ),
                    ),
                    8.ph,
                    Text(
                      libraryCubit.getPaymentMethodDetailsEntity?.data?.payOn ??
                          "",
                      style: MainTextStyle.boldTextStyle(
                        fontSize: 12,
                        color: MainColors.blackText,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          16.ph,
          GestureDetector(
            onTap: () => libraryCubit.pickOrderImageFromGallery(),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
              margin: EdgeInsets.symmetric(horizontal: 16.w),
              height: 98.h,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: 12.cr,
                color: MainColors.veryLightGrayFormField,
              ),
              child: BlocBuilder(
                bloc: libraryCubit,
                builder: (context, state) {
                  final image = libraryCubit.libraryOrderImage;
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
            bloc: libraryCubit,
            builder: (context, state) => CustomElevatedButton(
              // onPressed: () {},
              text: "إتمام الدفع",
              width: 343.w,
              onPressed: libraryCubit.libraryOrderAndSubscriptionLoader
                  ? () {}
                  : () async {
                      if (libraryCubit.libraryOrderImage == null) {
                        delightfulToast(
                          context: context,
                          message: "الرجاء رفع صورة التحويل",
                        );
                        return;
                      }
                      await libraryCubit.libraryOrderAndSubscription(
                        context: context,
                        // programId: libraryCubit.programId,
                        // context: context,
                      );
                    },
              color: MainColors.blueTextColor,
              radius: 16.r,
              child: libraryCubit.libraryOrderAndSubscriptionLoader
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
