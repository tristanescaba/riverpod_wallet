import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_wallet/core/models/transaction_model.dart';
import 'package:riverpod_wallet/core/providers/transaction_provider.dart';
import 'package:riverpod_wallet/ui/shared/utils/constants.dart';
import 'package:riverpod_wallet/ui/shared/widgets/transaction_record_tile.dart';

final transactionProvider = StateNotifierProvider<TransactionProvider, List<TransactionModel>>((ref) {
  return TransactionProvider();
});

class HistoryPanelView extends ConsumerWidget {
  const HistoryPanelView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<TransactionModel> transaction = ref.watch(transactionProvider);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0),
          child: Center(
            child: Container(
              height: 8.0,
              width: 50.0,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
          ),
        ),
        transaction.isEmpty
            ? Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height / 10),
                  const Icon(Icons.history, size: 35.0, color: kTextColor),
                  const SizedBox(height: 10.0),
                  const Text(
                    'No transactions record yet.',
                    style: TextStyle(
                      fontSize: 15.0,
                      color: kTextColor,
                    ),
                  ),
                ],
              )
            : Expanded(
                child: ListView(
                  children: [
                    for (final record in transaction)
                      Column(
                        children: [
                          TransactionRecordTile(record: record),
                          const Divider(),
                        ],
                      )
                  ],
                ),
              ),
      ],
    );
  }
}
