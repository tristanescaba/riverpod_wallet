import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_wallet/core/providers/account_provider.dart';
import 'package:riverpod_wallet/core/providers/transaction_provider.dart';
import 'package:riverpod_wallet/ui/shared/utils/constants.dart';

class CashInPage3 extends ConsumerWidget {
  final PageController pageController;

  const CashInPage3({
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
            child: Text(
              'For your verification, please input the OTP you received.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 17.0),
            ),
          ),
          const Text(
            'Type below the OTP:',
            style: TextStyle(color: kTextColor),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 100.0),
            child: TextFormField(
              maxLength: 6,
              autofocus: true,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(counterText: ''),
              onChanged: (value) {
                if (value.length == 6) {
                  ref.read(prAccountBalance.notifier).state = ref.read(prAccountBalance.notifier).state + ref.read(prTransferAmount.notifier).state;
                  pageController.nextPage(duration: const Duration(milliseconds: 400), curve: Curves.ease);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
