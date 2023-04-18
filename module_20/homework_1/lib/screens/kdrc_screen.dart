import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homework_1/blocs/post_bloc.dart';
import 'package:homework_1/models/post.dart';
import 'package:homework_1/utils/utils.dart';
/*
class KdrcScreen extends StatefulWidget {
  const KdrcScreen({Key? key}) : super(key: key);

  @override
  State<KdrcScreen> createState() => _KdrcScreenState();
}

class _KdrcScreenState extends State<KdrcScreen> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Kdrc'),
        ),
        body:BlocBuilder<PostBloc,Future<List<Post>>>(
        builder:(_,state){
          return FutureBuilder(
          future: state,
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Center(
                  child: CircularProgressIndicator(),
                );
              case ConnectionState.done:
                if (snapshot.hasError) {
                  return Center(
                    child: Text('Ошибка загрузки данных'),
                  );
                } else {
                  return Column(
                    children: [
                      Text(snapshot.data![0].title!.rendered!),
                      Text(snapshot.data![0].excerpt!.rendered!),
                      Image.network(snapshot.data![0].betterFeaturedImage!.mediaDetails!.sizes!.wptouchNewThumbnail!.sourceUrl!),
                    ],
                  );
                }
              default:
                return Center(
                  child: Text('Что-то пошло не так'),
                );
            }
          },
        );
        },
    ),
    );

  }
}
*/


class KdrcScreen extends StatelessWidget {
  const KdrcScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kdrc'),
      ),
      body:BlocBuilder<PostBloc,Future<List<Post>>>(
        builder:(_,state){
          return FutureBuilder(
            future: state,
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                case ConnectionState.done:
                  if (snapshot.hasError) {
                    return Center(
                      child: Text('Ошибка загрузки данных'),
                    );
                  } else {
                    List<Post> postList=snapshot.data!;
                    return ListView.separated(
                      itemCount: postList.length,
                        itemBuilder: (context,index){
                        return Card(
                          child: Row(
                            children: [
                              Image.network(snapshot.data![index].betterFeaturedImage!.mediaDetails!.sizes!.wptouchNewThumbnail!.sourceUrl!),
                            ],
                          ),
                        );
                        },
                        separatorBuilder: (context,index){
                        return Divider(thickness: 5,color: Colors.black,);
                        },

                    );
                    /*Column(
                      children: [
                        Text(snapshot.data![0].title!.rendered!),
                        Text(snapshot.data![0].excerpt!.rendered!),
                        Image.network(snapshot.data![0].betterFeaturedImage!.mediaDetails!.sizes!.wptouchNewThumbnail!.sourceUrl!),
                      ],
                    );*/
                  }
                default:
                  return Center(
                    child: Text('Что-то пошло не так'),
                  );
              }
            },
          );
        },
      ),
    );
  }
}
