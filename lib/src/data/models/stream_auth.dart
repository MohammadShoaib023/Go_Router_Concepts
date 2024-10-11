import 'dart:async';

import '../../domain/entity/user.dart';

class StreamAuth {
  String? _currentUser;
  final StreamController<User?> _userStreamController =
      StreamController<User?>.broadcast();

  Future<bool> isSignedIn() async {
    await Future.delayed(const Duration(seconds: 1));
    return _currentUser != null;
  }

  Future<void> signIn(String newUserName) async {
    await Future.delayed(const Duration(seconds: 3));
    _currentUser = newUserName;
    _userStreamController.add(User(newUserName));
  }

  Future<void> signOut() async {
    _currentUser = null;
    _userStreamController.add(null);
  }

  Stream<User?> get onCurrentUserChanged => _userStreamController.stream;
}
