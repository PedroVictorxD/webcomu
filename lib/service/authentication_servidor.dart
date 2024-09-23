import 'package:firebase_auth/firebase_auth.dart';

class AuthenticatorService {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  cadastrarUser(
      {required String email, required String senha, required String nome}) {
    _firebaseAuth.createUserWithEmailAndPassword(email: email, password: senha);
  }
}
