import 'dart:async';
import 'dart:convert';

import 'package:meta/meta.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:core_auth/core_auth.dart';

class StorageService implements StorageProvider {
  SharedPreferences _prefs;

  @override
  Future<void> deleteToken(String pathOrKey) async {
    await getStorageInstance();
    _prefs.remove(pathOrKey);
  }

  @override
  Future<UserSession> hasToken(String pathOrKey) async {
    await getStorageInstance();
    final String instance = _prefs.getString(pathOrKey);
    print('hasTokenInstance => $instance');
    try {
      final decodedData = json.decode(instance);
      final session = UserSession.fromJson(decodedData);
      print('Session => ${session.toJson()}');
      return session;
    } catch (err) {
      print('err => $err');
      return UserSession();
    }
  }

  @override
  Future<void> persistToken(String pathOrKey, UserSession data) async {
    await getStorageInstance();
    final String instance = json.encode(data.toJson());
    print('Instance => $instance');
    _prefs.setString(pathOrKey, instance);
  }

  getStorageInstance() async {
    if (_prefs == null) {
      _prefs = await SharedPreferences.getInstance();
    }
  }

  @override
  Future<UserSession> authenticate(
      {@required String username, @required String password}) async {
    final inputUser = User(username, password);
    final sampleUser = await fetchSampleUser();
    if (inputUser == sampleUser) {
      return UserSession(
          token: 's2231', userId: 2, username: 'king', role: 'admin');
    } else {
      return null;
    }
  }

  Future<User> fetchSampleUser() async {
    return Future.delayed(Duration(seconds: 1), () => User('king', '3210'));
  }
}
