
import 'package:auth_feature_repository_base/authFailure.dart';

import 'authState.dart';

class EmailAuthState extends AuthState{
  final String email;
  final String password;

  EmailAuthState({
    required this.email,
    required this.password,
    required bool isLoading,
    required AuthFailure authFailure,
  }) : super(
    isLoading: isLoading,
    authFailure: authFailure,
  );

  EmailAuthState.unknown():
        email = '',
        password = '',
        super(
          isLoading: false,
          authFailure: AuthFailure.unknown(),
        );
  EmailAuthState copyWith();
  @override
  List<Object?> get props => [email, password, isLoading, authFailure];
}