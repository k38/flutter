import 'package:flutter_web/material.dart';

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
                w.add(Text("a"));
                w.add(Text("b"));
                w.add(Text("c"));
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
