part of 'auth_bloc.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final Map<String, dynamic> authResponse;

  AuthSuccess(this.authResponse);
}

class AuthFailure extends AuthState {
  final String error;

  AuthFailure(this.error);
}