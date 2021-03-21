import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthHelper {
  final _auth = FirebaseAuth.instance;
  String _status;

  Future<String> createAccount({email, pass}) async {
    try {
      UserCredential authResult = await _auth.createUserWithEmailAndPassword(
          email: email, password: pass);
      if (authResult.user != null) {
        _status = "successful";
      } else {
        _status = "Error undefined";
      }
    } catch (e) {
      _status = e.toString();
    }
    return _status;
  }

  Future<String> login({email, pass}) async {
    try {
      final authResult =
          await _auth.signInWithEmailAndPassword(email: email, password: pass);

      if (authResult.user != null) {
        _status = "successful";
      } else {
        _status = "Error undefined";
      }
    } catch (e) {
      _status = e.toString();
    }
    return _status;
  }

  void logout() {
    _auth.signOut();
  }

  Future<User> getCurrentUser() async {
    User loggedInUser;
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {
      print(e);
    }
    return loggedInUser;
  }
}
