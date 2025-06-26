import 'package:eazifly_student/core/service_locator/service_locator.dart';
import 'package:eazifly_student/data/models/order_and_subscribe/assign_appointments/add_weekly_appointments_tojson.dart';
import 'package:eazifly_student/data/models/order_and_subscribe/assign_appointments/create_meeting_sessions_tojson.dart';
import 'package:eazifly_student/domain/entities/add_weekly_appointments_entity.dart';
import 'package:eazifly_student/domain/entities/children_entities/get_my_children_entity.dart';
import 'package:eazifly_student/domain/entities/create_meeting_sessions_entity.dart';
import 'package:eazifly_student/domain/entities/get_order_details_entity.dart';
import 'package:eazifly_student/domain/use_cases/add_weekly_appointments_usecase.dart';
import 'package:eazifly_student/domain/use_cases/create_meeting_assignment_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_children_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_order_details_usecase.dart';
import 'package:eazifly_student/presentation/controller/add_new_student_data_to_program_controller/add_new_student_data_to_program_cubit.dart';
import 'package:eazifly_student/presentation/controller/layout/layout_cubit.dart';
import 'package:eazifly_student/presentation/controller/set_appointment_controller/setappointments_cubit.dart';
import 'package:eazifly_student/presentation/view/group_package_management_view/widgets/chosen_lecturer.dart';
import 'package:eazifly_student/presentation/view/group_package_management_view/widgets/chosen_student_body.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

part 'grouppackagemanagement_state.dart';

class GrouppackagemanagementCubit extends Cubit<GrouppackagemanagementState> {
  GrouppackagemanagementCubit({
    required this.getChildrenUsecase,
    required this.addWeeklyAppointmentsUsecase,
    required this.createMeetingSessionsUsecase,
    required this.getOrderDetailsUsecase,
  }) : super(GrouppackagemanagementInitial());

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

  List<Widget> bodies = [
    const SizedBox(),
    BlocProvider(
      create: (context) => AddNewStudentDataToProgramCubit(
        createNewChildUsecase: sl(),
      ),
      child: const ChosenStudentBody(),
    ),
    BlocProvider(
      create: (context) => SetappointmentsCubit(),
      child: const ChosenLecturer(),
    ),
  ];

  bool addMyself = false;
  toggleMyself() {
    addMyself = !addMyself;
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
  Future<void> getMyOrders({required int orderId}) async {
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

  Future<void> addWeeklyAppointments({required int orderId}) async {
    addWeeklyAppointmentsLoader = true;
    emit(AddWeeklyAppointmentsLoadingState());

    final result = await addWeeklyAppointmentsUsecase.call(
      parameter: AddWeeklyAppointmentsParameters(
        data: AddWeeklyAppointmentsTojson(
          startDate: "",
          userId: 3,
          duration: 30,
          subscripeDays: 50,
          numberOfSessions: 5,
          appointments: {},
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
}
