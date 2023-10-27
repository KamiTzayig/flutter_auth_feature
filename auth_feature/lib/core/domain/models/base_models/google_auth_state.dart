import 'package:auth_feature_repository_base/auth_failure.dart';

import 'authState.dart';

class GoogleAuthState extends AuthState {
  GoogleAuthState({
    required super.isLoading,
    required super.authFailure,
  });

  GoogleAuthState.unknown()
      : super(
          isLoading: false,
          authFailure: AuthFailure.unknown(),
        );

  @override
  GoogleAuthState copyWith({
    bool? isLoading,
    AuthFailure? authFailure,
  }) {
    return GoogleAuthState(
      isLoading: isLoading?? this.isLoading,
      authFailure: authFailure ?? this.authFailure,
    );
  }

  @override
  List<Object?> get props => [isLoading, authFailure];
}
