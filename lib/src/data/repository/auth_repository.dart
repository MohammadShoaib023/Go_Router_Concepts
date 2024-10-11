import '../models/stream_auth.dart';

class AuthRepository {
  final StreamAuth _streamAuth = StreamAuth();

  Future<bool> isSignedIn() => _streamAuth.isSignedIn();

  Future<void> signIn(String username) => _streamAuth.signIn(username);

  Future<void> signOut() => _streamAuth.signOut();
}
