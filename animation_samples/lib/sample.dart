// https://tphangout.com/flutter-delayed-animations/

import 'package:flutter_web/material.dart';
import 'package:flutter_web/animation.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  Animation animation, delayedAnimation, muchDelayedAnimation;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(duration: Duration(seconds: 5), vsync: this);

    animation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController, curve: Curves.fastOutSlowIn));

    delayedAnimation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn)));

    muchDelayedAnimation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.8, 1.0, curve: Curves.fastOutSlowIn)));

  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    animationController.forward();
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget child) {
        return Scaffold(
            body: Align(
                alignment: Alignment.center,
                child: Container(
                  child: new Center(
                    child: new ListView(
                      shrinkWrap: true,
                      children: <Widget>[
                        Transform(
                          transform: Matrix4.translationValues(
                              animation.value * width, 0.0, 0.0),
                          child: new Center(
                            child: Container(
                                padding: EdgeInsets.all(25.0),
                                child: new Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        'Login',
                                        style: TextStyle(
                                            fontSize: 25.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ])),
                          ),
                        ),
                        Transform(
                          transform: Matrix4.translationValues(
                              delayedAnimation.value * width, 0.0, 0.0),
                          child: Container(
                            padding: EdgeInsets.all(25.0),
                            child: new Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                TextField(
                                  decoration:
                                      InputDecoration(hintText: 'Username'),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                TextField(
                                  decoration:
                                      InputDecoration(hintText: 'Password'),
                                  obscureText: true,
                                ),
                                SizedBox(height: 20.0),
                              ],
                            ),
                          ),
                        ),
                        Transform(
                          transform: Matrix4.translationValues(
                              muchDelayedAnimation.value * width, 0.0, 0.0),
                          child: new Center(
                            child: Container(
                              padding: EdgeInsets.all(25.0),
                              child: new Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  RaisedButton(
                                    child: Text('Login'),
                                    onPressed: () {},
                                    color: Colors.lightBlue,
                                    elevation: 7.0,
                                    textColor: Colors.white,
                                  ),
                                  SizedBox(height: 20.0),
                                  Text('Don\'t have an account?'),
                                  SizedBox(height: 20.0),
                                  OutlineButton(
                                    child: Text('Signup'),
                                    onPressed: () {},
                                    color: Colors.lightGreen,
                                    textColor: Colors.green,
                                    highlightColor: Colors.green,
                                    borderSide: BorderSide(
                                        color: Colors.green,
                                        style: BorderStyle.solid,
                                        width: 2.0),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )));
      },
    );
  }
}