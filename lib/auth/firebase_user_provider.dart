import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class HermesFirebaseUser {
  HermesFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

HermesFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<HermesFirebaseUser> hermesFirebaseUserStream() => FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<HermesFirebaseUser>(
      (user) {
        currentUser = HermesFirebaseUser(user);
        return currentUser!;
      },
    );
