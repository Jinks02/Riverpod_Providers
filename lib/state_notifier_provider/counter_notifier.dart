import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterStateNotifierProvider =
    StateNotifierProvider<CounterNotifier, int>(
  (ref) => CounterNotifier(),
);

// used most in riverpod
// used to handle immutable states


class CounterNotifier extends StateNotifier<int> {
  CounterNotifier() : super(0); // 0 is the initial state

  void increment() {
    state++;
  }
}
