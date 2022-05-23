import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_wallet/core/providers/account_provider.dart';
import 'package:riverpod_wallet/ui/shared/utils/constants.dart';

final accountBalance = StateProvider<int>((ref) => 100);

class AccountBalanceView extends ConsumerWidget {
  const AccountBalanceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final balance = ref.watch(prAccountBalance);

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.35,
      child: RefreshIndicator(
        onRefresh: () async {
          // user.getBalance();
        },
        child: SizedBox(
          height: MediaQuery.of(context).size.height / 2,
          width: double.infinity,
          child: Center(
              child: Text(
            'PHP ${number.format(balance)}',
            style: const TextStyle(fontSize: 25.0, color: Colors.white),
          )),
        ),
      ),
    );
  }
}
