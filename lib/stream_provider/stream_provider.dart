import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tutorial/stream_provider/fetch_number_stream.dart';

// stream prov is same to future prov but for streams, used for listening to stream of data from firebase or web sockets

// final numberStreamProvider = StreamProvider.autoDispose<int>(
//   (ref) => fetchNumbersStream(),
// );
final numberStreamProvider = StreamProvider<int>(
  (ref) => fetchNumbersStream(),
);

class StreamProviderWidget extends ConsumerWidget {
  const StreamProviderWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var intAsyncValue = ref.watch(numberStreamProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("get stream of numbers"),
      ),
      body: intAsyncValue.when( // async value means value will come in future
        data: (data) {
          return Center(
            child: Text(
              data.toString(),
              style: const TextStyle(
                fontSize: 30,
              ),
            ),
          );
        },
        error: (error, stackTrace) {
          return Center(
            child: Text(
              error.toString(),
              style: const TextStyle(
                fontSize: 30,
              ),
            ),
          );
        },
        loading: () {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
