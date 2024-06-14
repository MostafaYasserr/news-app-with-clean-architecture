import 'package:news_app_with_clean_architecture/features/get_news/presentation/pages/news_details_screen.dart';
import 'package:news_app_with_clean_architecture/features/get_news/presentation/pages/news_screen.dart';

final appRoutes = {
  NewsScreen.id: (context) => const NewsScreen(),
  NewsDetailsScreen.id: (context) => const NewsDetailsScreen(),
};