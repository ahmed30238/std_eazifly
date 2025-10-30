import 'package:dartz/dartz.dart';
import 'package:eazifly_student/core/base_usecase/base_usecase.dart';
import 'package:eazifly_student/core/general_failure/failure.dart';
import 'package:eazifly_student/data/models/order_and_subscribe/assign_appointments/add_weekly_appointments_tojson.dart';
import 'package:eazifly_student/domain/base_repo/repo.dart';
import 'package:eazifly_student/domain/entities/add_weekly_appointments_entity.dart';

class AddWeeklyAppointmentsUsecase
    extends
        BaseUsecase<
          AddWeeklyAppontmentsEntity,
          AddWeeklyAppointmentsParameters
        > {
  final BaseRepository baseRepository;

  AddWeeklyAppointmentsUsecase({required this.baseRepository});

  @override
  Future<Either<Failure, AddWeeklyAppontmentsEntity>> call({
    required AddWeeklyAppointmentsParameters parameter,
  }) async {
    return await baseRepository.addWeeklyAppointments(data: parameter.data);
  }
}

class AddWeeklyAppointmentsParameters {
  final AddWeeklyAppointmentsTojson data;

  AddWeeklyAppointmentsParameters({required this.data});
}
