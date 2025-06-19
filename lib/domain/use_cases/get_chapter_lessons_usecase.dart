import 'package:dartz/dartz.dart';
import 'package:eazifly_student/core/base_usecase/base_usecase.dart';
import 'package:eazifly_student/core/general_failure/failure.dart';
import 'package:eazifly_student/domain/base_repo/repo.dart';
import 'package:eazifly_student/domain/entities/my_programs/content/get_chapter_lessons_entity.dart';

class GetChapterLessonsUsecase
    extends BaseUsecase<GetChapterLessonsEntity, GetChapterLessonsParameters> {
  final BaseRepository baseRepository;
  GetChapterLessonsUsecase({required this.baseRepository});

  @override
  Future<Either<Failure, GetChapterLessonsEntity>> call(
      {required GetChapterLessonsParameters parameter}) async {
    return await baseRepository.getChapterLessons(
      chapterId: parameter.chapterId,
    );
  }
}

class GetChapterLessonsParameters {
  final int chapterId;

  GetChapterLessonsParameters({required this.chapterId});
}
