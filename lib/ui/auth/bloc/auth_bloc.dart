import 'package:finance_manager/ui/auth/view_models/sign_up.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:finance_manager/data/services/auth_service.dart';
import 'package:finance_manager/ui/auth/view_models/sign_in.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthService authService;

  AuthBloc(this.authService) : super(AuthInitial()) {
    on<SignInEvent>(_onSignIn);
    on<SignUpEvent>(_onSignUp);
  }

  Future<void> _onSignIn(SignInEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());

    final viewModel = SignInViewModel()
      ..email = event.email
      ..password = event.password;

    if (!viewModel.isValid()) {
      emit(AuthFailure('Invalid email or password'));
      return;
    }

    try {
      final authResponse = await authService.signIn(viewModel.email, viewModel.password);
      emit(AuthSuccess(authResponse));
    } catch (e) {
      emit(AuthFailure('Failed to sign in: $e'));
    }
  }

  Future<void> _onSignUp(SignUpEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());

    final viewModel = SignUpViewModel()
      ..username = event.username
      ..email = event.email
      ..password = event.password
      ..confirmPassword = event.confirmPassword;

      if (!viewModel.isValid()) {
      emit(AuthFailure('Invalid username, email or password'));
      return;
    }

    try {
      final authResponse = await authService.signUp(viewModel.username, viewModel.email, viewModel.password);
      emit(AuthSuccess(authResponse));
    } catch (e) {
      emit(AuthFailure('Failed to sign up: $e'));
    }
  }
}
