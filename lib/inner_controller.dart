part of 'inner_drawer.dart';

class InnerDrawerController {
  late _InnerDrawerState _innerDrawerState;

  // ignore: library_private_types_in_public_api
  void attach(_InnerDrawerState innerDrawerState) {
    _innerDrawerState = innerDrawerState;
  }

  void animateToOpen() {
    _innerDrawerState._animateToOpen();
  }

  void animateToClose() {
    _innerDrawerState._animateToClose();
  }
}
