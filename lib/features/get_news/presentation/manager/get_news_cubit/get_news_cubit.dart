import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:news_app_with_clean_architecture/features/get_news/domain/use_cases/get_news_use_case.dart';
import '../../../domain/entities/news_entity.dart';
part 'get_news_state.dart';

class GetNewsCubit extends Cubit<GetNewsState> {
  GetNewsCubit({required this.getNewsUseCase}) : super(GetNewsInitial());
  GetNewsUseCase getNewsUseCase ;

  void getNews() async{
    emit(GetNewsLoading());
    final failureOrNews = await getNewsUseCase.call();
    failureOrNews.fold(
            (failure) => emit(GetNewsFailure(errMessage: failure.errMessage)),
            (news) =>emit(GetNewsSuccess(news: news))
    );
  }
}

// import 'package:bloc/bloc.dart';
// import 'package:data_connection_checker_tv/data_connection_checker.dart';
// import 'package:dio/dio.dart';
// import 'package:news_app_with_clean_architecture/core/connection/network_info.dart';
// import 'package:news_app_with_clean_architecture/core/databases/api/dio_consumer.dart';
// import 'package:news_app_with_clean_architecture/core/databases/cache/cache_helper.dart';
// import 'package:news_app_with_clean_architecture/features/get_news/data/data_sources/news_local_data_source/news_local_data_source.dart';
// import 'package:news_app_with_clean_architecture/features/get_news/data/data_sources/news_remote_data_source/news_remote_data_source.dart';
// import 'package:news_app_with_clean_architecture/features/get_news/data/repositories/news_repository_impl.dart';
// import 'package:news_app_with_clean_architecture/features/get_news/domain/use_cases/get_news_use_case.dart';
//
// import '../../../domain/entities/news_entity.dart';
//
// part 'get_news_state.dart';
//
// class GetNewsCubit extends Cubit<GetNewsState> {
//   GetNewsCubit() : super(GetNewsInitial());
//
//   void getNews() async{
//     emit(GetNewsLoading());
//    final failureOrNews = await GetNewsUseCase(repository: NewsRepositoryImpl(
//         networkInfo: NetworkInfoImpl(DataConnectionChecker()),
//         remoteDataSource: NewsRemoteDataSource(api: DioConsumer(dio: Dio())),
//         localDataSource: NewsLocalDataSource(cache: CacheHelper()),
//     )).call();
//    failureOrNews.fold(
//          (failure) => emit(GetNewsFailure(errMessage: failure.errMessage)),
//          (news) =>emit(GetNewsSuccess(news: news))
//    );
//   }
// }