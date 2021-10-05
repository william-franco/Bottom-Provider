import 'package:flutter/material.dart';

class CounterProvider with ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;
    _debugProvider();
    notifyListeners();
  }

  void decrement() {
    _count > 0 ? _count-- : 0;
    _debugProvider();
    notifyListeners();
  }

  void removeAll() {
    _count = 0;
    _debugProvider();
    notifyListeners();
  }

  void _debugProvider() {
    print('Count: $_count');
  }
}
