import 'package:flutter_web/animation.dart';
import 'package:flutter_web/material.dart';

class RotateLogo extends StatefulWidget {
  _RotateLogoState createState() => _RotateLogoState();
}

class _RotateLogoState extends State<RotateLogo> with SingleTickerProviderStateMixin {
  Animation<double> rotationAnimation;
  AnimationController rotationController;

  @override
  void initState() {
    super.initState();
    rotationController = AnimationController(duration: const Duration(milliseconds: 300), vsync: this);
    rotationAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(rotationController);
    rotationController.forward(from: 0.0);
  }

  @override
  Widget build(BuildContext context) => RotatedLogo(animation: rotationAnimation);

  @override
  void dispose() {
    rotationController.dispose();
    super.dispose();
  }
}

class RotatedLogo extends AnimatedWidget {
  RotatedLogo({Key key, Animation<double> animation}) : super(key: key, listenable: animation);

  Widget build(BuildContext context) {
    return Center(
      child: RotationTransition(
        turns: listenable,
        child: Container(
          width: 100.0,
          height: 100.0,
          child: FlutterLogo(),
        )
      )
    );
  }
}
