import 'package:eazifly_student/core/component/custom_elevated_btn.dart';
import 'package:eazifly_student/core/component/custom_form_field.dart';
import 'package:eazifly_student/core/extensions/context.dart';
import 'package:eazifly_student/core/extensions/num_extentions.dart';
import 'package:eazifly_student/core/routes/paths.dart';
import 'package:eazifly_student/core/theme/colors/main_colors.dart';
import 'package:eazifly_student/core/theme/text_styles.dart/styles.dart';
import 'package:eazifly_student/presentation/controller/auth/forgot_password/forgot_password_cubit.dart';
import 'package:eazifly_student/presentation/controller/auth/forgot_password/forgot_password_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/service_locator/service_locator.dart';

class ResetPasswordScreen extends StatelessWidget {
  final String email;

  const ResetPasswordScreen({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    var lang = context.loc!; // استدعاء متغير الترجمة

    return BlocProvider(
      create: (context) => ForgotPasswordCubit(
        resetPasswordUsecase: sl(),
        forgotPasswordUsecase: sl(),
      ),
      child: BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
        listener: (context, state) {
          if (state is ResetPasswordSuccessState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  lang.passwordResetSuccess, // استخدام النص من الترجمة
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
            Navigator.pushNamedAndRemoveUntil(
              context,
              RoutePaths.loginPath,
                  (route) => false,
            );
          } else if (state is ResetPasswordErrorState) {
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
                lang.resetPassword, // استخدام النص من الترجمة
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
              decoration: BoxDecoration(
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
                key: cubit.resetFormKey,
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        padding: EdgeInsets.symmetric(horizontal: 24.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            32.ph,
                            // Header Section
                            Center(
                              child: Column(
                                children: [
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
                                      Icons.security_outlined,
                                      size: 40.sp,
                                      color: MainColors.primary,
                                    ),
                                  ),
                                  24.ph,
                                  Text(
                                    lang.resetPassword, // استخدام النص من الترجمة
                                    style: MainTextStyle.boldTextStyle(
                                      fontSize: 24,
                                      color: MainColors.onSecondary,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  12.ph,
                                  Text(
                                    "${lang.verificationCodeSentTo} $email", // استخدام النص من الترجمة
                                    style: MainTextStyle.mediumTextStyle(
                                      fontSize: 14,
                                      color: MainColors.onSurfaceSecondary,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                            40.ph,
                            // Email Field (Read Only)
                            Text(
                              lang.email, // استخدام النص من الترجمة
                              style: MainTextStyle.boldTextStyle(
                                fontSize: 14,
                                color: MainColors.onSecondary,
                              ),
                            ),
                            8.ph,
                            CustomTextFormField(
                              initialValue: email,
                              enabled: false,
                              hintText: email,
                              prefixIconWidget: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16.w),
                                child: Icon(
                                  Icons.email_outlined,
                                  color: MainColors.muted,
                                  size: 20.sp,
                                ),
                              ),
                            ),
                            24.ph,
                            // Verification Code Field
                            Text(
                              lang.verificationCode, // استخدام النص من الترجمة
                              style: MainTextStyle.boldTextStyle(
                                fontSize: 14,
                                color: MainColors.onSecondary,
                              ),
                            ),
                            8.ph,
                            CustomTextFormField(
                              controller: cubit.codeController,
                              hintText: lang.enterVerificationCode, // استخدام النص من الترجمة
                              keyboardType: TextInputType.number,
                              inputFormatter: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(6),
                              ],
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return lang.pleaseEnterVerificationCode; // استخدام النص من الترجمة
                                }
                                if (value.length < 4) {
                                  return lang.verificationCodeMinLength; // استخدام النص من الترجمة
                                }
                                return null;
                              },
                              prefixIconWidget: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16.w),
                                child: Icon(
                                  Icons.verified_user_outlined,
                                  color: MainColors.muted,
                                  size: 20.sp,
                                ),
                              ),
                            ),
                            24.ph,
                            // New Password Field
                            Text(
                              lang.newPassword, // استخدام النص من الترجمة
                              style: MainTextStyle.boldTextStyle(
                                fontSize: 14,
                                color: MainColors.onSecondary,
                              ),
                            ),
                            8.ph,
                            CustomTextFormField(
                              maxLines: 1,
                              controller: cubit.passwordController,
                              hintText: lang.enterNewPassword, // استخدام النص من الترجمة
                              isSecured: cubit.isNewPasswordVisible,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return lang.pleaseEnterNewPassword; // استخدام النص من الترجمة
                                }
                                if (value.length < 6) {
                                  return lang.passwordMinLength; // استخدام النص من الترجمة
                                }
                                return null;
                              },
                              prefixIconWidget: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16.w),
                                child: Icon(
                                  Icons.lock_outline,
                                  color: MainColors.muted,
                                  size: 20.sp,
                                ),
                              ),
                              suffixIconWidget: IconButton(
                                onPressed: () =>
                                    cubit.changeNewPasswordVisibility(),
                                icon: Icon(
                                  cubit.isNewPasswordVisible
                                      ? Icons.visibility_off_outlined
                                      : Icons.visibility_outlined,
                                  color: MainColors.muted,
                                  size: 20.sp,
                                ),
                              ),
                            ),
                            24.ph,
                            // Confirm Password Field
                            Text(
                              lang.confirmPassword, // استخدام النص من الترجمة
                              style: MainTextStyle.boldTextStyle(
                                fontSize: 14,
                                color: MainColors.onSecondary,
                              ),
                            ),
                            8.ph,
                            CustomTextFormField(
                              maxLines: 1,
                              controller: cubit.passwordConfirmationController,
                              hintText: lang.confirmNewPassword, // استخدام النص من الترجمة
                              isSecured: cubit.isConfirmPasswordVisible,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return lang.pleaseConfirmPassword; // استخدام النص من الترجمة
                                }
                                if (value != cubit.passwordController.text) {
                                  return lang.passwordsDoNotMatch; // استخدام النص من الترجمة
                                }
                                return null;
                              },
                              prefixIconWidget: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16.w),
                                child: Icon(
                                  Icons.lock_outline,
                                  color: MainColors.muted,
                                  size: 20.sp,
                                ),
                              ),
                              suffixIconWidget: IconButton(
                                onPressed: () =>
                                    cubit.changeConfirmPasswordVisibility(),
                                icon: Icon(
                                  cubit.isConfirmPasswordVisible
                                      ? Icons.visibility_off_outlined
                                      : Icons.visibility_outlined,
                                  color: MainColors.muted,
                                  size: 20.sp,
                                ),
                              ),
                            ),
                            32.ph,
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
                            text: lang.resetPassword, // استخدام النص من الترجمة
                            onPressed: cubit.resetPasswordLoader
                                ? () {}
                                : () {
                              if (cubit.resetFormKey.currentState!
                                  .validate()) {
                                cubit.resetPassword();
                              }
                            },
                            height: 52.h,
                            width: double.infinity,
                            color: MainColors.primary,
                            radius: 16.r,
                            child: cubit.resetPasswordLoader
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
                          16.ph,
                          TextButton(
                            onPressed: cubit.forgotPasswordLoader
                                ? null
                                : () {
                              cubit.forgetPassword();
                            },
                            child: Text(
                              cubit.forgotPasswordLoader
                                  ? lang.resendingCode // استخدام النص من الترجمة
                                  : lang.resendVerificationCode, // استخدام النص من الترجمة
                              style: MainTextStyle.mediumTextStyle(
                                fontSize: 14,
                                color: cubit.forgotPasswordLoader
                                    ? MainColors.muted
                                    : MainColors.primary,
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