import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final stringProvider = Provider<String>(
    (ref) => "I am a string provided by normal provider in riverpod");
// in riverpod we make providers global,either you can make separate file for providers or make it where it will be used,and make them final
// ref used to access other providers
// above provider is a read only provider

class SimpleProvider extends ConsumerWidget {
  // the widget in which you want to consume the provider should be converted to consumerWidget for stateless and consumerStateful for stateful
  const SimpleProvider({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String providerData = ref.read<String>(stringProvider);
    debugPrint(providerData);
    return const Scaffold();
  }
}
