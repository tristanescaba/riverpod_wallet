import 'package:flutter/material.dart';
import 'package:riverpod_wallet/ui/screens/welcome/welcome_screen.dart';
import 'package:riverpod_wallet/ui/shared/utils/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Riverpod Wallet',
      theme: ThemeData(primarySwatch: kPrimaryColor),
      home: const WelcomeScreen(),
    );
  }
}
