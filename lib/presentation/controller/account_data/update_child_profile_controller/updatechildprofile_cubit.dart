import 'dart:developer';
import 'dart:io';

import 'package:eazifly_student/core/enums/gender_enum.dart';
import 'package:eazifly_student/core/helper_methods/helper_methods.dart';
import 'package:eazifly_student/data/models/user/update_profile_tojson.dart';
import 'package:eazifly_student/domain/entities/user/update_profile_entity.dart';
import 'package:eazifly_student/domain/use_cases/update_profile_usecase.dart';
import 'package:eazifly_student/presentation/controller/account_data/update_child_profile_controller/updatechildprofile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdatechildprofileCubit extends Cubit<UpdatechildprofileState> {
  UpdatechildprofileCubit({
    required this.updateProfileUsecase,
  }) : super(UpdatechildprofileInitial());

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

  Future<void> updateProfile({required int userId}) async {
    if (!formKey.currentState!.validate()) {
      return;
    }
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
          userId: userId,
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
