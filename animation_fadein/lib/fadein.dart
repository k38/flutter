import 'package:flutter_web/material.dart';

class FadeinWidget extends StatefulWidget {
  final Widget child;
  final Size size;
  final double delay;
  final int duration;
  FadeinWidget({@required this.child, @required this.size, @required this.duration, @required this.delay});
  @override
  _FadeinWidgetState createState() => _FadeinWidgetState();
}

class _FadeinWidgetState extends State<FadeinWidget> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _animationFade;
  Animation _animationScale;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: widget.duration),
    );

    CurvedAnimation curvedAnimation = CurvedAnimation(
      parent: _controller,
      curve: Interval(widget.delay, 1.0, curve: Curves.fastOutSlowIn),
      // curve: Interval(0.9, 1.0, curve: Curves.fastOutSlowIn),
      // curve: Interval(widget.delay, widget.delay + 1.0, curve: Curves.fastOutSlowIn),
      // curve: Interval(widget.delay, 0.5, curve: Curves.fastOutSlowIn),
    );
    _animationFade = Tween(
      begin: 0.0,
      end: 1.0,
      // end: 100.0,
    ).animate(curvedAnimation);
    _animationScale = Tween(
      begin: 0.0,
      end: 1.0,
      // end: 100.0,
    ).animate(curvedAnimation);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller.forward();
    Widget child;
    child = ScaleTransition(
      scale: _animationScale,
      alignment: Alignment.center,
      child: widget.child,
    );

    return Container(
      width: widget.size.width,
      height: widget.size.height,
      child: FadeTransition(
        opacity: _animationFade,
        child: child,
      ),
    );
  }
}
