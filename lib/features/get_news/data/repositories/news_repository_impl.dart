import 'package:dartz/dartz.dart';
import 'package:news_app_with_clean_architecture/core/connection/network_info.dart';
import 'package:news_app_with_clean_architecture/core/errors/exceptions.dart';
import 'package:news_app_with_clean_architecture/core/errors/failure.dart';
import 'package:news_app_with_clean_architecture/features/get_news/domain/entities/news_entity.dart';
import 'package:news_app_with_clean_architecture/features/get_news/domain/repositories/news_repository.dart';
import '../data_sources/news_local_data_source/news_local_data_source.dart';
import '../data_sources/news_remote_data_source/news_remote_data_source.dart';

class NewsRepositoryImpl extends NewsRepository{

  final NetworkInfo networkInfo;
  final NewsRemoteDataSource remoteDataSource;
  final NewsLocalDataSource localDataSource;

  NewsRepositoryImpl({
    required this.networkInfo,
    required this.remoteDataSource,
    required this.localDataSource,
  });


  @override
  Future<Either<Failure, List<NewsEntity>>> getNews() async {
    if(await networkInfo.isConnected!){
    try {
      final remoteNews = await remoteDataSource.getNews();
      localDataSource.cacheNews(remoteNews);
      return Right(remoteNews);
    } on ServerException catch (e) {
      return Left(Failure(errMessage: e.errorModel.errorMessage));
    }
    }else{
      try {
        final localNews = await localDataSource.getCachedNews();
        if(localNews.isNotEmpty){
          return Right(localNews);
            }else{
          return Left(Failure(errMessage: 'No cached news'));
        }
      }
      on CacheException catch (e) {
        return Left(Failure(errMessage: e.errorMessage));
      }
    }
  }

}