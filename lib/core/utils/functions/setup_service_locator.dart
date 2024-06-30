import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../../../features/get_news/data/data_sources/news_local_data_source/news_local_data_source.dart';
import '../../../features/get_news/data/data_sources/news_remote_data_source/news_remote_data_source.dart';
import '../../../features/get_news/data/repositories/news_repository_impl.dart';
import '../../connection/network_info.dart';
import '../../databases/api/dio_consumer.dart';
import '../../databases/cache/cache_helper.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<DioConsumer>(
      DioConsumer(dio: Dio()),
  );
  getIt.registerSingleton<NewsRepositoryImpl>(
      NewsRepositoryImpl(
          networkInfo:
          NetworkInfoImpl(DataConnectionChecker()),
          remoteDataSource: NewsRemoteDataSource(
              api: getIt.get<DioConsumer>()
          ),
          localDataSource:
          NewsLocalDataSource(cache: CacheHelper()))
  );
}