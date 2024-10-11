import 'package:concepts_go_router/src/domain/use_case/auth_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthUseCase authUseCase;

  AuthBloc(this.authUseCase) : super(const AuthState.unauthenticated()) {
    on<SignInEvent>((event, emit) async {
      emit(const AuthState.authenticating());
      try {
        // Simulate a network call for login
        await Future.delayed(const Duration(seconds: 1));
        emit(const AuthState.authenticated()); // On success
      } catch (_) {
        emit(const AuthState.unauthenticated()); // On failure
      }
    });

    on<SignOutEvent>((event, emit) {
      emit(const AuthState.unauthenticated()); // Immediately log out
    });
  }
}
