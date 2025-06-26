import 'dart:convert';
import 'dart:developer';

import 'package:eazifly_student/core/enums/storage_enum.dart';
import 'package:eazifly_student/core/service_locator/service_locator.dart';
import 'package:eazifly_student/data/models/auth/login_model.dart';
import 'package:eazifly_student/data/models/order_and_subscribe/assign_appointments/add_weekly_appointments_tojson.dart';
import 'package:eazifly_student/data/models/order_and_subscribe/assign_appointments/create_meeting_sessions_tojson.dart';
import 'package:eazifly_student/data/models/order_and_subscribe/assign_appointments/get_instructors_tojson.dart';
import 'package:eazifly_student/domain/entities/add_weekly_appointments_entity.dart';
import 'package:eazifly_student/domain/entities/children_entities/get_my_children_entity.dart';
import 'package:eazifly_student/domain/entities/create_meeting_sessions_entity.dart';
import 'package:eazifly_student/domain/entities/get_instructors_entity.dart';
import 'package:eazifly_student/domain/entities/get_order_details_entity.dart';
import 'package:eazifly_student/domain/use_cases/add_weekly_appointments_usecase.dart';
import 'package:eazifly_student/domain/use_cases/create_meeting_assignment_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_children_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_instructors_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_order_details_usecase.dart';
import 'package:eazifly_student/presentation/controller/add_new_student_data_to_program_controller/add_new_student_data_to_program_cubit.dart';
import 'package:eazifly_student/presentation/controller/layout/layout_cubit.dart';
import 'package:eazifly_student/presentation/controller/set_appointment_controller/setappointments_cubit.dart';
import 'package:eazifly_student/presentation/view/group_package_management_view/widgets/chosen_lecturer.dart';
import 'package:eazifly_student/presentation/view/group_package_management_view/widgets/chosen_student_body.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';
import 'package:get_storage/get_storage.dart';

part 'grouppackagemanagement_state.dart';

class GrouppackagemanagementCubit extends Cubit<GrouppackagemanagementState> {
  GrouppackagemanagementCubit({
    required this.getChildrenUsecase,
    required this.addWeeklyAppointmentsUsecase,
    required this.createMeetingSessionsUsecase,
    required this.getOrderDetailsUsecase,
    required this.getInstructorsUsecase,
  }) : super(GrouppackagemanagementInitial()) {
    loginData = DataModel.fromJson(
      jsonDecode(
        GetStorage().read(
          StorageEnum.loginModel.name,
        ),
      ),
    );
  }

  static GrouppackagemanagementCubit get(context) => BlocProvider.of(context);

  int stepperIndex = 1;
  void incrementStepperIndex(BuildContext context) {
    if (stepperIndex < bodies.length - 1) {
      stepperIndex++;
    } else {
      LayoutCubit.get(context).changeIndex(1);
      Navigator.pushNamedAndRemoveUntil(
        context,
        RoutePaths.layoutPath,
        (route) => false,
      );
    }
    emit(ChangeStepperIndexState());
  }

  void decrementStepperIndex(BuildContext context) {
    if (stepperIndex > 1) {
      stepperIndex--;
    } else {
      Navigator.pop(context);
    }
    emit(ChangeStepperIndexState());
  }

  List<Widget> get bodies => [
    const SizedBox(),
    BlocProvider(
      create: (context) => AddNewStudentDataToProgramCubit(
        createNewChildUsecase: sl(),
      ),
      child: const ChosenStudentBody(),
    ),
    BlocProvider(
      create: (context) => SetappointmentsCubit(),
      child: ChosenLecturer(
        grouppackagemanagementCubit: this,
      ),
    ),
  ];
  DataModel? loginData;
  bool addMyself = false;
  toggleMyself() {
    addMyself = !addMyself;

    if (addMyself && !addedUsersIds.contains(loginData?.id)) {
      addedUsersIds.add(loginData?.id ?? -1);
    } else {
      addedUsersIds.remove(loginData?.id ?? -1);
    }
    log("user id $addedUsersIds");
    // if (addMyself) {
    emit(ToggleAddMySelfState());
  }

  bool getMyChildrenLoader = false;
  GetMyChildrenEntity? getMyChildrenEntity;
  GetChildrenUsecase getChildrenUsecase;

