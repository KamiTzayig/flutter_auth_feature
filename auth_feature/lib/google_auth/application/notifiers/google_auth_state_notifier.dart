import 'package:auth_feature/core/models/base_models/google_auth_state.dart';
import 'package:auth_feature_repository_base/auth_failure.dart';
import 'package:auth_feature_repository_base/auth_feature_repository_base.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../auth_feature.dart';

part 'google_auth_state_notifier.g.dart';
@riverpod
class GoogleAuthStateNotifier extends _$GoogleAuthStateNotifier {
  @override
 GoogleAuthState build() => GoogleAuthState.unknown();


  Future<void> signInWithGoogle() async{
    state = state.copyWith(isLoading: true);
    AuthFeatureRepositoryBase repository=  AuthFeature.instance.repository;

    try {
      await repository.signInWithGoogle();
      state = state.copyWith(isLoading: false);
    } on AuthFailure catch (e) {
      state = state.copyWith(authFailure: e, isLoading: false);
    }
  }

}