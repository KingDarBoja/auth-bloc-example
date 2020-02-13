import 'dart:async';

import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import 'package:core_auth/core_auth.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final StorageProvider storageProvider;
  final AuthenticationBloc authenticationBloc;

  LoginBloc({
    @required this.storageProvider,
    @required this.authenticationBloc,
  })  : assert(storageProvider != null),
        assert(authenticationBloc != null);

  @override
  LoginState get initialState => LoginInitial();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginButtonPressed) {
      yield LoginLoading();

      final userData = await storageProvider.authenticate(
        username: event.username,
        password: event.password,
      );

      var isAuth = userData?.token ?? false;
      if (isAuth != false) {
        authenticationBloc.add(LoggedIn(data: userData));
        yield LoginInitial();
      } else {
        print('Unable to retrieve user data!');
        yield LoginFailure(error: 'Unable to retrieve user data!');
      }
    }
  }
}