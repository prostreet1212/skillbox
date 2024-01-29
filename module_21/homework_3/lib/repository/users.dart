import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:homework_3/repository/users_helper.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'users.g.dart';

@DataClassName('User')
class Users extends Table{
  IntColumn get id=>integer().autoIncrement()();
  TextColumn get name=>text().withLength(min: 2,max: 20)();
  TextColumn get surname=>text().withLength(min: 2,max: 20)();
}

LazyDatabase _openConnection(){
  return LazyDatabase(() async{
    final dbFolder=await getApplicationDocumentsDirectory();
    final file=File(p.join(dbFolder.path,'user_db.sqlite'));
    return NativeDatabase(file);
  });
}

@DriftDatabase(tables: [Users])
class UserDatabase extends _$UserDatabase{
  UserDatabase():super(_openConnection());

  Future<List<User>> get getAllUsers=>select(users).get();
  //Future<int> insertUser(User user)=>into(users).insert(user);
  Stream<List<User>> get usersStream{
    return select(users).watch();
  }
  Future<int> insertUser(UserHelper userHelper)=>into(users).insert(UsersCompanion.insert(name: userHelper.name,surname: userHelper.surname));
  void deleteUser(int i)=>(delete(users)..where((t) => t.id.equals(i))).go();
  Future<int> updateUser(UserHelper newUser,int id)=>(update(users)..where((t) => t.id.equals(id))).write(UsersCompanion(name: Value(newUser.name),surname: Value(newUser.surname)));
  Future<User> getLastRow() {
    return (select(users)
      ..orderBy([(t) => OrderingTerm(expression: t.id, mode: OrderingMode.desc)])
      ..limit(1)
    ).getSingle();
  }


  @override
  int get schemaVersion => 1;



}

