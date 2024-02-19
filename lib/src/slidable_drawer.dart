part of '../slidable_drawer.dart';

class SlidableDrawer extends StatefulWidget {
  final Widget child;
  final Widget drawerBody;
  final double? drawerWidth;
  final SwipeDirection swipeDirection;
  final SlidableDrawerController? innerDrawerController;
  final double scaleValue;

  const SlidableDrawer({
    super.key,
    required this.child,
    required this.drawerBody,
    this.swipeDirection = SwipeDirection.leftToRight,
    this.drawerWidth,
    this.innerDrawerController,
    this.scaleValue = 0.75,
  });

  @override
  State<SlidableDrawer> createState() => _SlidableDrawerState();
}

class _SlidableDrawerState extends State<SlidableDrawer> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SlidableDrawerController>(
      create: (context) => widget.innerDrawerController ?? SlidableDrawerController(),
      child: _BaseSlidableDrawer(
        drawerBody: widget.drawerBody,
        swipeDirection: widget.swipeDirection,
        drawerWidth: widget.drawerWidth,
        innerDrawerController: widget.innerDrawerController,
        scaleValue: widget.scaleValue,
        child: widget.child,
      ),
    );
  }
}
