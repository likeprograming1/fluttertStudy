import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_examplel/state.dart';

class mainIncrementNotifier extends StateNotifier<mainState> {
  mainIncrementNotifier() : super(mainState());

  Future<void> increment() async {
    try {
      debugPrint("updating...");
      state = state.copyWith(count: state.count + 1);
      debugPrint("update successfully, this is very good!!");
    } catch (e) {
      debugPrint("update Error : $e");
    }
  }

  Future<void> decrement() async {
    try {
      debugPrint("decrement...");
      state = state.copyWith(count: state.count - 1);
      debugPrint("decrement successfully, this is very good!!");
    } catch (e) {
      debugPrint("decrement Error : $e");
    }
  }
}
