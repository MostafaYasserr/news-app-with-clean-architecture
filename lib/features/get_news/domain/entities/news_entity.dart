import 'package:news_app_with_clean_architecture/features/get_news/domain/entities/sub_entities/source_entity.dart';

class NewsEntity{
  final SourceEntity? source;
  final String? title;
  final String? description;
  final String? urlToImage;
  final String? publishedAt;
  final String? content;

  NewsEntity({
    required this.source,
    required this.title,
    required this.description,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });
}