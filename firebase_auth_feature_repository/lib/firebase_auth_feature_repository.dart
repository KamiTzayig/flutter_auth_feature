import 'package:auth_feature_repository_base/auth_feature_repository_base.dart';
import 'package:auth_feature_repository_base/auth_user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_auth_user_model.dart';

class FirebaseAuthFeatureRepository extends AuthFeatureRepositoryBase {
  //implement singleton pattern
  static final FirebaseAuthFeatureRepository _singleton =
      new FirebaseAuthFeatureRepository._internal();

  FirebaseAuthFeatureRepository._internal();

  static FirebaseAuthFeatureRepository get instance => _singleton;

  late FirebaseAuth _auth;

  Future<void> initialize(FirebaseOptions? options) async {
    await Firebase.initializeApp(
      options: options,
    );
    _auth = FirebaseAuth.instance;
  }
  @override
  Stream<AuthUser> get authStateChanges =>
      _auth.authStateChanges().map<AuthUser>((User? user) {
        return FirebaseAuthUser.fromFirebaseUser(user: user);
      });

  @override
  String? get userId => _auth.currentUser?.uid;


  @override
  // TODO: implement displayName
  String get displayName => throw UnimplementedError();

  @override
  // TODO: implement isAlreadyLoggedIn
  bool get isAlreadyLoggedIn => throw UnimplementedError();

  @override
  Future<void> signUpWithEmailAndPassword(
      {required String email, required String password}) {
    // TODO: implement signUpWithEmailAndPassword
    throw UnimplementedError();
  }

  @override
  Future<void> signInWithEmailAndPassword(
      {required String email, required String password}) {
    // TODO: implement signInWithEmailAndPassword
    throw UnimplementedError();
  }

  @override
  Future<void> verifyEmail({required String email}) {
    // TODO: implement verifyEmail
    throw UnimplementedError();
  }

  @override
  Future<void> signInWithPhoneNumber({required String phoneNumber}) {
    // TODO: implement signInWithPhoneNumber
    throw UnimplementedError();
  }

  @override
  Future<void> verifySmsCode({required String smsCode}) {
    // TODO: implement verifySmsCode
    throw UnimplementedError();
  }

  @override
  Future<void> signInWithGoogle() {
    // TODO: implement signInWithGoogle
    throw UnimplementedError();
  }

  @override
  Future<void> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }
}
