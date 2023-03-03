import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tutorial/state_notifier_provider/counter_notifier.dart';

// used most in riverpod
// used to handle immutable states

class StateNotifierProviderWidget extends ConsumerWidget {
  const StateNotifierProviderWidget({super.key});

  // counter using StateNotifierProvider

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // int count = ref.watch(counterStateNotifierProvider);  // use consumer widget if u want to rebuild that specific widget like in provider

    return Scaffold(
      appBar: AppBar(
        title: const Text("counter with StateNotifierProvider"),
      ),
      body: Center(
        child: Consumer(
          builder: (context, ref, child) {
            int count = ref.watch(counterStateNotifierProvider);
            return Text(
              count.toString(),
              style: const TextStyle(fontSize: 30),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref
              .read(counterStateNotifierProvider.notifier)
              .increment(); // read so that button does no get built again as its not changing its state
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