  List<bool> chosen = [];

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
        initIsChosen();
        emit(GetMyChildernSuccessState());
      },
    );
  }

  void initIsChosen() {
    if (getMyChildrenEntity?.data != null) {
      chosen = List.filled(getMyChildrenEntity!.data!.length, false);
    }
  }

  List<int> addedUsersIds = [];
  fillAddedUsersIds(int index) {
    if (chosen[index] &&
        !addedUsersIds.contains(getMyChildrenEntity?.data?[index].id ?? -1)) {
      addedUsersIds.add(getMyChildrenEntity?.data?[index].id ?? -1);
    } else {
      addedUsersIds.remove(getMyChildrenEntity?.data?[index].id ?? -1);
    }
    log("ids {$addedUsersIds}");
  }

  List<MyChildEntity>? addedChildren = [];

  void fillAddedChildrenData() {
    addedChildren = [];
    for (var id in addedUsersIds) {
      addedChildren?.addAll(getMyChildrenEntity?.data
              ?.where((element) => element.id == id)
              .toList() ??
          []);
    }
    if (addedUsersIds.contains(loginData?.id)) {
      addedChildren?.add(
        MyChildEntity(
          firstName: loginData?.firstName,
          lastName: loginData?.lastName,
          image: loginData?.image,
          id: loginData?.id,
        ),
      );
    }
    log("$addedChildren");
  }

  void changeChosen(int index) {
    if (index >= 0 && index < chosen.length) {
      chosen[index] = !chosen[index];
      emit(ChangeChosenState());
    }
  }

// Variables
  bool getMyOrdersLoader = false;
  bool addWeeklyAppointmentsLoader = false;
  bool createMeetingSessionsLoader = false;
  GetOrderDetailsEntity? getOrderDetailsEntity;
  CreateMeetingSessionsEntity? createMeetingSessionsEntity;
  AddWeeklyAppontmentsEntity? addWeeklyAppontmentsEntity;
  GetOrderDetailsUsecase getOrderDetailsUsecase;
  CreateMeetingSessionsUsecase createMeetingSessionsUsecase;
  AddWeeklyAppointmentsUsecase addWeeklyAppointmentsUsecase;

// Methods
  Future<void> getOrderDetails({required int orderId}) async {
    getMyOrdersLoader = true;
    emit(GetMyOrdersLoadingState());

    final result = await getOrderDetailsUsecase.call(
      parameter: GetOrderDetailsPaameters(orderId: orderId),
    );

    result.fold(
      (failure) {
        getMyOrdersLoader = false;
        emit(GetMyOrdersErrorState(failure.message));
      },
      (data) {
        getMyOrdersLoader = false;
        emit(GetMyOrdersSuccessState());
      },
    );
  }

  Future<void> addWeeklyAppointments() async {
    addWeeklyAppointmentsLoader = true;
    emit(AddWeeklyAppointmentsLoadingState());

    final result = await addWeeklyAppointmentsUsecase.call(
      parameter: AddWeeklyAppointmentsParameters(
        data: AddWeeklyAppointmentsTojson(
          startDate: "2025-06-24",
          userId: addedUsersIds[0],
          duration:
              int.tryParse(getOrderDetailsEntity?.data?.duration ?? "-1") ?? -1,
          subscripeDays: int.tryParse(
                  getOrderDetailsEntity?.data?.subscripeDays ?? "-1") ??
              -1,
          numberOfSessions: getOrderDetailsEntity?.data?.numberOfSessions ?? -1,
          appointments: {"monday": "15:00", "thursday": "15:00"},
        ),
      ),
    );

    result.fold(
      (failure) {
        addWeeklyAppointmentsLoader = false;
        emit(AddWeeklyAppointmentsErrorState(failure.message));
      },
      (data) {
        addWeeklyAppointmentsLoader = false;
        emit(AddWeeklyAppointmentsSuccessState());
      },
    );
  }

  Future<void> createMeetingSessions() async {
    createMeetingSessionsLoader = true;
    emit(CreateMeetingSessionsLoadingState());

    final result = await createMeetingSessionsUsecase.call(
      parameter: CreateMeetingSessionsParameters(
        data: CreateMeetingSessionsTojson(
          appointments: addWeeklyAppontmentsEntity!.data!,
          instructorId: 2,
          programContentId: 1,
          programId: 1,
          userId: 3,
        ),
      ),
    );

    result.fold(
      (failure) {
        createMeetingSessionsLoader = false;
        emit(CreateMeetingSessionsErrorState(failure.message));
      },
      (data) {
        createMeetingSessionsLoader = false;
        emit(CreateMeetingSessionsSuccessState());
      },
    );
  }

  bool getInstructorsLoader = false;
  GetInstructorsEntity? getInstructorsEntity;
  GetInstructorsUsecase getInstructorsUsecase;

  Future<void> getInstructors() async {
    getInstructorsLoader = true;
    emit(GetInstructorsLoadingState());

    final result = await getInstructorsUsecase.call(
      parameter: GetInstructorsParameters(
        data: GetInstructorsTojson(
          appointments: addWeeklyAppontmentsEntity!.data!,
          programId: 1,
        ),
      ),
    );
    result.fold(
      (failure) {
        getInstructorsLoader = false;
        emit(GetInstructorsErrorState(failure.message));
      },
      (data) {
        getInstructorsLoader = false;
        getInstructorsEntity = data;
        emit(GetInstructorsSuccessState());
      },
    );
  }

  @override
  Future<void> close() {
    addedChildren = [];
    addMyself = false;
    return super.close();
  }
}
