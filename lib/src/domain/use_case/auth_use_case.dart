import '../../data/repository/auth_repository.dart';

class AuthUseCase {
  final AuthRepository _authRepository;

  AuthUseCase(this._authRepository);

  Future<bool> isSignedIn() => _authRepository.isSignedIn();

  Future<void> signIn(String username) => _authRepository.signIn(username);

  Future<void> signOut() => _authRepository.signOut();
}
