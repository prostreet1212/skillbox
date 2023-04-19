import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homework_1/ui/widgets/department_item.dart';

import '../../blocs/department_bloc.dart';
import '../../models/post.dart';


class DepartmentTab extends StatelessWidget {
  const DepartmentTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<DepartmentBloc, Future<List<Post>>>(
      builder: (_, state) {
        return FutureBuilder(
          future: state,
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case ConnectionState.done:
                if (snapshot.hasError) {
                  return const Center(
                    child: Text('Ошибка загрузки данных'),
                  );
                } else {
                  List<Post> postList = snapshot.data!;
                  return ListView.builder(
                    itemCount: postList.length,
                    itemBuilder: (context, index) {
                      return getDepartmentItem(context, postList[index]);
                    },
                  );
                }
              default:
                return const Center(
                  child: Text('Что-то пошло не так'),
                );
            }
          },
        );
      },
    );

  }
}
