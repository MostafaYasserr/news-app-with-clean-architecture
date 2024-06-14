import 'dart:convert';
import 'package:news_app_with_clean_architecture/core/databases/cache/cache_helper.dart';
import 'package:news_app_with_clean_architecture/core/errors/exceptions.dart';
import 'package:news_app_with_clean_architecture/features/get_news/data/models/news_model.dart';

class NewsLocalDataSource{
  final CacheHelper cache;
  final String key='CachedNews';
  NewsLocalDataSource({required this.cache});

  cacheNews(List<NewsModel>? newsToCache) async {
    if(newsToCache!=null){
     await cache.saveData(
          key: key,
          value: jsonEncode(newsToCache.map((e) => e.toJson()).toList())
      );
    }else{
      throw CacheException(errorMessage: 'Failed to cache news');
    }
  }

  Future<List<NewsModel>> getCachedNews()async{
    final cachedNews = await cache.getData(key: key);
    if(cachedNews!=null){
      return jsonDecode(cachedNews).map<NewsModel>((e) => NewsModel.fromJson(e)).toList();
    }else{
      throw CacheException(errorMessage: 'Failed to get cached news');
    }
  }


}