import 'package:flutter/material.dart';

import '../../models/post.dart';

/*class PostItem extends StatelessWidget {
   PostItem({Key? key, required this.post}) : super(key: key);
  final Post post;
  String text='';

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
                    //Text(post.excerpt!.rendered!),
                    Text(text),
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
              post.betterFeaturedImage!.mediaDetails!
                  .sizes!.mediumLarge!=null?SizedBox(
                width: 120,
                child: Image.network(post.betterFeaturedImage!.mediaDetails!
                    .sizes!.videoThumb!.sourceUrl!),
              ):const SizedBox(width: 120,),
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
}*/


class PostItem extends StatefulWidget {
    PostItem({Key? key,required this.post}) : super(key: key);

  final Post post;

   String?  get defaultX =>post.title!.rendered!;
  String text1='';

  @override
  State<PostItem> createState() => _PostItemState();
}

class _PostItemState extends State<PostItem> {
  //widget.text=widget.post.title!.rendered!;
  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () {

        setState(() {
          //widget.text='текст';
          widget.text1='текст';
        });
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
                        widget.post.title!.rendered!,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(widget.post.excerpt!.rendered!),
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
              widget.post.betterFeaturedImage!.mediaDetails!
                  .sizes!.mediumLarge!=null?SizedBox(
                width: 120,
                child: Image.network(widget.post.betterFeaturedImage!.mediaDetails!
                    .sizes!.videoThumb!.sourceUrl!),
              ):const SizedBox(width: 120,),
              const SizedBox(
                width: 10,
              ),
              Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.post.date!.substring(0, 10)),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      widget.text1,
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

