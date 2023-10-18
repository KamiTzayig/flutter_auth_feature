import 'package:auth_feature_repository_base/auth_user_model.dart';
import 'package:flutter/material.dart';
import '../../application/state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// {@template core_body}
/// Body of the CorePage.
///
/// Add what it does
/// {@endtemplate}
class CoreBody extends ConsumerWidget {
  /// {@macro core_body}
  const CoreBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<AuthUser> user = ref.watch(authUserStreamProvider);
    return Text(user.when(
        data: (AuthUser u) => u.userId,
        error: (e, StackTrace trace) => trace.toString(),
        loading: () => "loading"));
  }
}
