import 'package:auth_feature_repository_base/auth_feature_repository_base.dart';
import 'package:auth_feature_repository_base/auth_user_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../auth_feature.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';


part 'auth_user_stream_provider.g.dart';


@riverpod
Stream<AuthUser> authUserStream( AuthUserStreamRef ref) async* {
      final AuthFeatureRepositoryBase repository = AuthFeature.instance.repository;
      yield* repository.authUserStream;
}


// //stream provider
// final authUserStreamProvider = StreamProvider<AuthUser>((ref) {
//       final AuthFeatureRepositoryBase repository = AuthFeature.instance.repository;
//       return repository.authUserStream;
// });