import 'package:auth_feature/core/models/base_models/emai_auth_state.dart';

class FirebaseEmailAuthState extends EmailAuthState {
  FirebaseEmailAuthState(
      {required super.email,
      required super.password,
      required super.isLoading,
      required super.authFailure});
}
