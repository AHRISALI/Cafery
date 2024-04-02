//import 'package:cafery/models/user.dart';
import 'package:cafery/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? get currentUser => _auth.currentUser;

  Stream<User?> get authStateChanges => _auth.authStateChanges();

  //ユーザー登録
  Future<void> createUserWithEmailAndPassword(String email, String pass) async {
    await _auth.createUserWithEmailAndPassword(email: email, password: pass);
  }

  //ユーザーログイン
  Future<void> signInWithEmailAndPassword(String email, String pass) async {
    await _auth.signInWithEmailAndPassword(email: email, password: pass);
  }

  //ログアウト
  Future<void> signOut() async {
    await _auth.signOut();
  }
}
