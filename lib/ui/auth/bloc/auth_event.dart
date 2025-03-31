part of 'auth_bloc.dart';

abstract class AuthEvent {}

class SignInEvent extends AuthEvent {
  final String email;
  final String password;
  SignInEvent(this.email, this.password);
}

class SignUpEvent extends AuthEvent {
  final String username;
  final String email;
  final String password;
  final String confirmPassword;

  SignUpEvent(this.username, this.email, this.password, this.confirmPassword);
}