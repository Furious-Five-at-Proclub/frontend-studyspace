import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../infrastructures/models/payment.dart';

// dummy data
final paymentList = <Payment>[
  const Payment(name: 'Dana', image: 'payment_dana.png'),
  const Payment(name: 'GoPay', image: 'payment_gopay.png'),
  const Payment(name: 'Shopee Pay', image: 'payment_shopee_pay.png'),
];

final paymentQrisList = <Payment>[
  const Payment(name: 'QRIS', image: 'payment_qris.png'),
];

// view model
final paymentMethodViewModel =
    ChangeNotifierProvider.autoDispose((ref) => PaymentMethodViewModel());

class PaymentMethodViewModel extends ChangeNotifier {
  Payment? selectedPayment;

  void selectPayment(Payment? value) {
    if (value == null) return;

    selectedPayment = value;
    notifyListeners();
  }
}
