import 'package:cached_network_image/cached_network_image.dart';
import 'package:news/widgets/loading_indicator.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:flutter/material.dart';
import 'package:news/app_theme.dart';

class NewsItem extends StatelessWidget {
  const NewsItem({super.key});

  @override
  Widget build(BuildContext context) {
final fifteenAgo = DateTime.now().subtract(const Duration(minutes: 30));

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: CachedNetworkImage(            
              imageUrl: 'https://www.damaneimmo.ma/wp-content/themes/Damane_immo/images/no_image.png',
               placeholder: (_,__) => const LoadingIndicator(),
                    errorWidget: (_,__,___) => const Icon(Icons.error),
              height: MediaQuery.sizeOf(context).height * 0.25,
              width: double.infinity,
              fit: BoxFit.fill,
              ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text('BBC news',
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
            fontSize: 10,
            color: AppTheme.navy
          ),
          ),
          Text("Why are football's biggest clubs starting a new tournament?",
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.w500,
            color: AppTheme.black
          ),
          ),
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: Text(timeago.format(fifteenAgo)))
        ],
      ),
    );
  }
}