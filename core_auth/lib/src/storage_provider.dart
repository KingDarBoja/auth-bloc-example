import 'package:core_auth/src/models/models.dart';

abstract class StorageProvider {
  Future<UserSession> authenticate({String username, String password});
  /// Get/Load Token from LocalStorage or keychain/keystring.
  Future<UserSession> hasToken(String pathOrKey);
  /// Set/Persist Token to LocalStorage or keychain/keystring.
  Future<void> persistToken(String pathOrKey, UserSession data);
  /// Delete Token from LocalStorage or keychain/keystring.
  Future<void> deleteToken(String pathOrKey);
}