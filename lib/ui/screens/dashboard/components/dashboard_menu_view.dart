import 'package:flutter/material.dart';
import 'package:riverpod_wallet/ui/screens/cash_in/cash_in_screen.dart';
import 'package:riverpod_wallet/ui/screens/fund_transfer/fund_transfer_screen.dart';
import 'package:riverpod_wallet/ui/shared/widgets/action_button.dart';

class MenuView extends StatelessWidget {
  const MenuView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ActionButton(
          icon: Icons.download_rounded,
          title: 'Cash-in',
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const CashInScreen()));
          },
        ),
        ActionButton(
          icon: Icons.near_me_rounded,
          title: 'Transfer',
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const FundTransferScreen()));
          },
        ),
      ],
    );
  }
}
