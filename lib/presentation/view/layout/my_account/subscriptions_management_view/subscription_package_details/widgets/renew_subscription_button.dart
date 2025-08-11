import 'package:eazifly_student/presentation/controller/my_account_controllers/subscriptionmanagement_cubit.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class RenewSubscriptionButton extends StatelessWidget {
  RenewSubscriptionButton({
    super.key,
  });
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var cubit = context.read<SubscriptionmanagementCubit>();
    return CustomElevatedButton(
      text: "جدد الإشتراك الأن",
      height: 48.h,
      color: MainColors.primary,
      width: 343.w,
      radius: 16.r,
      onPressed: () {
        showModalSheet(
          maxHeight: 160.h,
          minHeight: 159.h,
          isFixedSize: true,
          context,
          widget: BlocProvider.value(
            value: cubit,
            child: CustomBottomSheetDesign(
              height: 159.h,
              widget: Column(
                children: [
                  24.ph,
                  Text(
                    "هل لديك كوبون خصم ؟",
                    style: MainTextStyle.boldTextStyle(fontSize: 14),
                  ),
                  24.ph,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomElevatedButton(
                        text: "نعم",
                        onPressed: () {
                          back(context);
                          showModalSheet(
                            maxHeight: 160.h,
                            minHeight: 159.h,
                            isFixedSize: true,
                            context,
                            widget: CustomBottomSheetDesign(
                              height: 159.h,
                              widget: Form(
                                key: _formKey,
                                child: Column(
                                  children: [
                                    24.ph,
                                    Text(
                                      "أدخل الكوبون من فضلك",
                                      style: MainTextStyle.boldTextStyle(
                                          fontSize: 14),
                                    ),
                                    24.ph,
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 16.w),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: SizedBox(
                                              width: 244.w,
                                              child: CustomTextFormField(
                                                hintText: "Kid 2025",
                                                validator: customValidation,
                                                controller:
                                                    cubit.codeController,
                                              ),
                                            ),
                                          ),
                                          24.pw,
                                          CustomElevatedButton(
                                            text: "التالي",
                                            onPressed: () {
                                              if (_formKey.currentState!
                                                  .validate()) {
                                                Navigator.pushNamed(
                                                  arguments: {
                                                    "cubit": cubit,
                                                    "itemId": 1, //TODO
                                                  },
                                                  context,
                                                  RoutePaths
                                                      .generalCompletePaymentProcessScreen,
                                                );
                                              }
                                            },
                                            height: 40.h,
                                            width: 120.w,
                                            color: MainColors.primary,
                                            radius: 8.r,
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        height: 40.h,
                        width: 120.w,
                        color: MainColors.primary,
                        radius: 8.r,
                      ),
                      24.pw,
                      CustomElevatedButton(
                        text: "لا",
                        onPressed: () {
                          Navigator.pushNamed(
                            arguments: {
                              "cubit": cubit,
                              "itemId": 1, //TODO
                            },
                            context,
                            RoutePaths.generalCompletePaymentProcessScreen,
                          );
                        },
                        height: 40.h,
                        width: 120.w,
                        color: MainColors.primary,
                        radius: 8.r,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
