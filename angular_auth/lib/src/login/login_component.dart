import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_router/angular_router.dart';

import 'package:core_auth/core_auth.dart';
import 'package:angular_auth/src/route_paths.dart';
import 'package:angular_auth/src/services/services.dart';

@Component(
    selector: 'login',
    styleUrls: ['login_component.css'],
    templateUrl: 'login_component.html',
    directives: [
      coreDirectives,
      formDirectives,
      materialInputDirectives,
      MaterialButtonComponent,
      MaterialIconComponent,
    ],
    providers: [
      ClassProvider(AuthService),
      ClassProvider(LoginBloc),
      ClassProvider(AuthenticationBloc)
    ])
class LoginComponent implements OnActivate, CanNavigate {
  final AuthService _authService;
  final Router _router;

  User credentials = User(null, null);

  LoginComponent(this._authService, this._router);

  void loginUser() {
    _authService.loginBloc.add(LoginButtonPressed(
      username: credentials.username,
      password: credentials.password,
    ));

    _authService.authBloc.listen((state) {
      if (state is AuthenticationAuthenticated) {
        _authService.authenticated = true;
        _router.navigate(RoutePaths.dashboard.toUrl());
      } else {
        _authService.authenticated = false;
        _router.navigate(RoutePaths.login.toUrl());
      }
    });
  }

  @override
  void onActivate(_, RouterState current) async {
    print('LoginComponent: onActivate: ${_?.toUrl()} -> ${current?.toUrl()}');
  }

  @override
  Future<bool> canNavigate() async {
    if (_authService.authenticated) {
      return true;
    }
    return false;
  }
}
