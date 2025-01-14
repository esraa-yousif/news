import 'package:cached_network_image/cached_network_image.dart';
import 'package:news/models/news_responcse/news.dart';
import 'package:news/news/news_details.dart';
import 'package:news/widgets/loading_indicator.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:flutter/material.dart';
import 'package:news/app_theme.dart';

class NewsItem extends StatelessWidget {
  const NewsItem(
    this.news, {
    super.key,
  });

  final News news;

  @override
  Widget build(BuildContext context) {

    // final fifteenAgo = DateTime.now().subtract(const Duration(minutes: 30));

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NewsDetails(news)),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: CachedNetworkImage(
                imageUrl: news.urlToImage ??
                    'https://www.damaneimmo.ma/wp-content/themes/Damane_immo/images/no_image.png',
                placeholder: (_, __) => const LoadingIndicator(),
                errorWidget: (_, __, ___) => const Icon(Icons.error),
                height: MediaQuery.sizeOf(context).height * 0.25,
                width: double.infinity,
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              news.source!.name ?? '',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall
                  ?.copyWith(fontSize: 10, color: AppTheme.navy),
            ),
            Text(
              news.title ?? '',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w500, color: AppTheme.black),
            ),
            Align(
                alignment: AlignmentDirectional.centerEnd,
                child: Text(timeago.format(news.publishedAt!)))
          ],
        ),
      ),
    );
  }
}
