import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_wallet/core/models/transaction_model.dart';

final prSelectedBank = StateProvider<String>((ref) => 'BPI');
final prTargetAccount = StateProvider<String>((ref) => '');
final prTransferAmount = StateProvider((ref) => 0);

class TransactionProvider extends StateNotifier<List<TransactionModel>> {
  TransactionProvider() : super([]);

  void addRecord(TransactionModel transaction) {
    state = [...state, transaction];
  }
}
