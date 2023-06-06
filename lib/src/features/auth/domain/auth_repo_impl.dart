import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_interview_test/src/features/auth/domain/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  FirebaseAuth? _firebaseAuth;

  AuthRepoImpl() {
    _firebaseAuth = FirebaseAuth.instance;
  }

  @override
  Future<UserCredential> login(
      {required String email, required String password}) async {
    final res = await _firebaseAuth!
        .signInWithEmailAndPassword(email: email, password: password);
    return res;
  }

  @override
  Future register({required String email, required String password}) async {
    final res = _firebaseAuth!
        .createUserWithEmailAndPassword(email: email, password: password);

    return res;
  }

  @override
  Future forgetPassword({required String email}) async {
    final res = await _firebaseAuth!.sendPasswordResetEmail(email: email);
    return res;
  }

  @override
  Future logout() async {
    await _firebaseAuth!.signOut();

    throw UnimplementedError();
  }
}
