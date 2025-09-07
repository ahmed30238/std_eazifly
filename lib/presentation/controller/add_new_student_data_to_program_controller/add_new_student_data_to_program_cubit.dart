import 'dart:developer';
import 'dart:io';
import 'package:eazifly_student/data/models/children/create_new_child_tojson.dart';
import 'package:eazifly_student/domain/entities/children_entities/create_new_child_entity.dart';
import 'package:eazifly_student/domain/use_cases/create_new_child_usecase.dart';
import 'package:eazifly_student/presentation/controller/add_new_student_data_to_program_controller/add_new_student_data_to_program_state.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class AddNewStudentDataToProgramCubit
    extends Cubit<AddNewStudentDataToProgramState> {
  AddNewStudentDataToProgramCubit({required this.createNewChildUsecase})
    : super(AddNewStudentDataToProgramInitial());

  static AddNewStudentDataToProgramCubit get(context) =>
      BlocProvider.of(context);

  // double linearIndicatorPercent = .2; // between 0 and 1
  int screenIndex = 0;
  int selectedLecturerIndex = 0;

  changeLecturerIndex(int index) {
    selectedLecturerIndex = index;
    emit(ChangeLecturerIndexState());
  }

  TabController? controller;
  bool createPassVisible = false;

  void changeCreatePassVisibility() {
    createPassVisible = !createPassVisible;
    emit(ChangePasswordVisibility());
  }

  bool confirmPassVisible = false;

  void changeConfirmPassisiblity() {
    confirmPassVisible = !confirmPassVisible;
    emit(ChangeConfirmPasswordVisibility());
  }

  final List<String> tabs = ["مواعيد ثابتة", 'مواعيد مرنة'];

  void initTabBarController(TickerProvider vsync) {
    controller = TabController(length: tabs.length, vsync: vsync);
    controller?.addListener(() {
      if (controller!.indexIsChanging) {
        controller?.animateTo(
          controller!.index,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeIn,
        );
      }
      emit(InitIalizeTabBarControllerState());
    });
  }

  int tapbarIndex = 0;

  void changeTapbarIndex(int index) {
    tapbarIndex = index;
    emit(ChangeTapBarIndexState());
  }

  decrementScreenIndex(BuildContext context) {
    if (screenIndex > 0) {
      // linearIndicatorPercent -= .2;

      screenIndex--;
    } else {
      back(context);
    }
    emit(DecrementScreenIndexState());
  }

  incrementScreenIndex() {
    // linearIndicatorPercent += .2;

    screenIndex++;
    emit(IncrementScreenIndexState());
  }

  // List<Widget> bodies = [
  // const RegistrationTypeBody(
  //   isRegisteringMySelf: false,
  // ),
  // const StudentDataBody(),
  // const ProperScheduleBody(),
  // const ChooseTeacherBody(),
  // ]; //! NOT used anymore
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController whatsAppController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController userNameController = TextEditingController();

  void clearControllers() {
    userNameController.clear();
    confirmPasswordController.clear();
    passwordController.clear();
    emailController.clear();
    whatsAppController.clear();
    phoneController.clear();
    ageController.clear();
    lastNameController.clear();
    firstNameController.clear();
    profileImage = null;
    genderIndex = 0;
  }

  bool isAssignToProgram = false;

  void fillIsAssignToProgram(bool val) {
    isAssignToProgram = val;
  }

  void closeControllers() {
    userNameController.dispose();
    confirmPasswordController.dispose();
    passwordController.dispose();
    emailController.dispose();
    whatsAppController.dispose();
    phoneController.dispose();
    ageController.dispose();
    lastNameController.dispose();
    firstNameController.dispose();
  }

  // TextEditingController ageController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  File? profileImage;
  bool isPicking = false;

  Future<void> pickProfileImageFroGallery() async {
    if (!isPicking) {
      isPicking = true;
      final response = await pickImageFromGallery();
      if (response != null) {
        profileImage = File(response.path);
      }
    }
    isPicking = false;
    emit(PickImageFromGallerySuccessState());
  }

  CreateNewChildEntity? createNewChildEntity;
  CreateNewChildUsecase createNewChildUsecase;
  bool createNewChildLoader = false;

  Future<void> createNewChild(
    BuildContext context, {
    int? orderId,
    int? programId,
  }) async {
    log("start");
    if (!formKey.currentState!.validate()) {
      return;
    }

    // التحقق من وجود orderId عندما يكون isAssignToProgram = true
    if (isAssignToProgram == true && orderId == null) {
      delightfulToast(message: "يجب توفير معرف الطلب", context: context);
      return;
    }

    createNewChildLoader = true;
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
            age: ageController.text,
            whatsApp: whatsAppController.text,
            email: emailController.text,
            phone: phoneController.text,
            image: imagePath,
            // أرسل المسار كـ String
            firstName: firstNameController.text,
            gender: genderIndex == 0 ? "male" : "female",
            lastName: lastNameController.text,
            userName: userNameController.text,
            password: passwordController.text,
            passwordConfirmation: confirmPasswordController.text,
          ),
        ),
      );

      result.fold(
        (l) {
          createNewChildLoader = false;
          emit(CreateNewChildErrorState(errorMessage: l.message));
          delightfulToast(message: l.message, context: context);
        },
        (r) {
          createNewChildLoader = false;
          createNewChildEntity = r;
          emit(CreateNewChildSuccessState());
          log("$isAssignToProgram");

          isAssignToProgram == true
              ? Navigator.pushNamed(
                  arguments: {"orderId": orderId, "programId": programId},
                  context,
                  RoutePaths.groupPackageManagement,
                )
              : Navigator.pushReplacementNamed(
                  context,
                  RoutePaths.studentManagement,
                );
          clearControllers();
          delightfulToast(message: r.message ?? "", context: context);
        },
      );
    } catch (e) {
      delightfulToast(message: "حدث خطأ $e", context: context);
      createNewChildLoader = false;
      log("Error in updateProfile: $e");
      emit(CreateNewChildErrorState(errorMessage: e.toString()));
    }
  }

  reset() {
    screenIndex = 0;
    controller?.dispose();
    // linearIndicatorPercent = .2;
  }

  @override
  Future<void> close() {
    reset();
    closeControllers();
    return super.close();
  }

  int genderIndex = 0;

  changeGender(int index) {
    genderIndex = index;
    emit(ChangeGenderState());
  }
}
