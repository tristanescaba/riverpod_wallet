import 'package:flutter_riverpod/flutter_riverpod.dart';

final prSelectedBank = StateProvider<String>((ref) => 'BPI');
final prTargetAccount = StateProvider<String>((ref) => '');
final prTransferAmount = StateProvider((ref) => 0);
