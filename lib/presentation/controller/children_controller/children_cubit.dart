import 'dart:developer';
import 'dart:io';

import 'package:eazifly_student/data/models/children/create_new_child_tojson.dart';
import 'package:eazifly_student/domain/entities/children_entities/create_new_child_entity.dart';
import 'package:eazifly_student/domain/entities/children_entities/get_my_children_entity.dart';
import 'package:eazifly_student/domain/use_cases/create_new_child_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_children_usecase.dart';
import 'package:eazifly_student/presentation/controller/children_controller/children_state.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class ChildrenCubit extends Cubit<ChildrenState> {
  ChildrenCubit({
    required this.getChildrenUsecase,
    required this.createNewChildUsecase,
  }) : super(ChildrenInitial());
  bool getMyChildrenLoader = false;
  GetMyChildrenEntity? getMyChildrenEntity;
  GetChildrenUsecase getChildrenUsecase;
  Future<void> getMyChildren() async {
    getMyChildrenLoader = true;
    emit(GetMyChildernLoadingState());
    final result = await getChildrenUsecase.call(
      parameter: GetMyChildernParameters(childernsStatus: true),
    );
    result.fold(
      (l) {
        getMyChildrenLoader = false;
        emit(GetMyChildernErrorState(errorMessage: l.message));
      },
      (r) {
        getMyChildrenLoader = false;
        getMyChildrenEntity = r;
        emit(GetMyChildernSuccessState());
      },
    );
  }

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

  CreateNewChildEntity? createNewChildEntity;
  CreateNewChildUsecase createNewChildUsecase;
  bool updateProfileLoader = false;
  Future<void> updateProfile() async {
    updateProfileLoader = true;
    emit(CreateNewChildLoadingState());

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

      final result = await createNewChildUsecase.call(
        parameter: CreateNewChildParameters(
          data: CreateNewChildTojson(

            age: "25",
            // ageController.text,
            whatsApp: "01012456454",
            //  whatsAppController.text,
            email: "salama@gmail.com",
            // emailController.text,
            phone: "01030837974",
            // phoneController.text,
            image: imagePath, // أرسل المسار كـ String
            firstName: "Ahmed",
            gender: "male",
            lastName: "Salama",
            userName: "as3114886@gmail.com",
            passwordConfirmation: "111111",
            password: "111111",
          ),
        ),
      );

      result.fold(
        (l) {
          updateProfileLoader = false;
          emit(CreateNewChildErrorState(errorMessage: l.message));
        },
        (r) {
          updateProfileLoader = false;
          createNewChildEntity = r;
          emit(CreateNewChildSuccessState());
        },
      );
    } catch (e) {
      updateProfileLoader = false;
      log("Error in updateProfile: $e");
      emit(CreateNewChildErrorState(errorMessage: e.toString()));
    }
  }
}
