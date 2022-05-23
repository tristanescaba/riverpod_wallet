import 'package:flutter/material.dart';
import 'package:riverpod_wallet/core/models/transaction_model.dart';
import 'package:riverpod_wallet/ui/shared/utils/constants.dart';

class TransactionRecordTile extends StatelessWidget {
  final TransactionModel record;

  const TransactionRecordTile({
    Key? key,
    required this.record,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        height: 40.0,
        width: 40.0,
        decoration: BoxDecoration(
          color: kPrimaryLightColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(
          record.trnType == 'Fund Transfer' ? Icons.near_me_rounded : Icons.download_rounded,
          color: kSecondaryColor,
        ),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(record.trnType),
          Row(
            children: [
              Icon(
                record.trnType == 'Fund Transfer' ? Icons.remove : Icons.add,
                color: record.trnType == 'Fund Transfer' ? Colors.red : Colors.green,
                size: 15.0,
              ),
              Text(' ${number.format(record.amount)}'),
            ],
          ),
        ],
      ),
      subtitle: Text(record.trnType == 'Fund Transfer' ? 'Target: ${record.target}' : 'Source: ${record.source}'),
    );
  }
}
