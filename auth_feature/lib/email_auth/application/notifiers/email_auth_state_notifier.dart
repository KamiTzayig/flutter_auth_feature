import 'package:auth_feature/core/models/base_models/emai_auth_state.dart';
import 'package:auth_feature_repository_base/auth_failure.dart';
import 'package:auth_feature_repository_base/auth_feature_repository_base.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../auth_feature.dart';

part 'email_auth_state_notifier.g.dart';
@riverpod
class EmailAuthStateNotifier extends _$EmailAuthStateNotifier {
  @override
  EmailAuthState build() => EmailAuthState.unknown();


  void setEmail(String email) {
    state = state.copyWith(email: email);
  }

  void setPassword(String password) {
    state = state.copyWith(password: password);
  }

  Future<void> signInWithEmailAndPassword() async{
    state = state.copyWith(isLoading: true);
    AuthFeatureRepositoryBase repository=  AuthFeature.instance.repository;
    try {
      await repository.signInWithEmailAndPassword(
          email: state.email, password: state.password);
      state = state.copyWith(isLoading: false);
    } on AuthFailure catch (e) {
      state = state.copyWith(authFailure: e, isLoading: false);
    }
  }

  Future<void> signUpWithEmailAndPassword() async{
    state = state.copyWith(isLoading: true);
    AuthFeatureRepositoryBase repository=  AuthFeature.instance.repository;
    try {
      await repository.signUpWithEmailAndPassword(
          email: state.email, password: state.password);
      state = state.copyWith(isLoading: false);
    } on AuthFailure catch (e) {
      state = state.copyWith(authFailure: e, isLoading: false);
    }
  }

  Future<void> signOut() async{
    state = state.copyWith(isLoading: true);
    AuthFeatureRepositoryBase repository=  AuthFeature.instance.repository;
    try {
      await repository.signOut();
      state = state.copyWith(isLoading: false);
    } on AuthFailure catch (e) {
      state = state.copyWith(authFailure: e, isLoading: false);
    }
  }
}