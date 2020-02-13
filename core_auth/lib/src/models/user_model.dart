import 'package:equatable/equatable.dart';

class User extends Equatable {
  String username;
  String password;

  User(this.username, this.password);

  @override
  List<Object> get props => [username, password];
}