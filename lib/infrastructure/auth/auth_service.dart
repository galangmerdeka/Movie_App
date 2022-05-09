import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';

class AuthServiceRepository {
  static FirebaseAuth _auth = FirebaseAuth.instance;

  Future<Either<String, User>> createUserWithUsernameAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User user = result.user!;
      return right(user);
    } catch (e) {
      return left(e.toString());
    }
  }

    Future<Either<String, User>> signInWithUsernameAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      User user = result.user!;
      return right(user);
    } catch (e) {
      return left(e.toString());
    }
  }

  Future<void> signOutUser() async {
    await _auth.signOut();
  }

  static Stream<User?> get firebaseUserStream => _auth.authStateChanges();
}


// ada sedikit pergantian. semoga membantu

// Starting from Version firebase_auth 0.18.0:
// FirebaseUser has been changed to User

// AuthResult has been changed to UserCredential

// GoogleAuthProvider.getCredential() has been changed to GoogleAuthProvider.credential()

// onAuthStateChanged which notifies about changes to the user's sign-in state was replaced with authStateChanges()

// currentUser() which is a method to retrieve the currently logged in user, was replaced with the property currentUser and it no longer returns a Future<FirebaseUser>