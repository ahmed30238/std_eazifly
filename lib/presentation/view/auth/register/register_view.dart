import 'dart:developer';

import 'package:eazifly_student/core/component/custom_drop_down.dart';
import 'package:eazifly_student/core/component/titled_form_field.dart';
import 'package:eazifly_student/presentation/controller/auth/register/register_cubit.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

import '../../../controller/auth/register/register_state.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  late RegisterCubit cubit;

  @override
  void initState() {
    cubit = context.read<RegisterCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        context,
        onLeadinTap: () => Navigator.pop(context),
        mainTitle: "إنشاء حساب جديد",
        leadingText: "العودة",
        isCenterTitle: true,
        leadingIcon: Icons.arrow_back_ios,
      ),
      body: Column(
        children: [
          Expanded(
            child: Form(
              key: cubit.formKey,
              child: ListView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                children: [
                  24.ph,

                  // صورة البروفايل (اختيارية)
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        // يمكنك إضافة منطق اختيار الصورة هنا
                        log("تم النقر على الصورة");
                      },
                      child: Container(
                        width: 100.w,
                        height: 100.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: MainColors.primary,
                            width: 2.w,
                          ),
                          color: Colors.grey.shade100,
                        ),
                        child: Icon(
                          Icons.person_add,
                          size: 40.sp,
                          color: MainColors.primary,
                        ),
                      ),
                    ),
                  ),

                  32.ph,

                  // الاسم الأول
                  TitledFormFieldItem(
                    controller: cubit.firstNameController,
                    validator: (value) =>
                        cubit.validateField(value, "الاسم الأول"),
                    formfieldHintText: "مصطفى",
                    titleText: "الاسم الأول *",
                    iconWidget: 0.ph,
                  ),
                  16.ph,

                  // الاسم الأخير
                  TitledFormFieldItem(
                    titleText: "الاسم الأخير *",
                    validator: (value) =>
                        cubit.validateField(value, "الاسم الأخير"),
                    formfieldHintText: "سلامة",
                    controller: cubit.lastNameController,
                    iconWidget: 0.ph,
                  ),
                  16.ph,

                  // البريد الإلكتروني
                  TitledFormFieldItem(
                    titleText: "البريد الإلكتروني *",
                    formfieldHintText: "example@email.com",
                    controller: cubit.emailController,
                    validator: (value) => cubit.validateField(
                        value, "البريد الإلكتروني",
                        isEmail: true),
                    iconWidget: 0.ph,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  16.ph,

                  // رقم الهاتف
                  TitledFormFieldItem(
                    titleText: "رقم الهاتف *",
                    controller: cubit.phoneController,
                    validator: (value) {
                      // الهاتف اختياري، لكن إذا تم إدخاله يجب أن يكون صحيحاً
                      if (value != null && value.isNotEmpty) {
                        if (value.length < 10) {
                          return "رقم الهاتف غير صحيح";
                        }
                      }
                      return null;
                    },
                    formfieldHintText: "01012345678",
                    iconWidget: 0.ph,
                    keyboardType: TextInputType.phone,
                  ),
                  16.ph,
                  TitledFormFieldItem(
                    titleText: "رقم واتساب *",
                    controller: cubit.whatsAppController,
                    validator: (value) {
                      if (value != null && value.isNotEmpty) {
                        if (value.length < 10) {
                          return "رقم واتساب غير صحيح";
                        }
                      }
                      return null;
                    },
                    formfieldHintText: "01012345678",
                    iconWidget: 0.ph,
                    keyboardType: TextInputType.phone,
                  ),
                  16.ph,
                  TitledFormFieldItem(
                    titleText: "اسم المستخدم *",
                    formfieldHintText: "username123",
                    controller: cubit.userNameController,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "اسم المستخدم مطلوب";
                      }
                      if (value.length < 3) {
                        return "اسم المستخدم يجب أن يكون 3 أحرف على الأقل";
                      }
                      return null;
                    },
                    iconWidget: 0.ph,
                  ),
                  16.ph,

                  // النوع
                  Text(
                    "النوع *",
                    style: MainTextStyle.boldTextStyle(
                      fontSize: 14,
                      color: MainColors.onSecondary,
                    ),
                  ),
                  8.ph,
                  BlocBuilder<RegisterCubit, RegisterState>(
                    buildWhen: (previous, current) =>
                        current is GenderChangedState,
                    builder: (context, state) {
                      return CustomizedDropdownWidget<String>(
                        initialValue: cubit.selectedGender,
                        onChanged: (val) {
                          if (val != null) {
                            cubit.changeGender(val);
                            log("Selected gender: $val");
                          }
                        },
                        hintText: "اختر النوع",
                        items: [
                          DropdownMenuItem<String>(
                            value: "male",
                            child: Text(
                              "ذكر",
                              style: MainTextStyle.boldTextStyle(fontSize: 14),
                            ),
                          ),
                          DropdownMenuItem<String>(
                            value: "female",
                            child: Text(
                              "أنثى",
                              style: MainTextStyle.boldTextStyle(fontSize: 14),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  16.ph,

                  // كلمة المرور
                  TitledFormFieldItem(
                    titleText: "كلمة المرور *",
                    formfieldHintText: "••••••••",
                    controller: cubit.passwordController,
                    validator: (value) => cubit.validatePassword(value),
                    iconWidget: 0.ph,
                    maxLines: 1,
                    isPassword: true,
                  ),
                  16.ph,

                  // تأكيد كلمة المرور
                  TitledFormFieldItem(
                    maxLines: 1,
                    titleText: "تأكيد كلمة المرور *",
                    formfieldHintText: "••••••••",
                    controller: cubit.passwordConfirmationController,
                    validator: (value) =>
                        cubit.validatePasswordConfirmation(value),
                    iconWidget: 0.ph,
                    isPassword: true,
                  ),
                  16.ph,
                ],
              ),
            ),
          ),

          // أزرار التحكم
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              children: [
                // زر التسجيل
                BlocBuilder<RegisterCubit, RegisterState>(
                  buildWhen: (previous, current) =>
                      current is RegisterLoadingState ||
                      current is RegisterSuccessState ||
                      current is RegisterFailedState,
                  builder: (context, state) {
                    final isLoading = state is RegisterLoadingState;

                    return CustomElevatedButton(
                      text: "إنشاء الحساب",
                      onPressed: isLoading
                          ? () {}
                          : () {
                              // إخفاء لوحة المفاتيح
                              FocusScope.of(context).unfocus();

                              // بدء عملية التسجيل
                              cubit.register(context);
                            },
                      color: MainColors.primary,
                      radius: 16.r,
                      height: 48.h,
                      width: double.infinity,
                      child: isLoading
                          ? SizedBox(
                              width: 20.w,
                              height: 20.h,
                              child: const CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 2,
                              ),
                            )
                          : null,
                    );
                  },
                ),
                16.ph,

                // زر التسجيل مع إعادة المحاولة (للحالات الخاصة)
                BlocBuilder<RegisterCubit, RegisterState>(
                  buildWhen: (previous, current) =>
                      current is RegisterFailedState,
                  builder: (context, state) {
                    if (state is RegisterFailedState) {
                      return Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(12.w),
                            decoration: BoxDecoration(
                              color: Colors.red.shade50,
                              borderRadius: BorderRadius.circular(8.r),
                              border: Border.all(color: Colors.red.shade200),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.error_outline,
                                  color: Colors.red.shade600,
                                  size: 16.sp,
                                ),
                                8.pw,
                                Expanded(
                                  child: Text(
                                    state.message,
                                    style: MainTextStyle.regularTextStyle(
                                      fontSize: 12,
                                      color: Colors.red.shade600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          12.ph,
                          CustomElevatedButton(
                            text: "إعادة المحاولة",
                            onPressed: () {
                              cubit.registerWithRetry(context);
                            },
                            color: Colors.orange,
                            radius: 16.r,
                            height: 40.h,
                            width: double.infinity,
                          ),
                          8.ph,
                        ],
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),

                // رابط تسجيل الدخول
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "هل لديك حساب بالفعل؟ ",
                      style: MainTextStyle.regularTextStyle(
                        fontSize: 14,
                        color: MainColors.onPrimary,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                          context,
                          RoutePaths.loginPath,
                        );
                      },
                      child: Text(
                        "تسجيل الدخول",
                        style: MainTextStyle.boldTextStyle(
                          fontSize: 14,
                          color: MainColors.primary,
                        ),
                      ),
                    ),
                  ],
                ),
                32.ph,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
