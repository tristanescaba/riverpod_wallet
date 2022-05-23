import 'package:flutter/material.dart';
import 'package:riverpod_wallet/ui/screens/dashboard/dashboard_screen.dart';
import 'package:riverpod_wallet/ui/shared/utils/constants.dart';
import 'package:riverpod_wallet/ui/shared/widgets/default_button_widget.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(kScreenPadding),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 30.0),
              width: double.infinity,
              child: const Text(
                'Riverpod Wallet',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 60.0,
                  fontWeight: FontWeight.bold,
                  // foreground: Paint()..shader = linearGradient,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('09123456789  |  ', style: TextStyle(color: kTextColor, fontWeight: FontWeight.w300)),
                GestureDetector(
                  onTap: () {},
                  child: const Text(
                    'Change number',
                    style: TextStyle(color: kPrimaryColor),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Column(
                children: [
                  const Spacer(),
                  SafeArea(
                    child: DefaultButton(
                      title: 'Log in',
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const DashboardScreen()));
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
