import 'package:equatable/equatable.dart';

import 'package:core_auth/core_auth.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

// Waiting to see if the user is authenticated or not on app start.
class AuthenticationUninitialized extends AuthenticationState {}

// waiting to persist/delete a token
class AuthenticationLoading extends AuthenticationState {}

// Successfully authenticated.
class AuthenticationAuthenticated extends AuthenticationState {
  final UserSession user;

  const AuthenticationAuthenticated(this.user);

    @override
  List<Object> get props => [user];

  @override
  String toString() => 'AuthenticationAuthenticated { username: ${user.username} }';
}

// Not authenticated.
class AuthenticationUnauthenticated extends AuthenticationState {

  @override
  String toString() => 'AuthenticationUnauthenticated { user logged out }';
}

