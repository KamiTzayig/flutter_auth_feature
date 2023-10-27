
import '../base_models/email_auth_state.dart';

class FirebaseEmailAuthState extends EmailAuthState {
  FirebaseEmailAuthState(
      {required super.email,
      required super.password,
      required super.isLoading,
      required super.authFailure});
}
