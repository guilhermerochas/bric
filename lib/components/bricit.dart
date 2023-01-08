import 'package:flutter/foundation.dart';

class Bricit<TValue> extends ChangeNotifier implements ValueListenable<TValue> {
  TValue _state;

  Bricit(this._state);

  @override
  TValue get value => _state;

  void emit(TValue newState) {
    if (_state == newState) {
      return;
    }

    _state = newState;
    notifyListeners();
  }
}
