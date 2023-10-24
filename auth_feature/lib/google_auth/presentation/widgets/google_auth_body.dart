import 'package:auth_feature/core/models/base_models/google_auth_state.dart';
import 'package:flutter/material.dart';
import '../../application/state.dart';


/// {@template google_auth_body}
/// Body of the GoogleAuthPage.
///
/// Add what it does
/// {@endtemplate}
class GoogleAuthBody extends ConsumerWidget {
  /// {@macro google_auth_body}
  const GoogleAuthBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GoogleAuthState googleAuthState = ref.watch(
        googleAuthStateNotifierProvider);
    final bool isLoading = googleAuthState.isLoading;
    return Column(
      children: [
        if (isLoading)
          const CircularProgressIndicator()
        else
          ElevatedButton(
            onPressed: () {
              ref
                  .read(googleAuthStateNotifierProvider.notifier)
                  .signInWithGoogle();
            },
            child: const Text("Sign In With Google"),
          ),
      ],
    );
  }
}