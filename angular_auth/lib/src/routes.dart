import 'package:angular_router/angular_router.dart';

import 'package:angular_auth/src/route_paths.dart';
import 'package:angular_auth/src/dashboard/dashboard_component.template.dart' as dashboard_template;

export 'route_paths.dart';

class Routes {
  static final dashboard = RouteDefinition(
    routePath: RoutePaths.dashboard,
    component: dashboard_template.DashboardComponentNgFactory,
  );

  static final all = <RouteDefinition>[
    dashboard,
  ];
}