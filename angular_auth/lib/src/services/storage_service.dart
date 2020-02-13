import 'dart:convert';
import 'dart:html';

import 'package:meta/meta.dart';

import 'package:core_auth/core_auth.dart';

class StorageService implements StorageProvider {
  @override
  Future<UserSession> authenticate({
    @required String username,
    @required String password,
  }) async {
    final inputUser = User(username, password);
    final sampleUser = await fetchSampleUser();
    if (inputUser == sampleUser) {
      return UserSession(
          token: 's2231', userId: 2, username: 'king', role: 'admin');
    } else {
      return null;
    }
  }

  @override
  Future<UserSession> hasToken(String pathOrKey) async {
    var data = window.localStorage[pathOrKey];
    if (data != null) {
      var decodedData = UserSession.fromJson(json.decode(data));
      return decodedData;
    } else {
      return UserSession();
    }
  }

  @override
  Future<void> persistToken(String pathOrKey, UserSession payload) async {
    window.localStorage[pathOrKey] = json.encode(payload);
    return;
  }

  @override
  Future<void> deleteToken(String pathOrKey) async {
    window.localStorage.remove(pathOrKey);
    return;
  }

  Future<User> fetchSampleUser() async {
    return Future.delayed(Duration(seconds: 1), () => User('king', '3210'));
  }
}
