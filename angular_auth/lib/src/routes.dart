import 'package:angular_router/angular_router.dart';

import 'package:angular_auth/src/route_paths.dart';
import 'package:angular_auth/src/login/login_component.template.dart' as login_template;
import 'package:angular_auth/src/dashboard/dashboard_component.template.dart' as dashboard_template;

export 'route_paths.dart';

class Routes {
  static final login = RouteDefinition(
    routePath: RoutePaths.login,
    component: login_template.LoginComponentNgFactory,
  );
  static final dashboard = RouteDefinition(
    routePath: RoutePaths.dashboard,
    component: dashboard_template.DashboardComponentNgFactory,
  );

  static final all = <RouteDefinition>[
    login,
    dashboard,
    RouteDefinition.redirect(
      path: '', redirectTo: RoutePaths.login.toUrl(),
    ),
  ];
}