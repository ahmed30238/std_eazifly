// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:eazifly_student/core/base_usecase/base_usecase.dart';
import 'package:eazifly_student/core/general_failure/failure.dart';
import 'package:eazifly_student/domain/base_repo/repo.dart';
import 'package:eazifly_student/domain/entities/login_entities.dart';

import 'package:equatable/equatable.dart';

import '../../data/models/auth/login_tojson.dart';

class LoginUsecase extends BaseUsecase<LoginEntity, LoginParameter> {
  final BaseRepository baseRepository;

  LoginUsecase({required this.baseRepository});

  @override
  Future<Either<Failure, LoginEntity>> call({
    required LoginParameter parameter,
  }) async {
    return await baseRepository.login(data: parameter.data);
  }
}

class LoginParameter extends Equatable {
  final LoginToJson data;

  const LoginParameter({required this.data});

  @override
  List<Object> get props => [data];
}
