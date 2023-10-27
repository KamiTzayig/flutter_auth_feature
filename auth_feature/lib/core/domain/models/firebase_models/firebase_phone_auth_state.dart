import 'package:auth_feature_repository_base/auth_failure.dart';

import '../base_models/phone_auth_state.dart';

class FirebasePhoneAuthState extends PhoneAuthState {
  final String verificationId;

  FirebasePhoneAuthState(
      {required this.verificationId,
      required super.phoneNumber,
      required super.smsCode,
      required super.isLoading,
      required super.authFailure,
      required super.smsSent});

  FirebasePhoneAuthState.unknown()
      : verificationId = '',
        super(
          phoneNumber: '',
          smsCode: '',
          isLoading: false,
          smsSent: false,
          authFailure: AuthFailure.unknown(),
        );

  @override
  FirebasePhoneAuthState copyWith({
    String? phoneNumber,
    String? smsCode,
    bool? isLoading,
    AuthFailure? authFailure,
    String? verificationId,
    bool? smsSent,
  }) {
    return FirebasePhoneAuthState(
      verificationId: verificationId ?? this.verificationId,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      smsCode: smsCode ?? this.smsCode,
      isLoading: isLoading ?? this.isLoading,
      authFailure: authFailure ?? this.authFailure,
      smsSent: smsSent ?? this.smsSent,
    );
  }
}
