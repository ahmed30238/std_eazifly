import 'package:eazifly_student/core/component/avatar_image.dart';
import 'package:eazifly_student/presentation/controller/my_account_controllers/subscriptionmanagement_cubit.dart';
import 'package:eazifly_student/presentation/controller/payment_controller/payment_cubit.dart';
import 'package:eazifly_student/presentation/view/layout/library/payment/complete_payment_process_view/widgets/payment_methods_loader.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class GeneralCompletePaymentProcessView extends StatefulWidget {
  final bool isUpgrade;
  final int itemId;
  const GeneralCompletePaymentProcessView({
    super.key,
    required this.itemId,
    required this.isUpgrade,
  });

  @override
  State<GeneralCompletePaymentProcessView> createState() =>
      _GeneralCompletePaymentProcessViewState();
}

class _GeneralCompletePaymentProcessViewState
    extends State<GeneralCompletePaymentProcessView> {
  late PaymentCubit cubit;
  late SubscriptionmanagementCubit subscriptionmanagementCubit;

  @override
  void initState() {
    cubit = context.read<PaymentCubit>();
    subscriptionmanagementCubit = context.read<SubscriptionmanagementCubit>();
    cubit.getProgramPaymentMethod(
      programId: widget.itemId,
    );
    super.initState();
  }

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
            Assets.iconsCompletePaymentProcess,
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
          BlocBuilder(
            bloc: cubit,
            builder: (context, state) {
              // Handle different states
              if (cubit.getProgramPaymentMethodLoader) {
                return const PaymentMethodsLoader();
              }

              if (state is GetProgramPaymentMethodErrorState) {
                return Center(child: Text('Error: ${state.errorMessage}'));
              }

              // Success state
              var paymentMethodsList =
                  cubit.getProgramPaymentMethodsEntity?.data;

              if (paymentMethodsList == null || paymentMethodsList.isEmpty) {
                return const Center(
                    child: Text('No payment methods available'));
              }

              return Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    var method = paymentMethodsList[index];
                    return PaymentMethodContainer(
                      icon: method.image ?? "",
                      title: method.title ?? "",
                      description: method.description ?? "",
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          widget.isUpgrade
                              ? RoutePaths.generalConfirmUpgradePaymentView
                              : RoutePaths.generalConfirmPaymentView,
                          arguments: {
                            "cubit": subscriptionmanagementCubit,
                            "methodId": method.id ?? 0
                          },
                        );
                      },
                    );
                  },
                  separatorBuilder: (context, index) => 20.ph,
                  itemCount: paymentMethodsList.length,
                ),
              );
            },
          )
        ],
      ),
    );
  }
}

class PaymentMethodContainer extends StatelessWidget {
  final String? icon;
  final String title;
  final String description;
  final VoidCallback onTap;

  const PaymentMethodContainer({
    super.key,
    required this.icon,
    required this.onTap,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    Widget? iconWidget;
    if (icon != null && icon!.isNotEmpty) {
      iconWidget = AvatarImage(
        height: 32.h,
        width: 32.w,
        imageUrl: icon,
      );
    }

    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.w),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        height: 119.h,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: 16.cr,
          border: Border.all(color: MainColors.lightGray),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (iconWidget != null) iconWidget,
            if (iconWidget != null) 12.pw,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: MainTextStyle.boldTextStyle(fontSize: 15),
                  ),
                  4.ph,
                  Text(
                    description,
                    style: MainTextStyle.boldTextStyle(
                      fontSize: 12,
                      color: MainColors.grayTextColors,
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
