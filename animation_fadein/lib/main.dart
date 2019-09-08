import 'package:flutter_web/material.dart';
import 'package:animation_fadein/fadein.dart';

void main() {
  runApp(MaterialApp(
    title: 'AnimationFadein',
    initialRoute: '/',
    routes: {
      '/': (context) => Menu(),
      '/10': (context) => Screen10(),
      // '/100': (context) => Screen100(),
      // '/1000': (context) => Screen1000(),
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
              child: Text('10'),
              onPressed: () {
                Navigator.pushNamed(context, '/10');
              },
            ),
            RaisedButton(
              child: Text('100'),
              onPressed: () {
                Navigator.pushNamed(context, '/100');
              },
            ),
            RaisedButton(
              child: Text('1000'),
              onPressed: () {
                Navigator.pushNamed(context, '/1000');
              },
            ),
          ],
        ),
      ),
    );
  }
}

class Screen10 extends StatefulWidget {
  Screen10({Key key}) : super(key: key);

  _Screen10State createState() => _Screen10State();
}

class _Screen10State extends State<Screen10> {
  List<Widget> w = <Widget>[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AnimationFadein 10"),
      ),
      body: ListView(
        children: <Widget>[
          RaisedButton(
            onPressed: (){
              setState((){
                for ( int i=0 ; i<100 ; i++ ) {
                  w.add(animationWidget(i));
                }
              });
            },
            child: Text("Start!"),
          ),
          Wrap(
            children: w,
          ),
        ],
      ),
    );
  }
}

Widget animationWidget(int i) {
  return FadeinWidget(
    child: Container(
      color: Colors.green,
      width: 20.0,
      height: 20.0,
    ),
    size: Size(20.0, 20.0),
    duration: 300,
    delay: i * ( 1.0 / 100 ),
  );
}