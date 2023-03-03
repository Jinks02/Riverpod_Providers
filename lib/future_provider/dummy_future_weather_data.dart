// Future<String> fetchWeatherData() async {
//   return await Future.delayed(const Duration(seconds: 3),() {
//       return "33 deg C";
//     }
//   );
// }

Future<String> fetchWeatherData(String city) async {
  return await Future.delayed(const Duration(seconds: 3),() {
      return "City: $city | 33 deg C";
    }
  );
}
