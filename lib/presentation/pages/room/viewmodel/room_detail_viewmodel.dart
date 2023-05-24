import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/checkin.dart';

final roomDetailViewModel =
    ChangeNotifierProvider.autoDispose((ref) => RoomDetailViewModel());

// this is just dummy data
enum SpaceType { hangout, working, unselected }

class RoomDetailViewModel extends ChangeNotifier {
  SpaceType selectedSpace = SpaceType.unselected;
  CheckIn? checkIn;

  void selectSpaceType(SpaceType space) {
    if (selectedSpace == space) {
      selectedSpace = SpaceType.unselected;
      notifyListeners();
      return;
    }

    selectedSpace = space;
    notifyListeners();
  }

  void selectCheckIn(CheckIn? checkIn) {
    if (checkIn == null) return;

    this.checkIn = checkIn;
    notifyListeners();
  }
}
