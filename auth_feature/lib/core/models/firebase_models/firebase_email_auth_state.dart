import 'package:auth_feature/core/models/base_models/emai_auth_state.dart';
import 'package:auth_feature_repository_base/authFailure.dart';

class FirebaseEmailAuthState implements EmailAuthState{

  FirebaseEmailAuthState({
    required this.email,
    required this.password,
    required bool isLoading,
    required AuthFailure authFailure,
  });
  @override
  EmailAuthState copyWith() {
    // TODO: implement copyWith
    throw UnimplementedError();
  }

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();


  @override
  EmailAuthState unknown() {
    // TODO: implement unknown
    throw UnimplementedError();
  }

}