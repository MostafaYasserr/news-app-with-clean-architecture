import 'package:dartz/dartz.dart';
import 'package:news_app_with_clean_architecture/features/get_news/domain/entities/news_entity.dart';
import '../../../../core/errors/failure.dart';
import '../repositories/news_repository.dart';

class GetNewsUseCase {
  final NewsRepository repository;

  GetNewsUseCase({required this.repository});

  Future<Either<Failure, List<NewsEntity>>> call() async {
    return await repository.getNews();
  }
}