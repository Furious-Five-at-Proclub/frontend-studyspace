import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final roomDetailNotifier =
    ChangeNotifierProvider.family<RoomDetail, int>((ref, roomId) {
  return RoomDetail();
});

class RoomDetail extends ChangeNotifier {
  bool isWishlisted = false;

  void toggleWishlist(BuildContext context) {
    isWishlisted = !isWishlisted;
    notifyListeners();

    if (isWishlisted) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Room added to wishlist')));
      return;
    }
  }
}
