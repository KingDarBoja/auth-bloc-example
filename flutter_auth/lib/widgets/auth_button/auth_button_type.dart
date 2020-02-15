import 'package:equatable/equatable.dart';

abstract class AuthButtonType extends Equatable {}

class AuthButtonOutlineType extends AuthButtonType {
  @override
  String toString() => 'AuthButtonOutline';

  @override
  List<Object> get props => null;
}

class AuthButtonRaisedType extends AuthButtonType {
  @override
  String toString() => 'AuthenticationAuthenticated';

  @override
  List<Object> get props => null;
}