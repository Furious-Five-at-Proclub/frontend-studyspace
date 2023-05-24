import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/checkin.dart';

final checkInNotifier =
    ChangeNotifierProvider.autoDispose((ref) => CheckInNotifier());

class CheckInNotifier extends ChangeNotifier {
  CheckinDuration duration = CheckinDuration.onehour;
  DateTime date = DateTime.now();
  String time = '';

  void selectCheckinDuration(CheckinDuration? value) {
    if (value != null) {
      duration = value;
      notifyListeners();
    }
  }

  void selectCheckinDate(DateTime? value) {
    if (value == null) return;
    
    date = value;
    notifyListeners();
  }

  void selectCheckinTime(String value) {
    if (time == value) {
      time = '';
      notifyListeners();
      return;
    }
    
    time = value;
    notifyListeners();
  }
}
