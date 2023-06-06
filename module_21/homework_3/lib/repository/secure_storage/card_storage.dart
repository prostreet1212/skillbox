

import 'package:flutter_secure_storage/flutter_secure_storage.dart';


class CardStorage{

  late Stream<Map<String,String>>  cardStream;

  FlutterSecureStorage storage=const FlutterSecureStorage(
      aOptions: AndroidOptions(encryptedSharedPreferences: true),
      iOptions: IOSOptions(accessibility:KeychainAccessibility.first_unlock)
  );

 /* Future<Map<String,String>> getAllCards()async{
    Map<String,String> a={};
    await storage.readAll().then((value) {
      a=value;
    });
    return a;
  }*/

  Future<Map<String,String>> readAllSecureData() async {
    var allData = await storage.readAll();
    return allData;
  }

  Stream<Map<String,String>> asdf() async* {

      final allValues = await storage.readAll();
      yield allValues;
    }

  FlutterSecureStorage getStorage(){
  return storage;
}

  Future<void>addCard(String key,String cardNumber)async{
   await storage.write(key: key, value: cardNumber);

}

}