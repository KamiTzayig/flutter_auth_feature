import 'package:flutter/material.dart';
import './widgets/core_body.dart';

/// {@template core_page}
/// A description for CorePage
/// {@endtemplate}
class CorePage extends StatelessWidget {
  /// {@macro core_page}
  const CorePage({super.key});

  /// The static route for CorePage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const CorePage());
  }
  
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CoreView(),
    );
  }  
}

/// {@template core_view}
/// Displays the Body of CoreView
/// {@endtemplate}
class CoreView extends StatelessWidget {
  /// {@macro core_view}
  const CoreView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CoreBody();
  }
}
