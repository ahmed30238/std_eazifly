import 'dart:developer';

import 'package:eazifly_student/core/component/custom_elevated_btn.dart';
import 'package:eazifly_student/core/component/custom_form_field.dart';
import 'package:eazifly_student/core/extensions/num_extentions.dart';
import 'package:eazifly_student/core/extensions/widgets_extensions.dart';
import 'package:eazifly_student/core/helper_methods/helper_methods.dart';
import 'package:eazifly_student/core/images/my_images.dart';
import 'package:eazifly_student/core/theme/colors/main_colors.dart';
import 'package:eazifly_student/core/theme/text_styles.dart/styles.dart';
import 'package:eazifly_student/presentation/controller/auth/login/login_cubit.dart';
import 'package:eazifly_student/presentation/controller/auth/login/login_state.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = LoginCubit.get(context);

    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) => Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.white,
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.centerRight,
              colors: [
                Color(0xffEAF0FD),
                Color(0xffEAF0FD),
                Color(0xffF8F8FA),
                Color(0xffF8F8FA),
              ],
            ),
          ),
          child: Form(
            key: cubit.formKey,
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        50.ph,
                        SafeArea(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Eazifly",
                                style: GoogleFonts.plusJakartaSans().copyWith(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 25.69.sp,
                                    color: const Color(0xff07070D)),
                              ),
                              9.pw,
                              SvgPicture.asset(Assets.iconsAppLogo),
                            ],
                          ),
                        ),
                        100.ph,
                        Text(
                          "مرحبًا بك !",
                          style: MainTextStyle.boldTextStyle(
                            fontSize: 24,
                            color: MainColors.blackText,
                          ),
                        ),
                        8.ph,
                        Text(
                          "رحلتك التعليمية تبدأ هنا.",
                          style: MainTextStyle.boldTextStyle(
                            fontSize: 12,
                            color: MainColors.grayTextColors,
                          ),
                        ),
                        40.ph,
                        Text(
                          "البريد الإلكتروني أو رقم الهاتف",
                          style: MainTextStyle.boldTextStyle(
                            fontSize: 12,
                            color: MainColors.blackText,
                          ),
                        ),
                        8.ph,
                        CustomTextFormField(
                          focusNode: cubit.emailFocusNode,
                          hintText: "مثال : ",
                          maxLines: 1,
                          controller: cubit.emailController,
                          onFieldSubmitted: (value) {
                            FocusScope.of(context)
                                .requestFocus(cubit.passwordFocusNode);
                          },
                          keyboardType: TextInputType.emailAddress,
                          validator: customValidation,
                        ),
                        24.ph,
                        Text(
                          "كلمة المرور",
                          style: MainTextStyle.boldTextStyle(
                            fontSize: 12,
                            color: MainColors.blackText,
                          ),
                        ),
                        8.ph,
                        BlocBuilder<LoginCubit, LoginState>(
                          builder: (context, state) {
                            return CustomTextFormField(
                              focusNode: cubit.passwordFocusNode,
                              isSecured: cubit.isVisible,
                              maxLines: 1,
                              enabled: !cubit.loginLoader,
                              onFieldSubmitted: (value) {
                                if (cubit.emailController.text.isNotEmpty &&
                                    cubit.passwordController.text.isNotEmpty) {
                                  cubit.tryToLogin(context);
                                } else {
                                  if (cubit.formKey.currentState!.validate()) {
                                    log("message");
                                  }
                                }
                              },
                              controller: cubit.passwordController,
                              hintText: "مثال : ",
                              suffixIconWidget: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 12.w,
                                  vertical: 12.h,
                                ),
                                child: InkWell(
                                  onTap: () => cubit.changeVisibility(),
                                  child: Icon(
                                    cubit.isVisible
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: Colors
                                        .grey, // يمكنك تغيير اللون حسب احتياجاتك
                                  ),
                                ),
                              ),
                              validator: customValidation,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                // الزرار والنص في أسفل الشاشة
                Padding(
                  padding: EdgeInsets.all(16.w),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomElevatedButton(
                        text: "بدأ الإستخدام",
                        onPressed: cubit.loginLoader
                            ? () {}
                            : () {
                                cubit.tryToLogin(context);
                              },
                        height: 48.h,
                        width: 343.w,
                        color: MainColors.blueTextColor,
                        radius: 16.r,
                        child: cubit.loginLoader
                            ? const CircularProgressIndicator.adaptive().center()
                            : null,
                      ),
                      24.ph,
                      Center(
                        child: RichText(
                          text: TextSpan(
                            text: "ليس لديك حساب..!  ",
                            style: MainTextStyle.mediumTextStyle(
                              color: MainColors.grayTextColors,
                              fontSize: 12,
                            ),
                            children: [
                              TextSpan(
                                text: "إنشاء حساب جديد",
                                style: MainTextStyle.boldTextStyle(
                                  fontSize: 12,
                                  color: MainColors.blueTextColor,
                                ),
                                recognizer: TapGestureRecognizer()..onTap = () {},
                              ),
                            ],
                          ),
                        ),
                      ),
                      24.ph,
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}