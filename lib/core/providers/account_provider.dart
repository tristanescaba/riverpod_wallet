import 'package:flutter_riverpod/flutter_riverpod.dart';

final prAccountNumber = StateProvider<String>((ref) => '09123456789');
final prAccountBalance = StateProvider((ref) => 100);
