import 'package:auth_feature/core/models/base_models/phone_auth_state.dart';
import 'package:auth_feature/phone_auth/presentation/widgets/insert_phone_number.dart';
import 'package:flutter/material.dart';
import '../../application/state.dart';
import 'insert_sms_code.dart';

class PhoneAuthBody extends ConsumerWidget {
  const PhoneAuthBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final PhoneAuthState state = ref.watch(phoneAuthStateNotifierProvider);
    final bool smsSent = state.smsSent;
    return Column(
      children: [
        Text("phone auth"),
        if(!smsSent) InsertPhoneNumber(),
        if(!smsSent) TextButton(onPressed: () => ref.read(phoneAuthStateNotifierProvider.notifier).signInWithPhoneNumber(), child: Text("send sms code")),
        if(smsSent) InsertSmsCode(),
        if(smsSent) TextButton(onPressed: () => ref.read(phoneAuthStateNotifierProvider.notifier).verifySmsCode(), child: Text("sign in with sms code")),
      ],
    );
  }
}
