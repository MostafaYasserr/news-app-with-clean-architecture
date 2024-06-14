import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app_with_clean_architecture/core/utils/constants.dart';
import '../../domain/entities/news_entity.dart';

class NewsDetailsScreen extends StatelessWidget {
  const NewsDetailsScreen({super.key});

  static const String id = 'NewsDetailsScreen';

  @override
  Widget build(BuildContext context) {
    final newsEntity = ModalRoute.of(context)!.settings.arguments as NewsEntity;
    return Scaffold(
      appBar: AppBar(
        title: const Text('News Details'),
      ),
      body: _buildBodyContent(newsEntity),
    );
  }

  Padding _buildBodyContent(NewsEntity newsEntity) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                imageUrl: newsEntity.urlToImage ?? kDefaultImage,
                placeholder: (context, url) {
                  return const CircularProgressIndicator();
                },
                errorWidget: (context, url, error) {
                  return const Icon(
                    Icons.error,
                  );
                },
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              newsEntity.title ?? 'No title available',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 20,
              )
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'source : ${newsEntity.source?.name ?? 'No source available'}',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'published At : ${DateFormat('yyyy-MM-dd').format(DateTime.parse(newsEntity.publishedAt ?? 'No date available'))}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Text(
                'Article body : ' ,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            Text(
              newsEntity.content ?? 'No content available',
            ),
          ],
        ),
      ),
    );
  }
}
