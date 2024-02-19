part of '../slidable_drawer.dart';

/// This class is used to control the SlidableDrawer.
final class SlidableDrawerController extends ChangeNotifier {
  late BaseSlidableDrawerState _innerDrawerState;
  // This method is used to attach the SlidableDrawerState to the SlidableDrawerController.
  void attach(BaseSlidableDrawerState innerDrawerState) {
    _innerDrawerState = innerDrawerState;
  }

  // This method is used to animate the SlidableDrawer to open.
  void animateToOpen() {
    _innerDrawerState.animateToOpen();
  }

// This method is used to animate the SlidableDrawer to close.
  void animateToClose() {
    _innerDrawerState.animateToClose();
  }
}
