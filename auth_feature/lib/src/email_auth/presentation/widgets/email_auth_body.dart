import 'package:auth_feature_repository_base/auth_failure.dart';
import 'package:auth_feature_repository_base/auth_user_model.dart';
import 'package:flutter/material.dart';
import '../../../core/application/notifiers/auth_user_stream_notifier.dart';
import '../../../core/domain/models/base_models/email_auth_state.dart';
import '../../application/state.dart';


class EmailAuthBody extends ConsumerWidget {
  /// {@macro email_auth_body}
  const EmailAuthBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final EmailAuthState emailAuthState = ref.watch(
        emailAuthStateNotifierProvider);
    final bool isLoading = emailAuthState.isLoading;
    final AsyncValue<AuthUser> user = ref.watch(authUserStreamNotifierProvider);
    final AuthFailure authFailure = emailAuthState.authFailure;

    return Column(
      children: [
        user.when(data: (user) => Text(user.userId),
            error: (e, StackTrace trace) => Text(trace.toString()),
            loading: () => const CircularProgressIndicator()),
        TextFormField(
          onChanged: (String value) {
            ref.read(emailAuthStateNotifierProvider.notifier).setEmail(value);
          },
          decoration: const InputDecoration(
            labelText: "Email",
          ),
        ),
        TextFormField(
          onChanged: (String value) {
            ref
                .read(emailAuthStateNotifierProvider.notifier)
                .setPassword(value);
          },
          decoration: const InputDecoration(
            labelText: "Password",
          ),
        ),
        if (isLoading)
          const CircularProgressIndicator()
        else
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  ref
                      .read(emailAuthStateNotifierProvider.notifier)
                      .signInWithEmailAndPassword();
                },
                child: const Text("Sign In"),
              ),
              ElevatedButton(
                onPressed: () {
                  ref
                      .read(emailAuthStateNotifierProvider.notifier)
                      .signUpWithEmailAndPassword();
                },
                child: const Text("Sign Up"),
              ),
              ElevatedButton(
                onPressed: () {
                  ref
                      .read(authUserStreamNotifierProvider.notifier)
                      .signOut();
                },
                child: const Text("Sign Out"),
              ),
            ],
          ),

if(authFailure.authFailureCode!=AuthFailureCode.none)
        ...[Text(authFailure.authFailureCode),
        Text(authFailure.message??'-')]
      ],);
  }
}
