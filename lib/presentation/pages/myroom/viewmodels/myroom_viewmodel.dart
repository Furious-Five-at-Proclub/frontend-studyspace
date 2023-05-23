import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final myRoomViewModel = ChangeNotifierProvider((ref) => MyRoomViewModel());

class MyRoomViewModel extends ChangeNotifier {
  late TabController tabController;

  void initialize(TickerProvider provider) {
    tabController = TabController(length: 3, vsync: provider);
    notifyListeners();
  }
}
