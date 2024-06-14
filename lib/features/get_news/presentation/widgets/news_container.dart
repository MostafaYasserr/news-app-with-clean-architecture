import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app_with_clean_architecture/core/utils/constants.dart';
import 'package:news_app_with_clean_architecture/features/get_news/domain/entities/news_entity.dart';
import 'package:news_app_with_clean_architecture/features/get_news/presentation/pages/news_details_screen.dart';

class NewsContainer extends StatelessWidget {
  const NewsContainer({super.key,
    required this.newsEntity,
  });
  final NewsEntity newsEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, NewsDetailsScreen.id, arguments: newsEntity);
        },
        child: Column(
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
                 fontSize: 18,
                 fontWeight: FontWeight.w500,
               ),
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
          ],
        ),
      ),
    );
  }
}