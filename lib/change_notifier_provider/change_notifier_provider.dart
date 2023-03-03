import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tutorial/change_notifier_provider/user.dart';

// works on mutable states
//using it is discouraged by riverpod

// app is that the user name will change on button click

class ChangeNotifierProviderWidget extends ConsumerWidget {
  const ChangeNotifierProviderWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("change notif.prov."),
      ),
      body: Center(
        child: Consumer(
          builder: (context, ref, child) {
            var data = ref.watch(userChangeNotifierProvider);
            return Text(
              data.userName,
              style: const TextStyle(
                fontSize: 30,
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(userChangeNotifierProvider.notifier).changeUserName();
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
