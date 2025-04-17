
import 'package:eazifly_student/data/data_source/remote_data_source.dart';
import 'package:eazifly_student/data/repo/repo.dart';
import 'package:eazifly_student/domain/base_repo/repo.dart';
import 'package:get_it/get_it.dart';

GetIt sl = GetIt.instance;

class ServiceLocator {
  init() {
    sl.registerLazySingleton<BaseRemoteDataSource>(() => RemoteDataSource());
    sl.registerLazySingleton<BaseRepository>(
        () => Repository(baseRemoteDataSource: sl()));
  }
}
