import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';

@Component(
  selector: 'login',
  styleUrls: ['login_component.css'],
  templateUrl: 'login_component.html',
  directives: [
    MaterialButtonComponent,
    MaterialIconComponent
  ],
  providers: []
)
class LoginComponent extends OnInit {
  @override
  void ngOnInit() {
    // TODO: implement ngOnInit
  }
  
}