import 'package:equatable/equatable.dart';
import 'package:auth_feature_repository_base/auth_failure.dart';

// a class containing authentication process state
abstract class AuthState extends Equatable{

  final bool isLoading;

  final AuthFailure authFailure;


  AuthState({
    required this.isLoading,
    required this.authFailure,
  });
  AuthState copyWith();
  @override
  List<Object?> get props;

}
