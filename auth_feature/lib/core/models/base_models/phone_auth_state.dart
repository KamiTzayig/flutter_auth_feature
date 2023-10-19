
import 'package:auth_feature_repository_base/authFailure.dart';

import 'authState.dart';


abstract class PhoneAuthState extends AuthState {
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

  PhoneAuthState unknown();
  PhoneAuthState copyWith();
  @override
  List<Object?> get props => [phoneNumber, smsCode, isLoading, authFailure];
}