import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:eazifly_student/core/enums/gender_enum.dart';
import 'package:eazifly_student/core/enums/storage_enum.dart';
import 'package:eazifly_student/core/helper_methods/helper_methods.dart';
import 'package:eazifly_student/core/routes/paths.dart';
import 'package:eazifly_student/data/models/user/update_profile_tojson.dart';
import 'package:eazifly_student/domain/entities/subscription_management/remove_assigned_student_entity.dart';
import 'package:eazifly_student/domain/entities/user/update_profile_entity.dart';
import 'package:eazifly_student/domain/use_cases/remove_assigned_student_usecase.dart';
import 'package:eazifly_student/domain/use_cases/update_profile_usecase.dart';
import 'package:eazifly_student/presentation/controller/account_data/update_child_profile_controller/updatechildprofile_state.dart';
import 'package:eazifly_student/presentation/view/layout/home_page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';

class UpdatechildprofileCubit extends Cubit<UpdatechildprofileState> {
  UpdatechildprofileCubit({
    required this.updateProfileUsecase,
    required this.removeAssignedStudentUsecase,
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

  Future<void> updateProfile({
    required int userId,
    required BuildContext context,
  }) async {
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
            parentId: loginData?.id.toString() ?? "0",
            age: ageController.text,
            whatsApp: whatsAppController.text,
            gender: gender.requestValue,
            email: emailController.text,
            phone: phoneController.text,
            userName: userNameController.text,
            firstName: firstNameController.text,
            lastName: lastNameController.text,
            image: imagePath,
          ),
        ),
      );

      result.fold(
        (l) {
          updateProfileLoader = false;
          emit(UpdateProfileErrorState(errorMessage: l.message));
        },
        (r) {
          _updateChildInCache(userId, r);
          updateProfileLoader = false;
          updateProfileEntity = r;
          emit(UpdateProfileSuccessState());

          Future.delayed(
            const Duration(milliseconds: 100),
            () {
              Navigator.pushReplacementNamed(
                context,
                RoutePaths.subscribedStudentsSettingsView,
              );
            },
          );
        },
      );
    } catch (e) {
      updateProfileLoader = false;
      log("Error in updateProfile: $e");
      emit(UpdateProfileErrorState(errorMessage: e.toString()));
    }
  }

  // دالة لتحديث بيانات الطالب في الكاش
  void _updateChildInCache(int userId, UpdateProfileEntity updatedData) {
    try {
      // جلب البيانات الحالية من الكاش
      final storage = GetStorage();
      final cachedLoginData = storage.read(StorageEnum.loginModel.name);

      if (cachedLoginData != null) {
        // تحويل البيانات من String لـ Map
        Map<String, dynamic> loginDataMap = jsonDecode(cachedLoginData);

        // التأكد من وجود childrens array
        if (loginDataMap['childrens'] != null &&
            loginDataMap['childrens'] is List) {
          List<dynamic> children = loginDataMap['childrens'];

          // البحث عن الطالب المطلوب تحديثه
          for (int i = 0; i < children.length; i++) {
            if (children[i]['id'] == userId) {
              // تحديث بيانات الطالب
              children[i]['first_name'] = firstNameController.text;
              children[i]['last_name'] = lastNameController.text;
              children[i]['user_name'] = userNameController.text;
              children[i]['email'] = emailController.text;
              children[i]['phone'] = phoneController.text;
              children[i]['whats_app'] = whatsAppController.text;
              children[i]['age'] = ageController.text;
              children[i]['gender'] = gender.requestValue;

              if (profileImage?.path != null) {
                children[i]['image'] = profileImage?.path;
              }

              break;
            }
          }

          storage.write(
            StorageEnum.loginModel.name,
            jsonEncode(loginDataMap),
          );

          log("Child data updated successfully in cache for user ID: $userId");
        }
      }
    } catch (e) {
      log("Error updating child data in cache: $e");
    }
  }

  // Variables
  bool removeAssignedStudentLoader = false;
  RemoveAssignedStudentEntity? removeAssignedStudentEntity;
  RemoveAssignedStudentUsecase removeAssignedStudentUsecase;

  // Method
  Future<void> removeAssignedStudent({
    required int programId,
    required int userId,
  }) async {
    removeAssignedStudentLoader = true;
    emit(RemoveAssignedStudentLoadingState());

    final result = await removeAssignedStudentUsecase.call(
      parameter: RemoveAssignedStudetParameters(
        programId: programId,
        userId: userId,
      ),
    );

    result.fold(
      (failure) {
        removeAssignedStudentLoader = false;
        emit(RemoveAssignedStudentErrorState(failure.message));
      },
      (data) {
        removeAssignedStudentLoader = false;
        emit(RemoveAssignedStudentSuccessState(programId, userId));
      },
    );
  }

  @override
  Future<void> close() {
    lastNameController.dispose();
    firstNameController.dispose();
    phoneController.dispose();
    whatsAppController.dispose();
    emailController.dispose();
    userNameController.dispose();
    ageController.dispose();

    return super.close();
  }

  void fillData({
    required String firstName,
    required String lastName,
    required String age,
    required String gender,
    required String whatsApp,
    required String phone,
    required String userName,
    required String email,
  }) {
    lastNameController.text = lastName;
    firstNameController.text = firstName;
    phoneController.text = phone;
    this.gender = gender == "ذكر" ? GenderEnum.male : GenderEnum.female;
    whatsAppController.text = whatsApp;
    emailController.text = email;
    userNameController.text = userName;
    ageController.text = age;
  }
}
