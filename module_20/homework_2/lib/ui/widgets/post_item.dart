import 'package:flutter/material.dart';

import '../../models/post.dart';

class PostItem extends StatelessWidget {
  const PostItem({Key? key, required this.post}) : super(key: key);
  final Post post;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
            context: context,
            builder: (context) {
              return Padding(
                padding: const EdgeInsets.all(8),
                child: Wrap(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        post.title!.rendered!,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(post.excerpt!.rendered!),
                  ],
                ),
              );
            });
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              SizedBox(
                width: 120,
                child: Image.asset(post.betterFeaturedImage!.mediaDetails!
                    .sizes!.mediumLarge!.sourceUrl!),
              ),
              const SizedBox(
                width: 10,
              ),
              Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(post.date!.substring(0, 10)),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      post.title!.rendered!,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
