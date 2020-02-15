import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:modal_progress_hud/modal_progress_hud.dart';

import 'package:core_auth/core_auth.dart';
import 'package:flutter_auth/pages/pages.dart';
import 'package:flutter_auth/widgets/widgets.dart';
import 'package:flutter_auth/services/storage_service.dart';

void main() {
  final storageService = StorageService();
  runApp(
    BlocProvider<AuthenticationBloc>(
      create: (context) {
        return AuthenticationBloc(storageProvider: storageService)
          ..add(AppStarted());
      },
      child: App(storageProvider: storageService),
    ),
  );
}

class App extends StatelessWidget {
  final StorageProvider storageProvider;

  App({Key key, @required this.storageProvider}) : super(key: key);

  bool _loadingAuthentication = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is AuthenticationUninitialized) {
            return SplashPage();
          }
          if (state is AuthenticationAuthenticated) {
            return DashboardPage();
          }
          if (state is AuthenticationUnauthenticated ||
              state is AuthenticationLoading) {
            this._loadingAuthentication =
                state is AuthenticationLoading ? true : false;
            return ModalProgressHUD(
              child: LoginPage(storageProvider: this.storageProvider),
              inAsyncCall: this._loadingAuthentication,
              color: Colors.indigo,
            );
          }
        },
      ),
    );
  }
}
