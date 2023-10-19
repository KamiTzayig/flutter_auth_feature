import 'package:equatable/equatable.dart';
import 'package:auth_feature_repository_base/authFailure.dart';

// a class containing authentication process state
abstract class AuthState extends Equatable{

  final bool isLoading;

  final AuthFailure authFailure;


  AuthState({
    required this.isLoading,
    required this.authFailure,
  });

  AuthState unknown();
  AuthState copyWith();
  @override
  List<Object?> get props;

}
