import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userChangeNotifierProvider = ChangeNotifierProvider<User>(
  (ref) => User(),
);
// works on mutable states
//using it is discouraged by riverpod

class User extends ChangeNotifier {
  String userName = 'Jinks'; // or u can make this string private and use its getter

  void changeUserName() {
    userName = 'Ajinkya';
    notifyListeners();
  }
}
