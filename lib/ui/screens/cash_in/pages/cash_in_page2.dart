import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_wallet/core/providers/transaction_provider.dart';
import 'package:riverpod_wallet/ui/shared/utils/constants.dart';
import 'package:riverpod_wallet/ui/shared/widgets/default_button.dart';
import 'package:riverpod_wallet/ui/shared/widgets/information_tile.dart';

class CashInPage2 extends ConsumerWidget {
  final PageController pageController;

  const CashInPage2({
    Key? key,
    required this.pageController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(kScreenPadding),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 22.0),
            child: Center(
              child: Text(
                'You are about to cash-in on your account',
                style: TextStyle(fontSize: 17.0),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            decoration: kCardDecoration,
            padding: const EdgeInsets.all(kScreenPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Transaction Details:',
                  style: TextStyle(color: kTextColor),
                ),
                const SizedBox(height: 25.0),
                InformationTile(title: 'Source account:', value: ref.read(prSelectedBank)),
                const Divider(),
                InformationTile(title: 'Deposit amount:', value: 'PHP ${number.format(ref.watch(prTransferAmount))}'),
              ],
            ),
          ),
          const Spacer(),
          DefaultButton(
            title: 'Confirm',
            onPressed: () {
              pageController.nextPage(duration: const Duration(milliseconds: 400), curve: Curves.ease);
            },
          ),
        ],
      ),
    );
  }
}
