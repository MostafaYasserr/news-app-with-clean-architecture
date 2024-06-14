import 'package:news_app_with_clean_architecture/core/databases/api/end_points.dart';
import 'package:news_app_with_clean_architecture/features/get_news/data/models/sub_models/source_model.dart';
import 'package:news_app_with_clean_architecture/features/get_news/domain/entities/news_entity.dart';
import 'package:news_app_with_clean_architecture/features/get_news/domain/entities/sub_entities/source_entity.dart';

class NewsModel extends NewsEntity {
  final String? url;
  NewsModel({
      required super.source,
      required super.title,
      required super.description,
      required super.urlToImage,
      required super.publishedAt,
      required super.content,
      required this.url,
      });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      source: SourceModel.fromJson(json[ApiKey.source]),
      title: json[ApiKey.title],
      description: json[ApiKey.description],
      urlToImage: json[ApiKey.urlToImage],
      publishedAt: json[ApiKey.publishedAt],
      content: json[ApiKey.content],
      url: json[ApiKey.url],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      ApiKey.source: source,
      ApiKey.title: title,
      ApiKey.description: description,
      ApiKey.urlToImage: urlToImage,
      ApiKey.publishedAt: publishedAt,
      ApiKey.content: content,
      ApiKey.url: url,
    };
  }
}
