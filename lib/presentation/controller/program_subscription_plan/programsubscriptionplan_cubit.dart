import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:eazifly_student/core/component/custom_dialog.dart';
import 'package:eazifly_student/data/models/order_and_subscribe/check_copoun_tojson.dart';
import 'package:eazifly_student/data/models/order_and_subscribe/create_order_tojson.dart';
import 'package:eazifly_student/data/models/order_and_subscribe/filter_plan_tojson.dart';
import 'package:eazifly_student/domain/entities/check_copoun_entities.dart';
import 'package:eazifly_student/domain/entities/create_order_entities.dart';
import 'package:eazifly_student/domain/entities/filter_plan_entities.dart';
import 'package:eazifly_student/domain/entities/get_payment_method_details_entities.dart';
import 'package:eazifly_student/domain/entities/get_plans_entities.dart';
import 'package:eazifly_student/domain/entities/get_program_payment_methods_entities.dart';
import 'package:eazifly_student/domain/use_cases/check_copoun_usecase.dart';
import 'package:eazifly_student/domain/use_cases/create_order_usecase.dart';
import 'package:eazifly_student/domain/use_cases/filter_plans_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_payment_method_details_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_plans_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_program_payment_methods_usecase.dart';
import 'package:eazifly_student/presentation/controller/program_subscription_plan/programsubscriptionplan_state.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class ProgramsubscriptionplanCubit extends Cubit<ProgramsubscriptionplanState> {
  ProgramsubscriptionplanCubit({
    required this.getPlansUsecase,
    required this.filterPlansUsecase,
    required this.createOrderUsecase,
    required this.checkCopounUsecase,
    required this.getProgramPaymentMethodsUsecase,
    required this.getPaymentMethodDetailsUsecase,
  }) : super(ProgramsubscriptionplanInitial());

  static ProgramsubscriptionplanCubit get(context) => BlocProvider.of(context);
  final TextEditingController studentNumberController = TextEditingController();
  final TextEditingController copounController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  int planSubscribeDaysIndex = 0;
  void changePlanIndex(int index) {
    planSubscribeDaysIndex = index;
    emit(ChangePlanIndexState());
  }

  int lessonDurationIndex = 0;
  void changelessonDurationIndex(int index) {
    lessonDurationIndex = index;
    emit(ChangeLessonDurationIndexState());
  }

  int programId = -1;
  void fillProgramId(int value) {
    programId = value;
  }

  //! #################### API ####################
  bool getPlansLoader = false;
  GetPlansEntity? getPlansEntity;
  GetPlansUsecase getPlansUsecase;
  Future<void> getPlans({required int programId}) async {
    getPlansLoader = true;
    emit(GetPlansLoadingState());
    final result = await getPlansUsecase.call(
      parameter: GetPlansParameters(
        programId: programId,
      ),
    );
    result.fold(
      (l) {
        getPlansLoader = false;
        emit(GetPlansErrorState(errorMessage: l.message));
      },
      (r) {
        getPlansEntity = r;
        getPlansLoader = false;
        fillProgramId(programId);
        emit(GetPlansSuccessState());
      },
    );
  }

  FilterPlansEntity? filterPlansEntity;
  FilterPlansUsecase filterPlansUsecase;
  bool filterPlansLoader = false;
  Future<void> filterPlans({required int programId}) async {
    filterPlansLoader = true;
    emit(FilterPlansLoadingState());
    var plan = getPlansEntity?.data;
    final result = await filterPlansUsecase.call(
      parameter: FilterPlansParameters(
        data: FilterPlansTojson(
          duration: plan?.duration?[lessonDurationIndex] ?? "",
          numberOfSessionPerWeek: plan?.numberOfSessionPerWeek?[0] ?? "",
          programId: programId.toString(),
          subscribeDays: plan?.subscripeDays?[planSubscribeDaysIndex] ?? "",
        ),
      ),
    );
    result.fold(
      (l) {
        filterPlansLoader = false;
        emit(FilterPlansErrorState(errorMessage: l.message));
      },
      (r) {
        filterPlansLoader = false;
        filterPlansEntity = r;
        emit(FilterPlansSuccessState());
      },
    );
  }

  CheckCopounEntity? checkCopounEntity;
  CheckCopounUsecase checkCopounUsecase;
  bool checkCopounLoader = false;
  Future<void> checkCopouns({required BuildContext context}) async {
    checkCopounLoader = true;
    emit(CheckCopounLoadingState());
    final result = await checkCopounUsecase.call(
      parameter: CheckCopounDataParameters(
        data: CheckCopounTojson(
          code: copounController.text,
        ),
      ),
    );
    result.fold(
      (l) {
        checkCopounLoader = false;
        delightfulToast(message: l.message, context: context);
        emit(CheckCopounErrorState(errorMessage: l.message));
      },
      (r) {
        checkCopounLoader = false;
        checkCopounEntity = r;
        delightfulToast(message: r.message ?? "", context: context);
        emit(CheckCopounSuccessState());
      },
    );
  }

  CreateOrderEntity? createOrderEntity;
  CreateOrderUsecase createOrderUsecase;
  bool createOrderLoader = false;
  List<File> images = [];
  Future<void> pickImages() async {
    final response = await pickMultiImageFromGallery();
    if (response != null) {
      images = List.from(response.map((e) => File(e.path)));
    }
    emit(GetGalleryImagesState());
  }

  Future<void> createOrder(
      {required int programId, required BuildContext context}) async {
    createOrderLoader = true;
    emit(CreateOrderLoadingState());

    try {
      final File file = images.first;

      if (!await file.exists()) {
        return;
        // throw Exception('Image file does not exist');
      }

      // إنشاء MultipartFile مباشرة
      final multipartFile = await MultipartFile.fromFile(
        file.path,
        filename: file.path.split('/').last,
      );

      final result = await createOrderUsecase.call(
        parameter: CreateOrderParameters(
          data: CreateOrderTojson(
            code: copounController.text,
            imageFile: multipartFile, // استخدم property جديد
            planId: [filterPlansEntity?.data?.id ?? 0],
            programId: [programId],
            studentNumber: [int.tryParse(studentNumberController.text) ?? 0],
          ),
        ),
      );

      result.fold(
        (l) {
          createOrderLoader = false;
          emit(CreateOrderErrorState(errorMessage: l.message));
        },
        (r) {
          createOrderLoader = false;
          createOrderEntity = r;
          emit(CreateOrderSuccessState());

          showAdaptiveDialog(
            context: context,
            builder: (context) => const CustomDialog(
              title: "جاري مراجعة طلب التحويل",
              subTitle: "سيتم ارسال اشعار التاكيد في اقرب وقت ",
              loader: true,
            ),
          );
          Timer(
            const Duration(seconds: 2),
            () => Navigator.pushReplacementNamed(
              context,
              RoutePaths.programsUnderReviewView,
            ),
          );
        },
      );
    } catch (e) {
      createOrderLoader = false;
      log("Error in createOrder: $e");
      emit(CreateOrderErrorState(errorMessage: e.toString()));
    }
  }

  bool getProgramPaymentMethodLoader = false;
  GetProgramPaymentMethodsEntity? getProgramPaymentMethodsEntity;
  GetProgramPaymentMethodsUsecase getProgramPaymentMethodsUsecase;
  Future<void> getProgramPaymentMethod() async {
    getProgramPaymentMethodLoader = true;
    emit(GetProgramPaymentMethodLoadingState());
    final result = await getProgramPaymentMethodsUsecase.call(
      parameter: GetProgramPaymentMethodsParameters(
        programId: programId,
      ),
    );
    result.fold(
      (l) {
        getProgramPaymentMethodLoader = false;
        emit(GetProgramPaymentMethodErrorState(errorMessage: l.message));
      },
      (r) {
        getProgramPaymentMethodLoader = false;
        getProgramPaymentMethodsEntity = r;
        emit(GetProgramPaymentMethodSuccessState());
      },
    );
  }

  bool getPaymentMethodDetailsLoader = false;
  GetPaymentMethodDetailsEntity? getPaymentMethodDetailsEntity;
  GetPaymentMethodDetailsUsecase getPaymentMethodDetailsUsecase;
  Future<void> getPamyentMethodDetails({required int methodId}) async {
    getPaymentMethodDetailsLoader = true;
    emit(GetProgramPaymentMethodLoadingState());
    final result = await getPaymentMethodDetailsUsecase.call(
      parameter: GetPaymentMethodDetailsParameters(
          methodId: methodId, programId: programId),
    );
    result.fold(
      (l) {
        getPaymentMethodDetailsLoader = false;
        emit(GetProgramPaymentMethodErrorState(errorMessage: l.message));
      },
      (r) {
        getPaymentMethodDetailsLoader = false;
        getPaymentMethodDetailsEntity = r;
        emit(GetProgramPaymentMethodSuccessState());
      },
    );
  }


}
