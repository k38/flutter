import 'package:flutter/material.dart';
// import 'dart:async';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            AnimWidget(child: FlutterLogo(size: 200), size: 200.0, duration: 2000, delay: 0.0),
            AnimWidget(child: FlutterLogo(size: 200), size: 200.0, duration: 2000, delay: -2.0),
            AnimWidget(child: FlutterLogo(size: 200), size: 200.0, duration: 2000, delay: -4.0),
            AnimWidget(child: FlutterLogo(size: 200), size: 200.0, duration: 2000, delay: -6.0),
            AnimWidget(child: FlutterLogo(size: 200), size: 200.0, duration: 2000, delay: -8.0),
          ],
        )
      ),
    );
  }
}

class AnimWidget extends StatefulWidget {
  final Widget child;
  final double size;
  final double delay;
  final int duration;
  AnimWidget({@required this.child, @required this.size, @required this.duration, @required this.delay});
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
    _animationFade = Tween(
      begin: widget.delay,
      // begin: 0.0,
      end: 1.0,
    ).animate(_controller);
    _animationScale = Tween(
      begin: widget.delay,
      // begin: 0.0,
      end: 1.0,
    ).animate(_controller);
    _animationSlide = Tween<Offset>(
      begin: Offset(0.0, 5.0 - widget.delay),
      // begin: Offset(0.0, 5.0),
      end: Offset.zero,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  /// delayをfuture builderで実現しようとした
  /// 時間差は表現できるけど、アニメーションがいう事を聞かない
  // @override
  // Widget build(BuildContext context) {
  //   _controller.forward();

  //   return FutureBuilder(
  //     future: _timer(5),
  //     builder: (BuildContext context, AsyncSnapshot snapshot) {
  //       if ( !snapshot.hasData ){
  //         return Container();
  //       }
  //       return Container(
  //         child: FadeTransition(
  //           opacity: _animationFade,
  //           child: SlideTransition(
  //             position: _animationSlide,
  //             child: widget.child,
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }

  // Future<dynamic> _timer(int sec) async {
  //   await Future.delayed(Duration(seconds: sec));
  //   return {
  //     'success': true,
  //   };
  // }

  // Containerからchildがはみだす
  @override
  Widget build(BuildContext context) {
    _controller.forward();

    return Container(
      width: widget.size,
      height: widget.size,
      // constraints: BoxConstraints.expand(width: 200.0, height: 200.0),
      // constraints: BoxConstraints.tight(Size(200.0, 200.0)),
      constraints: BoxConstraints.tight(Size(200.0, 200.0)),
      child: FadeTransition(
        opacity: _animationFade,
        child: SlideTransition(
          position: _animationSlide,
          child: widget.child,
        ),
        // child: ScaleTransition(
        //   scale: _animationScale,
        //   alignment: Alignment.center,
        //   child: widget.child,
        // ),
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   _controller.forward();

  //   return ClipRect(
  //     child: FadeTransition(
  //       opacity: _animationFade,
  //       child: SlideTransition(
  //         position: _animationSlide,
  //         child: widget.child,
  //       ),
  //       // child: ScaleTransition(
  //       //   scale: _animationScale,
  //       //   alignment: Alignment.center,
  //       //   child: widget.child,
  //       // ),
  //     ),
  //   );
  // }

  /// 要素外を消せたけど、アニメーションがいう事をきかない
  // @override
  // Widget build(BuildContext context) {
  //   _controller.forward();

  //   return ClipRect(
  //     child: FadeTransition(
  //       opacity: _animationFade,
  //       child: SlideTransition(
  //         position: _animationSlide,
  //         child: widget.child,
  //       ),
  //       // child: ScaleTransition(
  //       //   scale: _animationScale,
  //       //   alignment: Alignment.center,
  //       //   child: widget.child,
  //       // ),
  //     ),
  //   );
  // }

  // 領域外もレンダリングされる
  // @override
  // Widget build(BuildContext context) {
  //   _controller.forward();

  //   return ConstrainedBox(
  //     // constraints: BoxConstraints(maxWidth: 200.0, maxHeight: 200.0),
  //     constraints: BoxConstraints.tight(Size(200.0, 200.0)),
  //     child: FadeTransition(
  //       opacity: _animationFade,
  //       child: SlideTransition(
  //         position: _animationSlide,
  //         child: widget.child,
  //       ),
  //       // child: ScaleTransition(
  //       //   scale: _animationScale,
  //       //   alignment: Alignment.center,
  //       //   child: widget.child,
  //       // ),
  //     ),
  //   );
  // }
}
