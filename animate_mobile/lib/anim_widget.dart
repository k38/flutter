import 'package:flutter/material.dart';

class AnimWidget extends StatefulWidget {
  final Widget child;
  final String type;
  final Size size;
  final double delay;
  final int duration;
  final double value;
  AnimWidget({@required this.child, @required this.type, @required this.size, @required this.duration, @required this.delay, this.value = 5.0});
  @override
  _AnimWidgetState createState() => _AnimWidgetState();
}

class _AnimWidgetState extends State<AnimWidget> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _animationFade;
  Animation _animationScale;
  Animation _animationSlide;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: widget.duration),
    );

    CurvedAnimation curvedAnimation = CurvedAnimation(
      parent: _controller,
      curve: Interval(widget.delay, 1.0, curve: Curves.fastOutSlowIn),
    );
    _animationFade = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(curvedAnimation);

    switch ( widget.type ) {
      case 'slideIn':
        _animationSlide = Tween<Offset>(
          begin: Offset(0.0, widget.value),
          end: Offset.zero,
        ).animate(curvedAnimation);
        break;

      case 'scaleIn':
        _animationScale = Tween(
          begin: 0.0,
          end: 1.0,
        ).animate(curvedAnimation);
        break;
    } 
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
    switch ( widget.type ) {
      case 'slideIn':
        child = SlideTransition(
          position: _animationSlide,
          child: widget.child,
        );
        break;
      case 'scaleIn':
        child = ScaleTransition(
          scale: _animationScale,
          alignment: Alignment.center,
          child: widget.child,
        );
        break;
      default:
        child = widget.child;
        break;
    }

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
