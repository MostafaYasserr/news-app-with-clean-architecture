import 'package:dartz/dartz.dart';
import 'package:news_app_with_clean_architecture/core/errors/failure.dart';
import 'package:news_app_with_clean_architecture/features/get_news/domain/entities/news_entity.dart';

abstract class NewsRepository {
  Future<Either<Failure, List<NewsEntity>>> getNews();
}