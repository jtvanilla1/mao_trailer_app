import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  //auth change user stream
  Stream<FirebaseUser> get user {
    return _auth.onAuthStateChanged;
  }

  //sign in google/pass
  Future googleSignIn() async {
    //TODO: fix bug in google sign in
    GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
      idToken: googleAuth.accessToken, 
      accessToken: googleAuth.idToken
    );
    final FirebaseUser user = (await _auth.signInWithCredential(credential)).user;
    assert(user.email !=null);
    assert(user.displayName !=null);
    assert(!user.isAnonymous);
    assert(await user.getIdToken() !=null);

    final FirebaseUser currentUser = await _auth.currentUser();
    assert (user.uid == currentUser.uid);

    return user;

  }

  //sign in email/pass
  Future logInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return user;
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

  //register with email/pass
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return user;
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

  //sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch(e) {
      print("error signing out: ${e.toString()}");
      return null;
    }
  }

}

final AuthService authService = AuthService();