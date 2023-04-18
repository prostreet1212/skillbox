import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homework_1/blocs/department_bloc.dart';
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
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Kdrc'),
          bottom: TabBar(tabs: [
            Tab(
              text: 'Все записи',
            ),
            Tab(
              text: 'Отделения организации',
            ),
          ]),
        ),
        body: TabBarView(
          children: [
            BlocBuilder<PostBloc, Future<List<Post>>>(
              builder: (_, state) {
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
                          List<Post> postList = snapshot.data!;
                          return ListView.builder(
                            itemCount: postList.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  showModalBottomSheet(
                                      context: context,
                                      builder: (context) {
                                        return Padding(
                                          padding: EdgeInsets.all(8),
                                          child: Wrap(
                                            children: [
                                              Align(
                                                alignment: Alignment.topCenter,
                                                child: Text(
                                                  postList[index].title!.rendered!,
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.bold),
                                                ),
                                              ),
                                              Text(postList[index]
                                                  .excerpt!
                                                  .rendered!),
                                            ],
                                          ),
                                        );
                                      });
                                },
                                child: Card(
                                  child: Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 120,
                                          child: Image.network(postList[index]
                                              .betterFeaturedImage!
                                              .mediaDetails!
                                              .sizes!
                                              .mediumLarge!
                                              .sourceUrl!),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Flexible(
                                          child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Text(postList[index]
                                                  .date!
                                                  .substring(0, 10)),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                postList[index].title!.rendered!,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20),
                                              ),
                                              //Text(snapshot.data![0].excerpt!.rendered!),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
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
            BlocBuilder<DepartmentBloc, Future<List<Post>>>(
              builder: (_, state) {
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
                          List<Post> postList = snapshot.data!;
                          return ListView.builder(
                            itemCount: postList.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  showModalBottomSheet(
                                      context: context,
                                      builder: (context) {
                                        return Padding(
                                          padding: EdgeInsets.all(8),
                                          child: Wrap(
                                            children: [
                                              Align(
                                                alignment: Alignment.topCenter,
                                                child: Text(
                                                  postList[index].title!.rendered!,
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.bold),
                                                ),
                                              ),
                                              Text(postList[index]
                                                  .excerpt!
                                                  .rendered!),
                                            ],
                                          ),
                                        );
                                      });
                                },
                                child: Card(
                                  child: Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 120,
                                          child: Image.network(postList[index]
                                              .betterFeaturedImage!
                                              .mediaDetails!
                                              .sizes!
                                              .mediumLarge!
                                              .sourceUrl!),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Flexible(
                                          child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Text(postList[index]
                                                  .date!
                                                  .substring(0, 10)),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                postList[index].title!.rendered!,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20),
                                              ),
                                              //Text(snapshot.data![0].excerpt!.rendered!),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
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

          ],
        ),
      ),
    );
  }
}
