import 'package:dartz/dartz.dart';
import 'package:news_app_with_clean_architecture/features/get_news/domain/entities/news_entity.dart';
import '../../../../core/errors/failure.dart';
import '../repositories/news_repository.dart';

class GetNews {
  final NewsRepository repository;

  GetNews({required this.repository});

  Future<Either<Failure, List<NewsEntity>>> call() async {
    return await repository.getNews();
  }
}