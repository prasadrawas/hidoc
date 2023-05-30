import 'package:flutter/foundation.dart';

import '../../enum/view_state.dart';

class BaseModel with ChangeNotifier {
  ViewState _state = ViewState.idle;

  ViewState get state => _state;

  set state(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }

  void update() {
    notifyListeners();
  }
}
