import 'package:dartz/dartz.dart';
import 'package:eazifly_student/core/base_usecase/base_usecase.dart';
import 'package:eazifly_student/core/general_failure/failure.dart';
import 'package:eazifly_student/domain/base_repo/repo.dart';
import 'package:eazifly_student/domain/entities/my_programs/content/get_content_chapter.dart';

class GetContentChapterUsecase
    extends BaseUsecase<GetContentChapterEntity, GetContentChapterParameters> {
  final BaseRepository baseRepository;
  GetContentChapterUsecase({required this.baseRepository});

  @override
  Future<Either<Failure, GetContentChapterEntity>> call(
      {required GetContentChapterParameters parameter}) async {
    return await baseRepository.getContentChapters(
      userId: parameter.userId,
    );
  }
}

class GetContentChapterParameters {
  final int userId;

  GetContentChapterParameters({required this.userId});
}
