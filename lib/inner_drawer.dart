import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

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

class InnerDrawer extends StatefulWidget {
  final Widget child;
  final Widget drawerBody;
  final double? drawerWidth;
  final InnerDrawerController? innerDrawerController;
  const InnerDrawer({
    super.key,
    required this.child,
    required this.drawerBody,
    this.drawerWidth,
    this.innerDrawerController,
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
    if (widget.innerDrawerController != null) {
      widget.innerDrawerController!.attach(this);
    }
  }

  @override
  void didChangeDependencies() {
    _drawerValue = -(widget.drawerWidth ?? MediaQuery.sizeOf(context).width * 0.75);
    _initialWidth = widget.drawerWidth ?? MediaQuery.sizeOf(context).width * 0.75;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    print(_drawerValue);
    return GestureDetector(
      onTapUp: (details) {
        if (_drawerValue == 0 && !_isInDrawerBody(details.localPosition)) {
          _animateToClose();
        }
      },
      onHorizontalDragUpdate: (details) {
        _velocityTracker.addPosition(details.sourceTimeStamp ?? const Duration(), details.globalPosition);
        setState(() {
          _drawerValue += details.delta.dx;
          _drawerValue = _drawerValue.clamp(-_initialWidth, 0.0);
          _opacityValue = (_drawerValue + _initialWidth) / _initialWidth;
        });
      },
      onHorizontalDragEnd: (details) {
        _velocityTracker = VelocityTracker.withKind(PointerDeviceKind.touch); // reset tracker

        if (details.velocity.pixelsPerSecond.dx < -1500 && (_drawerValue < 0)) {
          _animateToClose();
        } else {
          if (details.velocity.pixelsPerSecond.dx > 1500 || _drawerValue > -(_initialWidth / 2)) {
            _animateToOpen();
          } else {
            _animateToClose();
          }
        }
      },
      child: Stack(
        children: <Widget>[
          // Main content
          widget.child,
          // Custom drawer
          Visibility(
            visible: _drawerValue != -_initialWidth,
            child: Container(
              color: Colors.black.withOpacity(_opacityValue < 0.3 ? _opacityValue : 0.3),
            ),
          ),

          Visibility(
            visible: _drawerValue != -_initialWidth,
            child: Transform.translate(
              offset: Offset(_drawerValue, 0.0),
              child: SizedBox(
                width: widget.drawerWidth ?? MediaQuery.sizeOf(context).width * 0.75,
                child: widget.drawerBody,
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool _isInDrawerBody(Offset tapPosition) {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    double drawerBodyLeft = renderBox.localToGlobal(Offset.zero).dx + _drawerValue;
    double drawerBodyRight = drawerBodyLeft + (widget.drawerWidth ?? MediaQuery.sizeOf(context).width * 0.75);
    return tapPosition.dx >= drawerBodyLeft && tapPosition.dx <= drawerBodyRight;
  }

  // void _openDrawer() {
  //   print('open');
  //   _animation = Tween<double>(begin: _drawerValue, end: _initialWidth).animate(_controller)
  //     ..addListener(() {
  //       setState(() {
  //         _drawerValue = _animation.value;
  //         _opacityValue = (_drawerValue + _initialWidth) / _initialWidth;
  //       });
  //     });
  //   _controller.value = 1; // set controller value to 0 before starting the animation
  //   _controller.forward();
  // }

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
    print('close');
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
