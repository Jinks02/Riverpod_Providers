import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterStateProvider = StateProvider<int>((ref) => 0);
// final counterStateProvider = StateProvider.autoDispose<int>((ref) => 0);
// state prov. used for storing simaple state objects that can change,eg. enums,strings,booloeans and numbers,and primitive data types

class StateProviderWidget extends ConsumerWidget {
  const StateProviderWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // counter using state provider
    return Scaffold(
      appBar: AppBar(
        title: const Text("counter using state provider"),
      ),
      body: Consumer(
        builder: (context, ref, child) {
          int count = ref.watch(
              counterStateProvider); // listens to that provider and rebuilds consumer widget on state change of that provider
          return Center(
            child: Text(
              count.toString(),
              style: const TextStyle(fontSize: 50),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(counterStateProvider.notifier).state++;
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
