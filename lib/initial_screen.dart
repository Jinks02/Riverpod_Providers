import 'package:flutter/material.dart';
import 'package:riverpod_tutorial/state_notifier_provider/state_notifier_provider.dart';

import 'change_notifier_provider/change_notifier_provider.dart';
import 'future_provider/future_provider.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const FutureProviderWidget(),
                // builder: (context) => const StreamProviderWidget(),
                // builder: (context) => const StateNotifierProviderWidget(),
                // builder: (context) => const ChangeNotifierProviderWidget(),
              ),
            );
          },
          child: const Text("Future Prov."),
          // child: const Text("Stream Prov."),
          // child: const Text("State notif. prov."),
          // child: const Text("change notif. prov."),
        ),
      ),
    );
  }
}
