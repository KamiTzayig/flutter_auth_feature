import 'package:auth_feature_repository_base/auth_feature_repository_base.dart';
import 'package:auth_feature_repository_base/auth_user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'firebase_auth_user_model.dart';

class FirebaseAuthFeatureRepository extends AuthFeatureRepositoryBase {
  //implement singleton pattern
  static final FirebaseAuthFeatureRepository _singleton =
      FirebaseAuthFeatureRepository._internal();

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
  Stream<AuthUser> get authUserStream=>
      _auth.authStateChanges().map<AuthUser>((User? user) {
        return FirebaseAuthUser.fromFirebaseUser(user: user);
      });

  @override
  AuthUser get authUser => FirebaseAuthUser.fromFirebaseUser(user: _auth.currentUser);
  @override
  Future<void> signUpWithEmailAndPassword(
      {required String email, required String password}) async {
    await _auth.createUserWithEmailAndPassword(email: email, password: password);
  }

  @override
  Future<void> signInWithEmailAndPassword(
      {required String email, required String password}) async{
 await _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  @override
  Future<void> verifyEmail({required String email}) async{
    try {
      _auth.currentUser!.sendEmailVerification();
    } catch (e) {
      rethrow;
    }
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
  Future<void> signInWithGoogle() async{
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );


     await _auth.signInWithCredential(credential);
  }

  @override
  Future<void> signOut() async{
   await _auth.signOut();
  }


}
