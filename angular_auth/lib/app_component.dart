import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

import 'package:angular_auth/src/route_paths.dart';
import 'package:angular_auth/src/routes.dart';

// AngularDart info: https://angulardart.dev
// Components info: https://angulardart.dev/components

@Component(
  selector: 'my-app',
  styleUrls: ['app_component.css'],
  templateUrl: 'app_component.html',
  directives: [routerDirectives],
  providers: [],
  exports: [RoutePaths, Routes]
)
class AppComponent {
  // Nothing here yet. All logic is in TodoListComponent.
}
