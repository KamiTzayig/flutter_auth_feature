import 'package:auth_feature_repository_base/auth_failure.dart';
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
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e){
      String code = AuthFailureCode().fromStringCode(e.code);
      AuthFailure authFailure = AuthFailure(authFailureCode: code, authProviderType: AuthProviderType.email, message: e.message);
      throw authFailure;
    } catch(e){
      throw AuthFailure(authFailureCode: AuthFailureCode.unknown, authProviderType: AuthProviderType.email, message: e.toString());
    }

  }
    @override
  Future<void> signInWithEmailAndPassword({required String email, required String password}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      String code = AuthFailureCode().fromStringCode(e.code);
      AuthFailure authFailure = AuthFailure(authFailureCode: code, authProviderType: AuthProviderType.email, message: e.message);
      throw authFailure;
    } catch (e) {
      throw AuthFailure(authFailureCode: AuthFailureCode.unknown, authProviderType: AuthProviderType.email, message: e.toString());
    }
  }

  @override
  Future<void> verifyEmail({required String email}) async {
    try {
      await _auth.currentUser!.sendEmailVerification();
    } catch (e) {
      throw AuthFailure(authFailureCode: AuthFailureCode.unknown, authProviderType: AuthProviderType.email, message: e.toString());
    }
  }

  @override
  Future<void> signInWithPhoneNumber({required String phoneNumber}) async {
    try {
      // Your implementation for phone number sign-in here
    } on FirebaseAuthException catch (e) {
      String code = AuthFailureCode().fromStringCode(e.code);
      AuthFailure authFailure = AuthFailure(authFailureCode: code, authProviderType: AuthProviderType.phone , message: e.message);
      throw authFailure;
    } catch (e) {
      throw AuthFailure(authFailureCode: AuthFailureCode.unknown, authProviderType: AuthProviderType.phone , message: e.toString());
    }
  }

  @override
  Future<void> verifySmsCode({required String smsCode}) async {
    try {
      // Your implementation for verifying SMS code here
    } on FirebaseAuthException catch (e) {
      String code = AuthFailureCode().fromStringCode(e.code);
      AuthFailure authFailure = AuthFailure(authFailureCode: code, authProviderType: AuthProviderType.phone , message: e.message);
      throw authFailure;
    } catch (e) {
      throw AuthFailure(authFailureCode: AuthFailureCode.unknown, authProviderType: AuthProviderType.phone  , message: e.toString());
    }
  }

  @override
  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      await _auth.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      String code = AuthFailureCode().fromStringCode(e.code);
      AuthFailure authFailure = AuthFailure(authFailureCode: code, authProviderType: AuthProviderType.google , message: e.message);
      throw authFailure;
    } catch (e) {
      throw AuthFailure(authFailureCode: AuthFailureCode.unknown, authProviderType: AuthProviderType.google , message: e.toString());
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      throw AuthFailure(authFailureCode: AuthFailureCode.unknown, authProviderType: AuthProviderType.none, message: e.toString());
    }
  }


}
