import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_wallet/core/providers/account_provider.dart';
import 'package:riverpod_wallet/core/providers/transaction_provider.dart';
import 'package:riverpod_wallet/ui/shared/utils/constants.dart';
import 'package:riverpod_wallet/ui/shared/widgets/default_button.dart';

class FundTransferPage1 extends ConsumerWidget {
  final PageController pageController;

  FundTransferPage1({
    Key? key,
    required this.pageController,
  }) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final _targetFieldController = TextEditingController();
  final _amountFieldController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(kScreenPadding),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _targetFieldController,
              decoration: const InputDecoration(
                label: Text('Target Account:'),
                hintText: '09XXXXXXXXX',
              ),
              maxLength: 11,
              keyboardType: TextInputType.number,
              validator: (String? value) {
                try {
                  if (value!.isEmpty) {
                    return 'Please enter a number.';
                  } else if (value.substring(0, 2) != '09' || value.length != 11) {
                    return 'Please use 09XXXXXXXXX format.';
                  }
                } catch (e) {
                  return 'Please input only a number.';
                }
              },
            ),
            TextFormField(
              controller: _amountFieldController,
              decoration: const InputDecoration(label: Text('Amount:')),
              keyboardType: TextInputType.number,
              validator: (String? value) {
                try {
                  if (value!.isEmpty) {
                    return 'Please input an amount.';
                  } else if (double.parse(value) > ref.read(prAccountBalance)) {
                    return 'Insufficient funds.';
                  } else if (double.parse(value) < 100.00) {
                    return 'Minimum amount is PHP 100.00.';
                  } else if (double.parse(value) > 50000.00) {
                    return 'Maximum amount is PHP 50,000.00.';
                  }
                } catch (e) {
                  return 'Please input only a number.';
                }
              },
            ),
            const Spacer(),
            DefaultButton(
              title: 'Proceed',
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  FocusScope.of(context).requestFocus(FocusNode());
                  ref.read(prTargetAccount.notifier).state = _targetFieldController.text;
                  ref.read(prTransferAmount.notifier).state = int.parse(_amountFieldController.text);
                  pageController.nextPage(duration: const Duration(milliseconds: 400), curve: Curves.ease);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
