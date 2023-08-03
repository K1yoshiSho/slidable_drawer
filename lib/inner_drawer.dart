import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class InnerDrawer extends StatefulWidget {
  final Widget child;
  final Widget drawerBody;
  final double? drawerWidth;
  const InnerDrawer({
    super.key,
    required this.child,
    required this.drawerBody,
    this.drawerWidth,
  });

  @override
  State<InnerDrawer> createState() => _InnerDrawerState();
}

class _InnerDrawerState extends State<InnerDrawer> with SingleTickerProviderStateMixin {
  late double _drawerValue;
  late double _initialWidth;
  double _opacityValue = 0.0;
  late AnimationController _controller;
  late Animation _animation;
  VelocityTracker _velocityTracker = VelocityTracker.withKind(PointerDeviceKind.touch);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
  }

  @override
  void didChangeDependencies() {
    _drawerValue = -(widget.drawerWidth ?? MediaQuery.sizeOf(context).width * 0.75);
    _initialWidth = widget.drawerWidth ?? MediaQuery.sizeOf(context).width * 0.75;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragUpdate: (details) {
        _velocityTracker.addPosition(details.sourceTimeStamp ?? const Duration(), details.globalPosition);
        setState(() {
          _drawerValue += details.delta.dx;
          _drawerValue = _drawerValue.clamp(-_initialWidth, 0.0);
          _opacityValue = (_drawerValue + _initialWidth) / _initialWidth;
        });
      },
      onHorizontalDragEnd: (details) {
        final velocity = _velocityTracker.getVelocity().pixelsPerSecond.dx;
        _velocityTracker = VelocityTracker.withKind(PointerDeviceKind.touch); // reset tracker
        if (velocity > 1000 || _drawerValue > -(_initialWidth / 2)) {
          _animateToOpen();
        } else {
          _animateToClose();
        }
      },
      child: Stack(
        children: <Widget>[
          // Main content
          widget.child,
          // Custom drawer
          Container(
            color: Colors.black.withOpacity(_opacityValue < 0.3 ? _opacityValue : 0.3),
          ),
          Transform.translate(
            offset: Offset(_drawerValue, 0.0),
            child: SizedBox(
              width: widget.drawerWidth ?? MediaQuery.sizeOf(context).width * 0.75,
              child: widget.drawerBody,
            ),
          ),
        ],
      ),
    );
  }

  void _animateToOpen() {
    _animation = Tween<double>(begin: _drawerValue, end: 0.0).animate(_controller)
      ..addListener(() {
        setState(() {
          _drawerValue = _animation.value;
          _opacityValue = (_drawerValue + _initialWidth) / _initialWidth;
        });
      });
    _controller.value = 0; // set controller value to 0 before starting the animation
    _controller.forward();
  }

  void _animateToClose() {
    _animation = Tween<double>(begin: _drawerValue, end: -_initialWidth).animate(_controller)
      ..addListener(() {
        setState(() {
          _drawerValue = _animation.value;
          _opacityValue = (_drawerValue + _initialWidth) / _initialWidth;
        });
      });
    _controller.value = 0; // set controller value to 0 before starting the animation
    _controller.forward();
  }
}
