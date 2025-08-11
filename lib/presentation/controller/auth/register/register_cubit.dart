import 'dart:convert';
import 'dart:developer';

import 'package:eazifly_student/domain/entities/auth/register_entities.dart';
import 'package:eazifly_student/domain/use_cases/register_usecase.dart';
import 'package:eazifly_student/presentation/controller/auth/register/register_state.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../core/enums/storage_enum.dart';
import '../../../../core/fire_base_helper/firebase_notifiction.dart';
import '../../../../core/network/handle_token.dart';
import '../../../../data/models/auth/register_tojson.dart';
import '../../layout/layout_cubit.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit({
    required this.registerUsecase,
  }) : super(RegisterInitial());

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController whatsAppController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordConfirmationController =
      TextEditingController();

  // متغير الجنس
  String selectedGender = "female"; // القيمة الافتراضية

  // Form Key للتحقق من صحة البيانات
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  RegisterEntity? registerEntity;
  RegisterUsecase registerUsecase;
  bool registerLoader = false;

  /// دالة تغيير الجنس
  void changeGender(String gender) {
    selectedGender = gender;
    emit(GenderChangedState(selectedGender));
  }

  /// دالة التحقق من تطابق كلمة المرور
  bool validatePasswordMatch() {
    return passwordController.text == passwordConfirmationController.text;
  }

  /// دالة التحقق من صحة البيانات
  String? validateField(String? value, String fieldName,
      {bool isEmail = false}) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName مطلوب';
    }

    if (isEmail) {
      final emailRegex = RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$');
      if (!emailRegex.hasMatch(value)) {
        return 'البريد الإلكتروني غير صالح';
      }
    }

    return null;
  }

  /// دالة التحقق من كلمة المرور
  String? validatePassword(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'كلمة المرور مطلوبة';
    }
    if (value.length < 6) {
      return 'كلمة المرور يجب أن تكون 6 أحرف على الأقل';
    }
    return null;
  }

  /// دالة التحقق من تأكيد كلمة المرور
  String? validatePasswordConfirmation(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'تأكيد كلمة المرور مطلوب';
    }
    if (value != passwordController.text) {
      return 'كلمة المرور غير متطابقة';
    }
    return null;
  }

  /// إنشاء UserRegistrationToJson من البيانات المدخلة
  RegisterToJson createRegistrationData() {
    return RegisterToJson(
      firstName: firstNameController.text.trim(),
      lastName: lastNameController.text.trim(),
      email: emailController.text.trim(),
      phone: phoneController.text.trim().isEmpty
          ? null
          : phoneController.text.trim(),
      whatsApp: whatsAppController.text.trim().isEmpty
          ? null
          : whatsAppController.text.trim(),
      gender: selectedGender,
      password: passwordController.text,
      userName: userNameController.text.trim(),
      passwordConfirmation: passwordConfirmationController.text,
    );
  }

  /// دالة التسجيل الرئيسية
  Future<void> register(BuildContext context) async {
    try {
      registerLoader = true;
      emit(RegisterLoadingState());

      // التحقق من صحة النموذج
      if (!formKey.currentState!.validate()) {
        registerLoader = false;
        emit(RegisterValidationErrorState("يرجى التحقق من البيانات المدخلة"));
        return;
      }

      // التحقق من تطابق كلمة المرور
      if (!validatePasswordMatch()) {
        registerLoader = false;
        emit(RegisterValidationErrorState("كلمة المرور غير متطابقة"));
        delightfulToast(
          message: "كلمة المرور غير متطابقة",
          context: context,
          toastColor: MainColors.red,
        );
        return;
      }

      log("📤 بدء عملية التسجيل...");

      // إنشاء بيانات التسجيل
      // final registrationData = createRegistrationData();

      // طباعة البيانات للفحص (في وضع التطوير فقط)
      // log("📄 بيانات التسجيل: ${registrationData.toJsonFiltered()}");

      // استدعاء Use Case
      final data = await registerUsecase.call(
        parameter: RegisterParameters(
          data: RegisterToJson(
            firstName: firstNameController.text.trim(),
            lastName: lastNameController.text.trim(),
            email: emailController.text.trim(),
            phone: phoneController.text.trim().isEmpty
                ? null
                : phoneController.text.trim(),
            whatsApp: whatsAppController.text.trim().isEmpty
                ? null
                : whatsAppController.text.trim(),
            gender: selectedGender,
            password: passwordController.text,
            userName: userNameController.text.trim(),
            passwordConfirmation: passwordConfirmationController.text,
          ),
        ),
      );

      // معالجة النتيجة
      data.fold(
        // في حالة الفشل
        (failure) {
          log("❌ فشل التسجيل: ${failure.toString()}");
          registerLoader = false;
          emit(RegisterFailedState(failure.message ?? "حدث خطأ أثناء التسجيل"));
          delightfulToast(
            message: failure.message ?? "حدث خطأ أثناء التسجيل",
            context: context,
            toastColor: MainColors.red,
          );
        },
        // في حالة النجاح
        (response) async {
          log("✅ تم التسجيل بنجاح");

          if (response.data != null) {
            // حفظ التوكن
            if (response.data?.token != null &&
                response.data!.token!.isNotEmpty) {
              TokenUtil.saveToken(response.data!.token!);
              log("🔐 تم حفظ التوكن: ${response.data!.token}");
            }

            // حفظ بيانات المستخدم
            GetStorage().write(
              StorageEnum.loginModel.name,
              jsonEncode(response.data),
            );

            // الحصول على FCM Token
            String fcmToken =
                await NotificationService.instance.getFcmToken() ?? "";
            log("📱 FCM Token: $fcmToken");

            // تحديث FCM Token
            if (fcmToken.isNotEmpty && context.mounted) {
              context.read<HomeCubit>().updateFcmToken(fcmToken: fcmToken);
            }

            // تحديث المتغيرات
            registerLoader = false;
            registerEntity = response;

            // إصدار حالة النجاح
            emit(RegisterSuccessState());

            // عرض رسالة النجاح
            delightfulToast(
              message: response.message ?? "تم التسجيل بنجاح!",
              context: context,
              toastColor: MainColors.greenTeal,
            );

            // تنظيف الحقول
            clearControllers();

            // الانتقال للشاشة الرئيسية أو شاشة تأكيد البريد الإلكتروني
            Future.delayed(
              Duration.zero,
              () {
                if (context.mounted) {
                  if (false/*response.data?.isEmailVerified == false*/) {
                    // Navigator.pushNamedAndRemoveUntil(
                    //   context,
                    //   RoutePaths.emailVerificationPath,
                    //   (route) => false,
                    // );
                  } else {
                    context.read<LayoutCubit>().changeIndex(0);
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      RoutePaths.layoutPath,
                      (route) => false,
                    );
                  }
                }
              },
            );
          } else {
            // البيانات فارغة رغم النجاح
            log("⚠️ استجابة فارغة من الخادم");
            registerLoader = false;
            emit(RegisterFailedState("حدث خطأ غير متوقع"));
            delightfulToast(
              message: response.message ?? "حدث خطأ غير متوقع",
              context: context,
              toastColor: MainColors.offersColor,
            );
          }
        },
      );
    } catch (e) {
      // معالجة الأخطاء غير المتوقعة
      log("💥 خطأ غير متوقع في التسجيل: $e");
      registerLoader = false;
      emit(RegisterFailedState("حدث خطأ غير متوقع: ${e.toString()}"));
      delightfulToast(
        message: "حدث خطأ غير متوقع، يرجى المحاولة مرة أخرى",
        context: context,
        toastColor: MainColors.red,
      );
    }
  }

  /// دالة التسجيل مع إعادة المحاولة
  Future<void> registerWithRetry(BuildContext context,
      {int maxRetries = 3}) async {
    int attemptCount = 0;

    while (attemptCount < maxRetries) {
      attemptCount++;
      log("🔄 محاولة التسجيل رقم $attemptCount من $maxRetries");

      await register(context);

      // إذا نجح التسجيل، اخرج من الحلقة
      if (state is RegisterSuccessState) {
        break;
      }

      // انتظار قبل المحاولة التالية (إلا في المحاولة الأخيرة)
      if (attemptCount < maxRetries) {
        await Future.delayed(Duration(seconds: attemptCount * 2));
      }
    }
  }

  /// تنظيف الحقول
  void clearControllers() {
    firstNameController.clear();
    lastNameController.clear();
    emailController.clear();
    phoneController.clear();
    whatsAppController.clear();
    passwordController.clear();
    userNameController.clear();
    passwordConfirmationController.clear();
    selectedGender = "female";
  }

  /// تنظيف الموارد
  @override
  Future<void> close() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    whatsAppController.dispose();
    passwordController.dispose();
    userNameController.dispose();
    passwordConfirmationController.dispose();
    return super.close();
  }
}
