import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../infrastructures/models/payment.dart';

// view model
final roomBookingSummaryViewModel =
    ChangeNotifierProvider.autoDispose((ref) => RoomBookingSummaryViewModel());

class RoomBookingSummaryViewModel extends ChangeNotifier {
  Payment? selectedPayment;

  void selectPayment(Payment? value) {
    if (value == null) return;

    selectedPayment = value;
    notifyListeners();
  }
}
