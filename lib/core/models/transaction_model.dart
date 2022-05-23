class TransactionModel {
  final double amount;
  final String trnType, target, source;

  TransactionModel({
    required this.trnType,
    required this.target,
    required this.source,
    required this.amount,
  });

  TransactionModel copyWith({String? trnType, String? target, String? source, double? amount}) {
    return TransactionModel(
      trnType: trnType ?? this.trnType,
      target: target ?? this.target,
      source: source ?? this.source,
      amount: amount ?? this.amount,
    );
  }
}
