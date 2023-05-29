


import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class MyBloc implements FlutterSecureStorage{
  @override
  // TODO: implement aOptions
  AndroidOptions get aOptions => throw UnimplementedError();

  @override
  Future<bool> containsKey({required String key, IOSOptions? iOptions, AndroidOptions? aOptions, LinuxOptions? lOptions, WebOptions? webOptions, MacOsOptions? mOptions, WindowsOptions? wOptions}) {
    // TODO: implement containsKey
    throw UnimplementedError();
  }

  @override
  Future<void> delete({required String key, IOSOptions? iOptions, AndroidOptions? aOptions, LinuxOptions? lOptions, WebOptions? webOptions, MacOsOptions? mOptions, WindowsOptions? wOptions}) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<void> deleteAll({IOSOptions? iOptions, AndroidOptions? aOptions, LinuxOptions? lOptions, WebOptions? webOptions, MacOsOptions? mOptions, WindowsOptions? wOptions}) {
    // TODO: implement deleteAll
    throw UnimplementedError();
  }

  @override
  // TODO: implement iOptions
  IOSOptions get iOptions => throw UnimplementedError();

  @override
  // TODO: implement lOptions
  LinuxOptions get lOptions => throw UnimplementedError();

  @override
  // TODO: implement mOptions
  MacOsOptions get mOptions => throw UnimplementedError();

  @override
  Future<String?> read({required String key, IOSOptions? iOptions, AndroidOptions? aOptions, LinuxOptions? lOptions, WebOptions? webOptions, MacOsOptions? mOptions, WindowsOptions? wOptions}) {
    // TODO: implement read
    throw UnimplementedError();
  }

  @override
  Future<Map<String, String>> readAll({IOSOptions? iOptions, AndroidOptions? aOptions, LinuxOptions? lOptions, WebOptions? webOptions, MacOsOptions? mOptions, WindowsOptions? wOptions}) {
    // TODO: implement readAll
    throw UnimplementedError();
  }

  @override
  // TODO: implement wOptions
  WindowsOptions get wOptions => throw UnimplementedError();

  @override
  // TODO: implement webOptions
  WebOptions get webOptions => throw UnimplementedError();

  @override
  Future<void> write({required String key, required String? value, IOSOptions? iOptions, AndroidOptions? aOptions, LinuxOptions? lOptions, WebOptions? webOptions, MacOsOptions? mOptions, WindowsOptions? wOptions}) {
    // TODO: implement write
    throw UnimplementedError();
  }




}