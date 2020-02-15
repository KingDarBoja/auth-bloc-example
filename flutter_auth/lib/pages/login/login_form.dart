import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:core_auth/core_auth.dart';
import 'package:flutter_auth/widgets/auth_button/auth_button.dart';

class LoginForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _onLoginButtonPressed() {
      BlocProvider.of<LoginBloc>(context).add(
        LoginButtonPressed(
          username: _usernameController.text,
          password: _passwordController.text,
        ),
      );
    }

    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginFailure) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text('${state.error}'),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return Form (
            child: Column (
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget> [
                new Padding (
                  padding: EdgeInsets.all(20.0),
                  child: Column (
                    children: <Widget> [
                      TextFormField (
                        decoration: InputDecoration (
                          prefixIcon: Icon(Icons.person),
                          labelText: 'Username',
                          labelStyle: TextStyle(
                            fontSize: 16.0,
                            letterSpacing: 0.3
                          )
                        ),
                        controller: _usernameController,
                      ),
                      TextFormField (
                        decoration: InputDecoration (
                          prefixIcon: Icon(Icons.lock_outline),
                          labelText: 'Password',
                          labelStyle: TextStyle(
                            fontSize: 16.0,
                            letterSpacing: 0.3
                          )
                        ),
                        controller: _passwordController,
                        obscureText: true
                      ),
                      AuthButton (
                        buttonType: AuthButtonRaisedType(),
                        onClicked: _onLoginButtonPressed,
                        title:'Sign In'
                      )
                    ]
                  )
                )
              ]
            )
          );
        }
      )
    );
  }
}
