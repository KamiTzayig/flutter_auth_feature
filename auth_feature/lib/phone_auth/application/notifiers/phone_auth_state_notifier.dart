import 'dart:async';

import 'package:auth_feature_repository_base/auth_failure.dart';
import 'package:auth_feature_repository_base/auth_feature_repository_base.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:firebase_auth_feature_repository/firebase_auth_feature_repository.dart';

import '../../../auth_feature.dart';
import '../../../core/domain/models/base_models/phone_auth_state.dart';
import '../../../core/domain/models/firebase_models/firebase_phone_auth_state.dart';

part 'phone_auth_state_notifier.g.dart';

@riverpod
class PhoneAuthStateNotifier extends _$PhoneAuthStateNotifier {
  @override
  PhoneAuthState build() {
    AuthFeatureRepositoryBase repository = AuthFeature.instance.repository;

    StreamSubscription<bool> smsSentStream =
        repository.smsSentStream.listen((smsSent) {
      state = state.copyWith(smsSent: smsSent);
    });

    ref.onDispose(() {
      smsSentStream.cancel();
    });

    switch (AuthFeature.instance.repository.runtimeType) {
      case FirebaseAuthFeatureRepository:
        return FirebasePhoneAuthState.unknown();

      default:
        return PhoneAuthState.unknown();
    }
  }

  void setPhoneNumber(String phoneNumber) {
    state = state.copyWith(phoneNumber: phoneNumber);
  }

  void setSmsCode(String smsCode) {
    state = state.copyWith(smsCode: smsCode);
  }

  Future<void> signInWithPhoneNumber() async {
    state = state.copyWith(isLoading: true);
    AuthFeatureRepositoryBase repository = AuthFeature.instance.repository;
    try {
      await repository.signInWithPhoneNumber(phoneNumber: state.phoneNumber);
      state = state.copyWith(isLoading: false);
    } on AuthFailure catch (e) {
      state = state.copyWith(authFailure: e, isLoading: false);
    }
  }

  Future<void> verifySmsCode() async {
    state = state.copyWith(isLoading: true);
    AuthFeatureRepositoryBase repository = AuthFeature.instance.repository;
    try {
      await repository.verifySmsCode(smsCode: state.smsCode);
      state = state.copyWith(isLoading: false);
    } on AuthFailure catch (e) {
      state = state.copyWith(authFailure: e, isLoading: false);
    }
  }
}
