import 'dart:convert';
import 'dart:developer';

import 'package:eazifly_student/core/enums/storage_enum.dart';
import 'package:eazifly_student/core/fire_base_helper/firebase_notifiction.dart';
import 'package:eazifly_student/core/helper_methods/helper_methods.dart';
import 'package:eazifly_student/core/network/handle_token.dart';
import 'package:eazifly_student/core/routes/paths.dart';
import 'package:eazifly_student/core/theme/colors/main_colors.dart';
import 'package:eazifly_student/domain/entities/login_entities.dart';
import 'package:eazifly_student/domain/use_cases/login_usecase.dart';
import 'package:eazifly_student/presentation/controller/auth/login/login_state.dart';
import 'package:eazifly_student/presentation/controller/home_controller/home_cubit.dart';
import 'package:eazifly_student/presentation/controller/layout/layout_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../data/models/auth/login_tojson.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.loginUsecase}) : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);
  TextEditingController passwordController = TextEditingController();
  bool isVisible = true;

  void changeVisibility() {
    isVisible = !isVisible;
    emit(ChangePasswordVisibility());
  }

  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();

  LoginUsecase loginUsecase;

  // TextEditingController emailController = TextEditingController();
  // TextEditingController phoneController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController loginController = TextEditingController();

  // TextEditingController passwordController = TextEditingController();
  // GlobalKey<FormState> formKey = GlobalKey<FormState>();

// دالة لتحديد نوع البيانات المدخلة
  String detectInputType(String input) {
    final trimmedInput = input.trim();

    // التحقق من الإيميل
    final emailRegExp = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
    if (emailRegExp.hasMatch(trimmedInput)) {
      return 'email';
    }

    // التحقق من رقم الهاتف (أرقام فقط وقد يبدأ بـ + أو 0)
    final phoneRegExp = RegExp(r'^[\+]?[0-9\s\-\(\)]{8,15}$');
    if (phoneRegExp.hasMatch(trimmedInput)) {
      return 'phone';
    }

    // إذا لم يكن إيميل أو رقم هاتف، فهو اسم مستخدم
    return 'username';
  }

  LoginToJson createLoginFromSingleController() {
    final inputValue = loginController.text.trim();
    final inputType = detectInputType(inputValue);

    switch (inputType) {
      case 'email':
        return LoginToJson(
          email: inputValue,
          password: passwordController.text,
        );
      case 'phone':
        return LoginToJson(
          phone: inputValue,
          password: passwordController.text,
        );
      case 'username':
      default:
        return LoginToJson(
          userName: inputValue,
          password: passwordController.text,
        );
    }
  }

//! ##################### api ##########################

  bool loginLoader = false;
  LoginEntity? entities;

  Future<void> tryToLogin(BuildContext context) async {
    if (loginLoader) return;

    try {
      loginLoader = true;
      emit(LoginLoadingState());

      final loginData = createLoginFromSingleController();

      // التحقق من وجود بيانات أساسية فقط
      if (!loginData.isValid) {
        loginLoader = false;
        emit(LoginFailedState());
        delightfulToast(
          message: "يجب إدخال رقم الهاتف أو الإيميل أو اسم المستخدم",
          context: context,
          toastColor: MainColors.onError,
        );
        return;
      }

      if (formKey.currentState!.validate()) {
        final data = await loginUsecase.call(
          parameter: LoginParameter(data: loginData),
        );

        data.fold(
          (l) {
            loginLoader = false;
            emit(LoginFailedState());
          },
          (r) async {
            context.read<LayoutCubit>().changeIndex(0);
            if (r.data != null) {
              await TokenUtil.saveToken(r.data?.token ?? "");
              await GetStorage().write(
                StorageEnum.loginModel.name,
                jsonEncode(r.data),
              );
              final String fcmToken =
                  await NotificationService.instance.getFcmToken() ??
                      "noFcmToken";
              log("from login this is stored FCMToken $fcmToken");
              await HomeCubit.get(context).updateFcmToken(
                fcmToken: fcmToken,
              );

              loginLoader = false;
              entities = r;
              emit(LoginSuccessState());

              delightfulToast(message: r.message ?? "", context: context);

              Future.delayed(
                Duration.zero,
                () => Navigator.pushNamedAndRemoveUntil(
                  context,
                  RoutePaths.layoutPath,
                  (route) => false,
                ),
              );
            } else {
              loginLoader = false;
              emit(LoginFailedState());
              delightfulToast(
                message: r.message ?? "",
                context: context,
                toastColor: MainColors.onError,
              );
            }
          },
        );
      } else {
        loginLoader = false;
        emit(LoginFailedState());
      }
    } catch (e) {
      loginLoader = false;
      emit(LoginFailedState());
      delightfulToast(
        message: "حدث خطأ غير متوقع",
        context: context,
        toastColor: MainColors.onError,
      );
    }
  }

// دالة مساعدة للحصول على نوع الإدخال (اختيارية للـ UI)
  String getInputTypeDisplayText() {
    final inputValue = loginController.text.trim();
    if (inputValue.isEmpty) return "رقم الهاتف / الإيميل / اسم المستخدم";

    final inputType = detectInputType(inputValue);
    switch (inputType) {
      case 'email':
        return "الإيميل";
      case 'phone':
        return "رقم الهاتف";
      case 'username':
        return "اسم المستخدم";
      default:
        return "رقم الهاتف / الإيميل / اسم المستخدم";
    }
  }

  @override
  Future<void> close() {
    loginController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
