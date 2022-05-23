import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_wallet/core/providers/account_provider.dart';
import 'package:riverpod_wallet/core/providers/transaction_provider.dart';
import 'package:riverpod_wallet/ui/shared/utils/constants.dart';
import 'package:riverpod_wallet/ui/shared/widgets/default_button.dart';
import 'package:riverpod_wallet/ui/shared/widgets/information_tile.dart';

class FundTransferPage4 extends ConsumerWidget {
  final PageController pageController;

  const FundTransferPage4({
    Key? key,
    required this.pageController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(kScreenPadding),
      child: Column(
        children: [
          const SizedBox(height: 20.0),
          Container(
            width: double.infinity,
            decoration: kCardDecoration,
            padding: const EdgeInsets.all(kScreenPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, bottom: 40.0),
                  child: Column(
                    children: const [
                      Icon(
                        Icons.check_circle_outline,
                        color: Colors.green,
                        size: 35.0,
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        'Transfer Successful!',
                        style: TextStyle(fontSize: 17.0),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 25.0),
                InformationTile(title: 'Source account:', value: ref.watch(prAccountNumber)),
                const Divider(),
                InformationTile(title: 'Target account:', value: ref.watch(prTargetAccount)),
                const Divider(),
                InformationTile(title: 'Deposit amount:', value: 'PHP ${number.format(ref.watch(prTransferAmount))}'),
                const Divider(),
                InformationTile(title: 'Your new balance:', value: 'PHP ${number.format(ref.watch(prAccountBalance))}'),
              ],
            ),
          ),
          const Spacer(),
          DefaultButton(
            title: 'Back to dashboard',
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
