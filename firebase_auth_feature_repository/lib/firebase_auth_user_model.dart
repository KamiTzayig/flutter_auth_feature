
import 'package:auth_feature_repository_base/auth_user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthUser extends AuthUser {
  FirebaseAuthUser({
    required String userId,
    required String phoneNumber,
    required String fullName,
  }) : super(
          userId: userId,
          phoneNumber: phoneNumber,
          fullName: fullName,
        );

  factory FirebaseAuthUser.fromFirebaseUser({User? user}) {
    if (user == null) {
      return FirebaseAuthUser(
        userId: "",
        phoneNumber: "",
        fullName: "",
      );
    }
    return FirebaseAuthUser(
      userId: user.uid,
      phoneNumber: user.phoneNumber ?? "",
      fullName: user.displayName ?? "",
    );
  }

  @override
  Map<String, dynamic> toJson() {
  return {
    "userId": userId,
    "phoneNumber": phoneNumber,
    "fullName": fullName,
  };
  }

}