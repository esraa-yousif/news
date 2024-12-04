import 'package:flutter/material.dart';
import 'package:news/app_theme.dart';
import 'package:news/models/news_responcse/news.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:url_launcher/url_launcher_string.dart';

class NewsDetails extends StatelessWidget {
  const NewsDetails(
    this.news, {
    super.key,
  });

  final News news;
  static const String routeName = '/newsDetails';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.primary,
        title: const Text('News Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.network(
                news.urlToImage ??
                    'https://www.damaneimmo.ma/wp-content/themes/Damane_immo/images/no_image.png',
                height: MediaQuery.sizeOf(context).height * 0.25,
                width: double.infinity,
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              news.source?.name ?? '',
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
            const SizedBox(
              height: 8,
            ),
            Align(
                alignment: AlignmentDirectional.centerEnd,
                child: Text(timeago.format(news.publishedAt!),
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: const Color(0xFFA3A3A3),
                        fontWeight: FontWeight.w400,
                        fontSize: 13))),
            const SizedBox(
              height: 12,
            ),
            Text(news.content ?? '',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: AppTheme.black, fontWeight: FontWeight.w300)),
            const SizedBox(
              height: 20,
            ),        
            news.url != null
                ? GestureDetector(
                    onTap: () {
                      launchUrlString(news.url!);
                    },
                    child: Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: Text('view full articles',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: AppTheme.navy,
                                ))))
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}
