import 'package:core_auth/core_auth.dart';

import 'package:angular_auth/src/services/services.dart';

class AuthService {
  AuthenticationBloc authBloc;
  LoginBloc loginBloc;
  UserSession session;
  bool authenticated = false;

  AuthService(StorageService _storageService) {
    authBloc = AuthenticationBloc(storageProvider: _storageService);
    loginBloc = LoginBloc(storageProvider: _storageService, authenticationBloc: authBloc);
    _storageService.hasToken(Endpoints.sessionStorageKey).then((session) {
      var inSession = session?.token?.isNotEmpty ?? false;
      if (inSession) {
        authenticated = true;
      } else {
        authenticated = false;
        _storageService.deleteToken(Endpoints.sessionStorageKey);
      }
    });
  }
}
