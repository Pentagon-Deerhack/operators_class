import 'package:flutter/material.dart';
import 'package:operators_class/dashboard.dart';
import 'package:operators_class/operators.dart';
import 'package:operators_class/output.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const DashboardView(),
        '/operator': (context) => const OperatorView(),
        '/outputs': (context) => const OutputView(),
      },
    );
  }
}
