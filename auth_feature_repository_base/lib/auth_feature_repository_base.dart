import 'package:auth_feature_repository_base/user_model.dart';

abstract class AuthFeatureRepositoryBase{
  //example of an abstract repository which the data layer will implement

  //getters
  String? get userId;

  bool get isAlreadyLoggedIn;

  String get displayName;

  //Notifies when the authentication status changes.
  Stream<AuthUser> get authStateChanges;


  Future<void> signUpWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  });
  Future<void> verifyEmail({
    required String email,
  });
  Future<void> signInWithGoogle();

  Future<void> signInWithPhoneNumber({
    required String phoneNumber,
  });

  Future<void> verifySmsCode({
    required String smsCode,
  });

  //Logs out from the service.
  Future<void> signOut();

  }

