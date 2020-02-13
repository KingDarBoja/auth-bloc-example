import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'package:core_auth/core_auth.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

// AppStarted will be dispatched when the application first loads.
class AppStarted extends AuthenticationEvent {}

// LoggedIn will be dispatched on a successful login.
class LoggedIn extends AuthenticationEvent {
  final UserSession data;

  const LoggedIn({@required this.data});

  @override
  String toString() => 'LoggedIn - User data: $data';
}

// LoggedOut will be dispatched on a successful logout. 
class LoggedOut extends AuthenticationEvent {}