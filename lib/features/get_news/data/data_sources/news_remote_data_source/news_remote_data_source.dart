import 'package:news_app_with_clean_architecture/core/databases/api/api_consumer.dart';
import 'package:news_app_with_clean_architecture/core/databases/api/end_points.dart';
import 'package:news_app_with_clean_architecture/features/get_news/data/models/news_model.dart';

class NewsRemoteDataSource{
  final ApiConsumer api;

  NewsRemoteDataSource({required this.api});
  Future<List<NewsModel>> getNews ()async{
    final response = await api.get(EndPoints.topHeadlines + ApiKey.apiKey);
    List<NewsModel> newsDataList = [];
    for (var item in response[ApiKey.articles]) {
      newsDataList.add(NewsModel.fromJson(item));
    }
    return newsDataList;
  }
}