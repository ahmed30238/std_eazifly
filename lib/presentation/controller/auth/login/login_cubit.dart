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
  TextEditingController emailController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
//! ##################### api ##########################

  bool loginLoader = false;
  LoginEntity? entities;

  void tryToLogin(BuildContext context) async {
    loginLoader = true;
    if (!formKey.currentState!.validate()) {
      return;
    }
    emit(LoginLoadingState());

    final data = await loginUsecase.call(
      parameter: LoginParameter(
        email: emailController.text,
        password: passwordController.text,
      ),
    );

    data.fold(
      (l) {
        loginLoader = false;
        emit(LoginFailedState());
        return;
      },
      (r) async {
        if (r.data != null) {
          context.read<LayoutCubit>().changeIndex(0);
          TokenUtil.saveToken(r.data?.token ?? "");
          GetStorage().write(
            StorageEnum.loginModel.name,
            jsonEncode(r.data),
          );
          String fcmToken =
              await NotificationService.instance.getFcmToken() ?? "";
          log("sent fcmToken is $fcmToken");

          context.read<HomeCubit>().updateFcmToken(
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
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
