import 'package:eazifly_student/domain/entities/auth/forgot_password_entity.dart';
import 'package:eazifly_student/domain/entities/auth/reset_password_entity.dart';
import 'package:eazifly_student/domain/use_cases/forgot_password_usecase.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

import '../../../../data/models/auth/reset_password_tojson.dart';
import '../../../../domain/use_cases/reset_password_usecase.dart';
import 'forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  ForgotPasswordCubit({
    required this.forgotPasswordUsecase,
    required this.resetPasswordUsecase,
  }) : super(ForgotPasswordInitial());

  GlobalKey<FormState> forgotPasswordFormKey = GlobalKey<FormState>();
  ResetPasswordEntity? resetPasswordEntity;

  ForgotPasswordEntity? forgotPasswordEntity;
  ForgotPasswordUsecase forgotPasswordUsecase;
  ResetPasswordUsecase resetPasswordUsecase;
  bool forgotPasswordLoader = false;
  bool resetPasswordLoader = false;

  Future<void> resetPassword() async {
    resetPasswordLoader = true;
    emit(ResetPasswordLoadingState());

    final result = await resetPasswordUsecase.call(
      parameter: ResetPasswordParameters(
        data: ResetPasswordToJson(
          passwordConfirmation: passwordConfirmationController.text,
          password: passwordController.text,
          email: emailController.text,
          code: codeController.text,
        ),
      ),
    );

    result.fold(
      (l) {
        resetPasswordLoader = false;
        emit(ResetPasswordErrorState(errorMessage: l.message));
      },
      (r) {
        resetPasswordEntity = r;
        resetPasswordLoader = false;
        emit(ResetPasswordSuccessState());
      },
    );
  }

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordConfirmationController =
      TextEditingController();
  final TextEditingController codeController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> resetFormKey = GlobalKey<FormState>();


  Future<void> forgetPassword() async {
    forgotPasswordLoader = true;
    emit(ForgotPasswordLoadingState());

    final result = await forgotPasswordUsecase.call(
      parameter: ForgotPasswordParameters(
        email: emailController.text,
      ),
    );

    result.fold(
      (l) {
        forgotPasswordLoader = false;
        emit(ForgotPasswordErrorState(errorMessage: l.message));
      },
      (r) {
        forgotPasswordEntity = r;
        forgotPasswordLoader = false;
        emit(ForgotPasswordSuccessState());
      },
    );
  }

  bool isNewPasswordVisible = true;
  bool isConfirmPasswordVisible = true;

  void changeNewPasswordVisibility() {
    isNewPasswordVisible = !isNewPasswordVisible;
    emit(PasswordVisibilityChangedState());
  }

  void changeConfirmPasswordVisibility() {
    isConfirmPasswordVisible = !isConfirmPasswordVisible;
    emit(PasswordVisibilityChangedState());
  }
}
