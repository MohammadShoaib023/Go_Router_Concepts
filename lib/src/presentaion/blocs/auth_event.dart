abstract class AuthEvent {}

class SignInEvent extends AuthEvent {
  final String username;
  SignInEvent(this.username);
}

class SignOutEvent extends AuthEvent {}
