import 'package:flutter/material.dart';
import 'package:news_app_with_clean_architecture/core/databases/cache/cache_helper.dart';
import 'package:news_app_with_clean_architecture/news_app.dart';

import 'core/utils/functions/setup_service_locator.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper().init();
  setupServiceLocator();
  runApp(const NewsApp());
}