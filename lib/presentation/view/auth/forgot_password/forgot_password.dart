import 'package:eazifly_student/core/component/custom_elevated_btn.dart';
import 'package:eazifly_student/core/component/custom_form_field.dart';
import 'package:eazifly_student/core/extensions/num_extentions.dart';
import 'package:eazifly_student/core/routes/paths.dart';
import 'package:eazifly_student/core/theme/colors/main_colors.dart';
import 'package:eazifly_student/core/theme/text_styles.dart/styles.dart';
import 'package:eazifly_student/presentation/controller/auth/forgot_password/forgot_password_cubit.dart';
import 'package:eazifly_student/presentation/controller/auth/forgot_password/forgot_password_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/service_locator/service_locator.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgotPasswordCubit(
        forgotPasswordUsecase: sl(),
        resetPasswordUsecase: sl(),
      ),
      child: BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
        listener: (context, state) {
          if (state is ForgotPasswordSuccessState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'تم إرسال رمز التحقق إلى بريدك الإلكتروني',
                  style: MainTextStyle.mediumTextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
                backgroundColor: MainColors.success,
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
            );
            Navigator.pushNamed(
              context,
              RoutePaths.resetPasswordView,
              arguments:
                  context.read<ForgotPasswordCubit>().emailController.text,
            );
          } else if (state is ForgotPasswordErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.errorMessage,
                  style: MainTextStyle.mediumTextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
                backgroundColor: MainColors.error,
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
            );
          }
        },
        builder: (context, state) {
          var cubit = context.read<ForgotPasswordCubit>();

          return Scaffold(
            backgroundColor: MainColors.background,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: MainColors.onSecondary,
                  size: 20.sp,
                ),
              ),
              title: Text(
                'نسيت كلمة السر',
                style: MainTextStyle.boldTextStyle(
                  fontSize: 18,
                  color: MainColors.onSecondary,
                ),
              ),
              centerTitle: true,
            ),
            body: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.centerRight,
                  colors: [
                    MainColors.primaryLight,
                    MainColors.surface,
                    MainColors.surfaceVariant,
                    MainColors.background,
                  ],
                ),
              ),
              child: Form(
                key: cubit.forgotPasswordFormKey,
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        padding: EdgeInsets.symmetric(horizontal: 24.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            60.ph,
                            // App Logo
                            Container(
                              padding: EdgeInsets.all(24.w),
                              decoration: BoxDecoration(
                                color: MainColors.surface2,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: MainColors.primary
                                        .withValues(alpha: 0.1),
                                    blurRadius: 20,
                                    offset: const Offset(0, 8),
                                  ),
                                ],
                              ),
                              child: Icon(
                                Icons.lock_reset_outlined,
                                size: 48.sp,
                                color: MainColors.primary,
                              ),
                            ),
                            32.ph,
                            Text(
                              "نسيت كلمة السر؟",
                              style: MainTextStyle.boldTextStyle(
                                fontSize: 28,
                                color: MainColors.onSecondary,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            16.ph,
                            Text(
                              "لا تقلق! أدخل بريدك الإلكتروني وسنرسل لك رمز التحقق لإعادة تعيين كلمة السر",
                              style: MainTextStyle.mediumTextStyle(
                                fontSize: 14,
                                color: MainColors.onSurfaceSecondary,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            48.ph,
                            Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                "البريد الإلكتروني",
                                style: MainTextStyle.boldTextStyle(
                                  fontSize: 14,
                                  color: MainColors.onSecondary,
                                ),
                              ),
                            ),
                            8.ph,
                            CustomTextFormField(
                              controller: cubit.emailController,
                              hintText: "example@gmail.com",
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'يرجى إدخال البريد الإلكتروني';
                                }
                                if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                    .hasMatch(value)) {
                                  return 'يرجى إدخال بريد إلكتروني صحيح';
                                }
                                return null;
                              },
                              prefixIconWidget: Icon(
                                Icons.email_outlined,
                                color: MainColors.muted,
                                size: 20.sp,
                              ),
                            ),
                            60.ph,
                          ],
                        ),
                      ),
                    ),
                    // Bottom Section
                    Padding(
                      padding: EdgeInsets.all(24.w),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CustomElevatedButton(
                            text: "إرسال رمز التحقق",
                            onPressed: cubit.forgotPasswordLoader
                                ? () {}
                                : () {
                                    if (cubit
                                        .forgotPasswordFormKey.currentState!
                                        .validate()) {
                                      cubit.forgetPassword(
                                        email:
                                            cubit.emailController.text.trim(),
                                      );
                                    }
                                  },
                            height: 52.h,
                            width: double.infinity,
                            color: MainColors.primary,
                            radius: 16.r,
                            child: cubit.forgotPasswordLoader
                                ? SizedBox(
                                    height: 20.h,
                                    width: 20.w,
                                    child: const CircularProgressIndicator(
                                      strokeWidth: 2,
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        Colors.white,
                                      ),
                                    ),
                                  )
                                : null,
                          ),
                          24.ph,
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text(
                              "العودة لتسجيل الدخول",
                              style: MainTextStyle.mediumTextStyle(
                                fontSize: 14,
                                color: MainColors.primary,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
