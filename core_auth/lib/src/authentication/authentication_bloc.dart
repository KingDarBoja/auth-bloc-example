import 'dart:async';

import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import 'package:core_auth/core_auth.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final StorageProvider storageProvider;

  AuthenticationBloc({@required this.storageProvider})
      : assert(
            storageProvider != null,
            'The storageProvider argument'
            ' is missing at AuthenticationBloc constructor');

  @override
  AuthenticationState get initialState => AuthenticationUninitialized();

  // @override
  // void onTransition(Transition transition) {
  //   print('Authentication Bloc Transition \n'
  //       'From ${transition.currentState} to ${transition.nextState} state');
  // }

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AppStarted) {
      final data = await storageProvider.hasToken(Endpoints.sessionStorageKey);
      bool inSession = data?.token ?? false;
      if (inSession) {
        yield AuthenticationAuthenticated(data);
      } else {
        yield AuthenticationUnauthenticated();
      }
    }

    if (event is LoggedIn) {
      yield AuthenticationLoading();

      await storageProvider.persistToken(
          Endpoints.sessionStorageKey, event.data);
      yield AuthenticationAuthenticated(event.data);
    }

    if (event is LoggedOut) {
      yield AuthenticationLoading();
      await storageProvider.deleteToken(Endpoints.sessionStorageKey);
      yield AuthenticationUnauthenticated();
    }
  }
}
