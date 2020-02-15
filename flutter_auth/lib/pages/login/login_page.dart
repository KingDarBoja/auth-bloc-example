import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:core_auth/core_auth.dart';
import 'package:flutter_auth/pages/login/login_form.dart';

class LoginPage extends StatelessWidget {
  final StorageProvider storageProvider;

  LoginPage({Key key, @required this.storageProvider})
      : assert(storageProvider != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login')
      ),
      body: BlocProvider(
        create: (context) {
          return LoginBloc(
            authenticationBloc: BlocProvider.of<AuthenticationBloc>(context),
            storageProvider: storageProvider
          );
        },
        child: LoginForm(),
      ),
    );
  }
}