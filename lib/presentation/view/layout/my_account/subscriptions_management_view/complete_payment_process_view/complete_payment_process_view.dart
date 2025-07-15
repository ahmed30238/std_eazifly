import 'package:eazifly_student/presentation/controller/payment_controller/payment_cubit.dart';
import 'package:eazifly_student/presentation/controller/program_subscription_plan/programsubscriptionplan_cubit.dart';
import 'package:eazifly_student/presentation/view/layout/library/payment/complete_payment_process_view/complete_payment_process_view.dart';
import 'package:eazifly_student/presentation/view/layout/library/payment/complete_payment_process_view/widgets/payment_methods_loader.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class CompletePaymentProcessView extends StatefulWidget {
  final int itemId;
  // final bool isFromLibrary;
  const CompletePaymentProcessView({
    super.key,
    required this.itemId,
    // this.isFromLibrary = false,
  });

  @override
  State<CompletePaymentProcessView> createState() =>
      _CompletePaymentProcessViewState();
}

class _CompletePaymentProcessViewState
    extends State<CompletePaymentProcessView> {
  late PaymentCubit cubit;
  late ProgramsubscriptionplanCubit programsubscriptionplanCubit;

  @override
  void initState() {
    cubit = context.read<PaymentCubit>();
    programsubscriptionplanCubit = context.read<ProgramsubscriptionplanCubit>();
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
                  child: Text('No payment methods available'),
                );
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
                          RoutePaths.confirmPaymentView,
                          arguments: {
                            "cubit": programsubscriptionplanCubit,
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
