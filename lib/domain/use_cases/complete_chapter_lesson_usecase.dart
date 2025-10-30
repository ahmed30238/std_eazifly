import 'package:dartz/dartz.dart';
import 'package:eazifly_student/core/base_usecase/base_usecase.dart';
import 'package:eazifly_student/core/general_failure/failure.dart';
import 'package:eazifly_student/domain/base_repo/repo.dart';
import 'package:eazifly_student/domain/entities/my_programs/content/complete_chapter_lesson_entity.dart';

class CompleteChapterLessonUsecase
    extends
        BaseUsecase<
          CompleteChapterLessonEntity,
          CompleteChapterLessonParameters
        > {
  final BaseRepository baseRepository;

  CompleteChapterLessonUsecase({required this.baseRepository});

  @override
  Future<Either<Failure, CompleteChapterLessonEntity>> call({
    required CompleteChapterLessonParameters parameter,
  }) async {
    return await baseRepository.completeChapterLesson(
      lessonId: parameter.lessonId,
    );
  }
}

class CompleteChapterLessonParameters {
  final int lessonId;

  CompleteChapterLessonParameters({required this.lessonId});
}
