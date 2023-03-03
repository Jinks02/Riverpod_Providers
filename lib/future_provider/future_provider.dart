import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_tutorial/future_provider/dummy_future_weather_data.dart';

// future prov. is prov. but only for async code and used to get data which will arrive in future and the data is saved by default so req. does not get sent again for same data,if you dont wanna save it use auto dispose

// final weatherFutureProvider = FutureProvider.autoDispose(
//   (ref) => fetchWeatherData(),
// );

// final weatherFutureProvider = FutureProvider<String>(
//   (ref) => fetchWeatherData(),
// );

// while using family modifier, we just provide parameter(s) to the fetch weather data func, the first type is the type which will be returned and second is the type of argument that wiil bw passed.
// can take cityName from user also
final weatherFutureProvider = FutureProvider.family<String,String>(
  (ref, cityName) => fetchWeatherData(cityName),
);

class FutureProviderWidget extends ConsumerWidget {
  const FutureProviderWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("get weather using future prov"),
      ),
      body: ref.watch(weatherFutureProvider("Aurangabad")).when( // providing argument from UI
        data: (data) {
          return Center(
            child: Text(
              data,
              style: const TextStyle(fontSize: 30),
            ),
          );
        },
        error: (error, stackTrace) {
          return Center(
            child: Text(
              error.toString(),
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
