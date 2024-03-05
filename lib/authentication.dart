class AuthenticationService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Sign up with email and password
  Future signUp({String email, String password}) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return null;
    } catch (e) {
      return e.toString();
    }
  }

  // Sign in with email and password
  Future signIn({required String email, required String password}) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return null;
    } catch (e) {
      return e.toString();
    }
  }

  // Sign out
  Future signOut() async {
    await _auth.signOut();
  }

  // Get the current user
  User getCurrentUser() {
    return _auth.currentUser;
  }
}
