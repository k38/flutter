import 'package:flutter_web/material.dart';
import 'package:animation_fadein/fadein.dart';

void main() {
  runApp(MaterialApp(
    title: 'AnimationFadein',
    initialRoute: '/',
    routes: {
      '/': (context) => Menu(),
      '/1': (context) => Screen(rows: 1),
      '/2': (context) => Screen(rows: 2),
      '/5': (context) => Screen(rows: 5),
      '/10': (context) => Screen(rows: 10),
    },
  ));
}

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimationFadein'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text("50 * 1"),
              onPressed: () {
                Navigator.pushNamed(context, '/1');
              },
            ),
            RaisedButton(
              child: Text("50 * 2"),
              onPressed: () {
                Navigator.pushNamed(context, '/2');
              },
            ),
            RaisedButton(
              child: Text('50 * 5'),
              onPressed: () {
                Navigator.pushNamed(context, '/5');
              },
            ),
            RaisedButton(
              child: Text('50 * 10'),
              onPressed: () {
                Navigator.pushNamed(context, '/10');
              },
            ),
          ],
        ),
      ),
    );
  }
}

class Screen extends StatefulWidget {
  final int number = 50;
  int rows;
  Screen({this.rows});

  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  // List<Widget> w = <Widget>[];
  List<Wrap> wrapList = <Wrap>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AnimationFadein ${widget.number} * ${widget.rows}"),
      ),
      body: ListView(
        children: <Widget>[
          RaisedButton(
            onPressed: (){
              setState((){
                for ( int j=0 ; j<widget.rows ; j++ ) {
                  List<Widget> w = <Widget>[];
                  double b = j * 0.1;
                  double a = 1.0 - b;
                  for ( int i=0 ; i<widget.number ; i++ ) {
                    w.add(_animationWidget(i, j, a, b));
                  }
                  wrapList.add(Wrap(
                    children: w,
                  ));
                }
              });
            },
            child: Text("Start!"),
          ),
          ...wrapList,
        ],
      ),
    );
  }
  Widget _animationWidget(int i, int j, double a, double b) {
    double delay = ( ( a * i * i / 2500 + b ) * 10 ).round() / 10;
    return FadeinWidget(
      child: Container(
        color: Colors.green,
        width: 20.0,
        height: 20.0,
      ),
      size: Size(20.0, 20.0),
      // duration: 300,
      // duration: 600,
      // duration: 900,
      duration: 1200,
      delay: delay,
    );
  }
}
