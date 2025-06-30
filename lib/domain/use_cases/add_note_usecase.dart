import 'package:dartz/dartz.dart';
import 'package:eazifly_student/core/base_usecase/base_usecase.dart';
import 'package:eazifly_student/core/general_failure/failure.dart';
import 'package:eazifly_student/data/models/order_and_subscribe/add_note_tojson.dart';
import 'package:eazifly_student/domain/base_repo/repo.dart';
import 'package:eazifly_student/domain/entities/add_note_entity.dart';

class AddNoteUsecase extends BaseUsecase<
    AddNoteEntity, AddNoteParameters> {
  final BaseRepository baseRepository;

  AddNoteUsecase({required this.baseRepository});

  @override
  Future<Either<Failure, AddNoteEntity>> call(
      {required AddNoteParameters parameter}) async {
    return await baseRepository.addNote(data: parameter.data);
  }
}

class AddNoteParameters {
  final AddNoteTojson data;

  AddNoteParameters({required this.data});
}
