import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_wallet/core/providers/transaction_provider.dart';
import 'package:riverpod_wallet/ui/shared/utils/constants.dart';
import 'package:riverpod_wallet/ui/shared/widgets/default_button.dart';

class CashInPage1 extends ConsumerWidget {
  final PageController pageController;

  CashInPage1({
    Key? key,
    required this.pageController,
  }) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final _amountFieldController = TextEditingController();
  final List<String> _linkedBanks = [
    'BPI',
    'BDO',
    'UB',
    'CIMB',
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(kScreenPadding),
      child: Column(
        children: [
          const SizedBox(
            width: double.infinity,
            child: Text(
              'Select from your linked banks:',
              style: TextStyle(color: kPrimaryColor),
            ),
          ),
          DropdownButton(
            value: ref.watch(prSelectedBank),
            isExpanded: true,
            items: _linkedBanks.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (dynamic newValue) {
              ref.read(prSelectedBank.notifier).state = newValue;
            },
          ),
          Form(
            key: _formKey,
            child: TextFormField(
              controller: _amountFieldController,
              decoration: const InputDecoration(label: Text('Amount:')),
              keyboardType: TextInputType.number,
              validator: (value) {
                try {
                  if (value!.isEmpty) {
                    return 'Please input an amount.';
                  } else if (double.parse(value) < 50.00) {
                    return 'Minimum amount is PHP 50.00.';
                  } else if (double.parse(value) > 20000.00) {
                    return 'Maximum amount is PHP 20,000.00.';
                  }
                } catch (e) {
                  return 'Please input only a number.';
                }

                return null;
              },
            ),
          ),
          const Spacer(),
          DefaultButton(
            title: 'Proceed',
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                FocusScope.of(context).requestFocus(FocusNode());
                ref.read(prTransferAmount.notifier).state = int.parse(_amountFieldController.text);
                pageController.nextPage(duration: const Duration(milliseconds: 400), curve: Curves.ease);
              }
            },
          ),
        ],
      ),
    );
  }
}
