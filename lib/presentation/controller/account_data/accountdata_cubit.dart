import 'dart:convert';
import 'dart:io';

import 'package:eazifly_student/core/enums/storage_enum.dart';
import 'package:eazifly_student/data/models/auth/login_model.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';
import 'package:get_storage/get_storage.dart';

import 'accountdata_state.dart';

class AccountdataCubit extends Cubit<AccountdataState> {
  AccountdataCubit() : super(AccountdataInitial()) {
    loginData = DataModel.fromJson(
      jsonDecode(GetStorage().read(StorageEnum.loginModel.name)),
    );
    if (loginData != null) {
      nameArController.text = loginData?.firstName ?? "no name";
      nameEnController.text = loginData?.lastName ?? "no name";
      phoneController.text = loginData?.phone ?? "no name";
      whatsAppController.text = loginData?.whatsApp ?? "no name";
      emailController.text = loginData?.phone ?? "no name";
      reasonController.text = "reasons";
      ageController.text = loginData?.age ?? "no age";
      addressController.text =
          loginData?.createdAt?.toIso8601String().substring(0, 9) ??
              "no address";
    }
  }
  DataModel? loginData;

  static AccountdataCubit get(context) => BlocProvider.of(context);

  TextEditingController nameArController = TextEditingController();
  TextEditingController reasonController = TextEditingController();
  TextEditingController whatsAppController = TextEditingController();
  TextEditingController nameEnController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController image = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
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

  // UpdateProfileEntity? updateProfileEntity;
  // UpdateProfileUsecase updateProfileUsecase;
  bool updateProfileLoader = false;
  Future<void> updateProfile() async {
    // updateProfileLoader = true;
    // emit(UpdateProfileLoadingState());

    // try {
    //   String? imagePath;

    //   // إذا كان في صورة جديدة
    //   if (profileImage != null) {
    //     final File file = profileImage!;

    //     if (!await file.exists()) {
    //       throw Exception('Profile image file does not exist');
    //     }

    //     imagePath = file.path;
    //   }

    //   final result = await updateProfileUsecase.call(
    //     parameter: UpdateProfileParameters(
    //       data: UpdateProfileTojson(
    //         age: ageController.text,
    //         whatsApp: whatsAppController.text,
    //         address: addressController.text,
    //         email: emailController.text,
    //         phone: phoneController.text,
    //         reason: reasonController.text,
    //         nameEn: nameEnController.text,
    //         nameAr: nameArController.text,
    //         image: imagePath, // أرسل المسار كـ String
    //       ),
    //     ),
    //   );

    //   result.fold(
    //     (l) {
    //       updateProfileLoader = false;
    //       emit(UpdateProfileErrorState(errorMessage: l.message));
    //     },
    //     (r) {
    //       updateProfileLoader = false;
    //       updateProfileEntity = r;
    //       emit(UpdateProfileSuccessState());
    //     },
    //   );
    // } catch (e) {
    //   updateProfileLoader = false;
    //   log("Error in updateProfile: $e");
    //   emit(UpdateProfileErrorState(errorMessage: e.toString()));
    // }
  }
}
