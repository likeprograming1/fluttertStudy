import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_examplel/notifier.dart';
import 'package:riverpod_examplel/state.dart';

final mainProvider =
    StateNotifierProvider<mainIncrementNotifier, mainState>((ref) {
  return mainIncrementNotifier();
});
