import 'package:dartz/dartz.dart';
import 'package:eazifly_student/core/general_failure/failure.dart';
import 'package:equatable/equatable.dart';

abstract class BaseUsecase<T, Parameter> {
  Future<Either<Failure, T>> call({required Parameter parameter});
}

class NoParameter extends Equatable {
  @override
  List<Object?> get props => [];
}
