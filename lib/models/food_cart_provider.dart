import 'package:flutter/material.dart';

class FoodCartProvider with ChangeNotifier {
  Map<int, int> _foodCounts = {};

  Map<int, int> get foodCounts => _foodCounts;

  void incrementFoodCount(int id) {
    if (_foodCounts.containsKey(id)) {
      _foodCounts[id] = _foodCounts[id]! + 1;
    } else {
      _foodCounts[id] = 1;
    }
    notifyListeners();
  }

  void decrementFoodCount(int id) {
    if (_foodCounts.containsKey(id) && _foodCounts[id]! > 0) {
      _foodCounts[id] = _foodCounts[id]! - 1;
      if (_foodCounts[id] == 0) {
        _foodCounts.remove(id);
      }
      notifyListeners();
    }
  }
}
