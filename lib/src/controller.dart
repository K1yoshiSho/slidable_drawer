part of '../slidable_drawer.dart';

/// This class is used to control the SlidableDrawer.
class SlidableDrawerController {
  late SlidableDrawerState _innerDrawerState;

  // This method is used to attach the SlidableDrawerState to the SlidableDrawerController.
  // ignore: library_private_types_in_public_api
  void attach(SlidableDrawerState innerDrawerState) {
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
