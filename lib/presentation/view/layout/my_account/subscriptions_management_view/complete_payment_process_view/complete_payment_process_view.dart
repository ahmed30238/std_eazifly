import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class CompletePaymentProcessView extends StatelessWidget {
  const CompletePaymentProcessView({super.key});

  @override
  Widget build(BuildContext context) {
    var lang = context.loc!;
    return Scaffold(
      appBar: CustomAppBar(
        context,
        mainTitle: lang.completePaymentProcess,
        leadingText: "",
        isCenterTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          16.ph,
          SvgPicture.asset(
            MyImages.iconsCompletePaymentProcess,
          ),
          24.ph,
          Text(
            "أختر عملية الدفع الأسهل بالنسبك اليك",
            style: MainTextStyle.boldTextStyle(
              fontSize: 14,
              color: MainColors.blueTextColor,
            ),
          ),
          24.ph,
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) => PaymentMethodContainer(
                icon: paymentMethodContainerModel[index].icon,
                title: paymentMethodContainerModel[index].title,
                onTap: () {
                  Navigator.pushNamed(context, RoutePaths.confirmPaymentView);
                },
              ),
              separatorBuilder: (context, index) => 20.ph,
              itemCount: 3,
            ),
          ),
         
        ],
      ),
    );
  }
}
class PaymentMethodContainerModel {
  final String icon;
  final String title;
  const PaymentMethodContainerModel({
    required this.icon,
    required this.title,
  });
} 

var paymentMethodContainerModel = [
  const PaymentMethodContainerModel(
    icon: MyImages.iconsInstantPayment,
    title: "دفع لحظي"
  ),
  const PaymentMethodContainerModel(
    icon: MyImages.iconsElectronicWallet,
    title: "محفظة الكترونية",
  ),
  const PaymentMethodContainerModel(
    icon: MyImages.iconsInstapay,
    title: "تطبيق انستا باي",
  ),
];

class PaymentMethodContainer extends StatelessWidget {
  final String icon;
  final String title;
  final VoidCallback onTap;
  const PaymentMethodContainer({
    super.key,
    required this.icon,
    required this.onTap,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.w),
        padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 16.h),
        height: 119.h,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: 16.cr,
          border: Border.all(color: MainColors.lightGray),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           icon.endsWith("png")? Image.asset(icon): SvgPicture.asset(icon),
            12.pw,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: MainTextStyle.boldTextStyle(
                      fontSize: 15,
                    ),
                  ),
                  4.ph,
                  Text(
                    "مثال :هذا النص هو جزء من عملية تحسين تجربة المستخدم من خلال النص. مثال :هذا النص هو جزء من عملية تحسين ",
                    style: MainTextStyle.boldTextStyle(
                      fontSize: 12,
                      color: MainColors.grayTextColors
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
