import 'package:flutter/material.dart';

import 'package:newsapp/app/feature/pages/home/model/newsModel.dart';

class NewsCard extends StatelessWidget {
  final News news;

  // ignore: use_key_in_widget_constructors
  const NewsCard(this.news);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 180,
                  width: double.infinity,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Image.network(
                    news.media?? "https://static.wikia.nocookie.net/awakening-of-the-rebellion/images/c/c4/Missing_Image.jpg/revision/latest?cb=20200516103417",
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              news.title ?? "Title Not Found",
              maxLines: 2,
              style: const TextStyle(
                  fontFamily: 'avenir', fontWeight: FontWeight.w800),
              overflow: TextOverflow.ellipsis,
            ),
            // const SizedBox(height: 8),
            // if (movie.imdbid != null)
            //   Container(
            //     decoration: BoxDecoration(
            //       color: Colors.green,
            //       borderRadius: BorderRadius.circular(12),
            //     ),
            //     padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
            //     child: Row(
            //       mainAxisSize: MainAxisSize.min,
            //       children: [
            //         Text(
            //           movie.imdbrating.toString(),
            //           style: const TextStyle(color: Colors.white),
            //         ),
            //         const Icon(
            //           Icons.star,
            //           size: 16,
            //           color: Colors.white,
            //         ),
            //       ],
            //     ),
            //   ),
            const SizedBox(height: 8),
            Text(news.cleanUrl?? "source not found",
                style: const TextStyle(fontSize: 32, fontFamily: 'avenir')),
          ],
        ),
      ),
    );
  }
}