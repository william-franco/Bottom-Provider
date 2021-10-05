import 'package:flutter/material.dart';

class ListProvider with ChangeNotifier {
  int _count = 0;
  final List<int> _numbers = [];

  List<int> get numbers => _numbers;

  void increment() {
    _count++;
    _numbers.add(_count);
    _debugProvider();
    notifyListeners();
  }

  void decrement() {
    _count > 0 ? _count-- : 0;
    _numbers.isNotEmpty ? _numbers.removeLast() : 0;
    _debugProvider();
    notifyListeners();
  }

  void removeAll() {
    _count = 0;
    _numbers.clear();
    _debugProvider();
    notifyListeners();
  }

  void _debugProvider() {
    print('List item: $_numbers');
  }
}
