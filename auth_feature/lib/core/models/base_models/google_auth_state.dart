import 'package:auth_feature_repository_base/authFailure.dart';

import 'authState.dart';

abstract class GoogleAuthState extends AuthState {
  final String email;
  final String password;

  GoogleAuthState({
    required this.email,
    required this.password,
    required bool isLoading,
    required AuthFailure authFailure,
  }) : super(
          isLoading: isLoading,
          authFailure: authFailure,
        );

  GoogleAuthState unknown();
  GoogleAuthState copyWith();
  @override
  List<Object?> get props => [email, password, isLoading, authFailure];
}