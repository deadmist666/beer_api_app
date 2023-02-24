import 'package:flutter/foundation.dart';

import 'beer_details.dart';

class OpenedBeersModel extends ChangeNotifier {
  List<Beer> _openedBeersHistory = [];

  List<Beer> get openedBeersHistory => _openedBeersHistory;

  void addOpenedBeerToHistory(Beer beer) {
    if (_openedBeersHistory.length > 6) {
      _openedBeersHistory.removeAt(0);
    }
    _openedBeersHistory.insert(0, beer);
    notifyListeners();
  }
}
