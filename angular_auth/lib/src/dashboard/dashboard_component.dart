import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'package:angular_router/angular_router.dart';

import 'package:angular_auth/src/route_paths.dart';
import 'package:angular_auth/src/services/services.dart';
import 'package:core_auth/core_auth.dart';

@Component(
  selector: 'dashboard',
  styleUrls: ['dashboard_component.css'],
  templateUrl: 'dashboard_component.html',
  directives: [
    MaterialButtonComponent,
    MaterialIconComponent,
  ],
  providers: []
)
class DashboardComponent implements CanActivate {
  final AuthService _authService;
    final Router _router;

  DashboardComponent(this._authService, this._router);

  void signOut() {
    _authService.authBloc.add(LoggedOut());
    _router.navigate(RoutePaths.login.toUrl());
    return;
  }

  @override
  Future<bool> canActivate(_, __) async {
    if (_authService.authenticated) {
      return true;
    }
    return false;
  }
}