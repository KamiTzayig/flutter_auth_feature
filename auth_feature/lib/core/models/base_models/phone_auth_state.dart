
import 'package:auth_feature_repository_base/auth_failure.dart';

import 'authState.dart';


 class PhoneAuthState extends AuthState {
  final String phoneNumber;
  final String smsCode;

  PhoneAuthState({
    required this.phoneNumber,
    required this.smsCode,
    required bool isLoading,
    required AuthFailure authFailure,
  }) : super(
          isLoading: isLoading,
          authFailure: authFailure,
        );

  PhoneAuthState.unknown():
        phoneNumber = '',
        smsCode = '',
        super(
          isLoading: false,
          authFailure: AuthFailure.unknown(),
        );
  @override
  PhoneAuthState copyWith({
    String? phoneNumber,
    String? smsCode,
    bool? isLoading,
    AuthFailure? authFailure,
  }) {
    return PhoneAuthState(
      phoneNumber: phoneNumber ?? this.phoneNumber,
      smsCode: smsCode ?? this.smsCode,
      isLoading: isLoading ?? this.isLoading,
      authFailure: authFailure ?? this.authFailure,
    );
  }
  @override
  List<Object?> get props => [phoneNumber, smsCode, isLoading, authFailure];
}