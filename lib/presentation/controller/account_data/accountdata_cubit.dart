// ignore_for_file: unnecessary_null_comparison

import 'dart:developer';
import 'dart:io';

import 'package:eazifly_student/core/base_usecase/base_usecase.dart';
import 'package:eazifly_student/core/enums/gender_enum.dart';
import 'package:eazifly_student/core/network/handle_token.dart';
import 'package:eazifly_student/data/models/user/update_profile_tojson.dart';
import 'package:eazifly_student/domain/entities/notification/auth/logout_entity.dart';
import 'package:eazifly_student/domain/entities/user/delete_account_entity.dart';
import 'package:eazifly_student/domain/entities/user/update_profile_entity.dart';
import 'package:eazifly_student/domain/use_cases/delete_account_usecase.dart';
import 'package:eazifly_student/domain/use_cases/logout_usecase.dart';
import 'package:eazifly_student/domain/use_cases/update_profile_usecase.dart';
import 'package:eazifly_student/presentation/view/layout/home_page/home_page.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

import 'accountdata_state.dart';

class AccountdataCubit extends Cubit<AccountdataState> {
  AccountdataCubit({
    required this.updateProfileUsecase,
    required this.logoutUsecase,
    required this.deleteAccountUsecase,
  }) : super(AccountdataInitial()) {
    if (loginData != null) {
      lastNameController.text = loginData?.lastName ?? "no name";
      firstNameController.text = loginData?.firstName ?? "no name";
      phoneController.text = loginData?.phone ?? "no name";
      whatsAppController.text = loginData?.whatsApp ?? "no name";
      emailController.text = loginData?.email ?? "no email"; // تم تصحيح هذا
      userNameController.text = loginData?.userName ?? "";
      ageController.text = loginData?.age ?? "no age";

      // تحديد الجنس من البيانات المحفوظة
      if (loginData?.gender != null) {
        gender =
            loginData?.gender == 'male' ? GenderEnum.male : GenderEnum.female;
      }
    }
  }

  static AccountdataCubit get(context) => BlocProvider.of(context);

  TextEditingController lastNameController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController whatsAppController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  File? profileImage;
  Future<void> pickProfileImageFroGallery() async {
    final response = await pickImageFromGallery();
    if (response != null) {
      profileImage = File(response.path);
    }
    emit(PickImageFromGallerySuccessState());
  }

  UpdateProfileEntity? updateProfileEntity;
  UpdateProfileUsecase updateProfileUsecase;
  bool updateProfileLoader = false;

  GenderEnum gender = GenderEnum.male;
  void onGenderChange(GenderEnum value) {
    gender = value;
    log(gender.requestValue);
  }

  Future<void> updateProfile() async {
    updateProfileLoader = true;
    emit(UpdateProfileLoadingState());

    try {
      String? imagePath;

      // إذا كان في صورة جديدة
      if (profileImage != null) {
        final File file = profileImage!;

        if (!await file.exists()) {
          throw Exception('Profile image file does not exist');
        }

        imagePath = file.path;
      }

      final result = await updateProfileUsecase.call(
        parameter: UpdateProfileParameters(
          userId: loginData?.id ?? 0,
          data: UpdateProfileTojson(
            age: ageController.text,
            whatsApp: whatsAppController.text,
            gender: gender.requestValue,
            email: emailController.text,
            phone: phoneController.text,
            userName: userNameController.text,
            firstName: firstNameController.text,
            lastName: lastNameController.text,
            image: imagePath, // أرسل المسار كـ String
          ),
        ),
      );

      result.fold(
        (l) {
          updateProfileLoader = false;
          emit(UpdateProfileErrorState(errorMessage: l.message));
        },
        (r) {
          updateProfileLoader = false;
          updateProfileEntity = r;
          // loginData?.age = r.data?.age;
          emit(UpdateProfileSuccessState());
        },
      );
    } catch (e) {
      updateProfileLoader = false;
      log("Error in updateProfile: $e");
      emit(UpdateProfileErrorState(errorMessage: e.toString()));
    }
  }

// Variables
  bool logoutLoader = false;
  LogoutUsecase logoutUsecase;
  LogoutEntity? logoutEntity;

// Method
  Future<void> logout(BuildContext context) async {
    logoutLoader = true;
    emit(LogoutLoadingState());

    final result = await logoutUsecase.call(parameter: NoParameter());

    result.fold(
      (failure) {
        logoutLoader = false;
        emit(LogoutErrorState(failure.message));
      },
      (data) async {
        logoutLoader = false;
        logoutEntity = data;
        emit(LogoutSuccessState());
        await TokenUtil.clearToken().then(
          (value) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              RoutePaths.loginPath,
              (route) => false,
            );
          },
        );
      },
    );
  }

// Variables
  bool deleteAccountLoader = false;
  DeleteAccountUsecase deleteAccountUsecase;
  DeleteAccountEntity? deleteAccountEntity;

// Method
  Future<void> deleteAccount(BuildContext context) async {
    deleteAccountLoader = true;
    emit(DeleteAccountLoadingState());

    final result = await deleteAccountUsecase.call(
        parameter: DeleteAccountParameters(userId: loginData?.id ?? -1));

    result.fold(
      (failure) {
        deleteAccountLoader = false;
        emit(DeleteAccountErrorState(failure.message));
      },
      (data) async {
        deleteAccountLoader = false;
        deleteAccountEntity = data;
        emit(DeleteAccountSuccessState());
        await TokenUtil.clearToken().then(
          (value) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              RoutePaths.loginPath,
              (route) => false,
            );
          },
        );
      },
    );
  }

  @override
  Future<void> close() {
    // إغلاق جميع الكونترولرات
    lastNameController.dispose();
    firstNameController.dispose();
    phoneController.dispose();
    whatsAppController.dispose();
    emailController.dispose();
    userNameController.dispose();
    ageController.dispose();
    // image.dispose();

    return super.close();
  }
}
