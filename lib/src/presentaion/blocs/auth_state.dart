enum AuthStatus { unauthenticated, authenticating, authenticated }

class AuthState {
  final AuthStatus status;

  const AuthState._(this.status);

  const AuthState.unauthenticated() : this._(AuthStatus.unauthenticated);
  const AuthState.authenticating() : this._(AuthStatus.authenticating);
  const AuthState.authenticated() : this._(AuthStatus.authenticated);
}
