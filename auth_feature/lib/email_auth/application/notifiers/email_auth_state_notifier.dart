import 'package:auth_feature/core/models/base_models/emai_auth_state.dart';
import 'package:auth_feature_repository_base/auth_feature_repository_base.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../auth_feature.dart';

part 'email_auth_state_notifier.g.dart';
@riverpod
class EmailAuthStateNotifier extends _$EmailAuthStateNotifier {
  @override
  EmailAuthState build() => EmailAuthState.unknown();


  Future<void> signIn({required String email, required String password}) async{
    AuthFeatureRepositoryBase repository=  AuthFeature.instance.repository;

    await repository.signInWithEmailAndPassword(email: email, password: password);
  }
}