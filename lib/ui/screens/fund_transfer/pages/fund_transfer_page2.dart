import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_wallet/core/providers/account_provider.dart';
import 'package:riverpod_wallet/core/providers/transaction_provider.dart';
import 'package:riverpod_wallet/ui/shared/utils/constants.dart';
import 'package:riverpod_wallet/ui/shared/widgets/default_button.dart';
import 'package:riverpod_wallet/ui/shared/widgets/information_tile.dart';

class FundTransferPage2 extends ConsumerWidget {
  final PageController pageController;

  const FundTransferPage2({
    Key? key,
    required this.pageController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(kScreenPadding),
      child: Column(
        children: [
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
                        Icons.near_me_rounded,
                        color: kPrimaryColor,
                        size: 35.0,
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        'You are about transfer your fund',
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
                InformationTile(title: 'Transfer amount:', value: 'PHP ${number.format(ref.watch(prTransferAmount))}'),
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
