import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeViewModel =
    ChangeNotifierProvider.autoDispose((ref) => HomeViewModel());

enum HomeChip { unselected, promo, termurah, terdekat }

class HomeViewModel extends ChangeNotifier {

  HomeChip _selectedChip = HomeChip.unselected;

  bool isChipSelected(HomeChip value) {
    return _selectedChip == value;
  }

  void changeSelectedChip(HomeChip value) {
    _selectedChip = value;
    notifyListeners();
  }
}
