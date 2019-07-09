import 'package:flutter_web/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
      body: Container(
        color: Colors.green,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Container(
          color: Colors.blue,
          // width: 200.0,
          // height: 100.0,
          // child: Text('Hello, World!')
          // child: ConstrainedBox(
          //   // constraints: BoxConstraints(maxWidth: 200.0, minWidth: 200.0),
          //   // constraints: BoxConstraints.expand(width: 200.0, height: 100.0),
          //   // constraints: BoxConstraints.loose(Size(200.0, 100.0)),
          //   // constraints: BoxConstraints.tight(Size(200.0, 100.0)),
          //   constraints: BoxConstraints.tightFor(width: 200.0, height: 100.0),
          //   child: Text('Hello, World!'),
          // ),
          // child: SizedBox(
          //   width: 200.0,
          //   child: Text('Hello, World!'),
          // ),
          // child: Center(
          //   // widthFactor: 0.0,
          //   heightFactor: 1.0,
          //   child: Text('Hello, World!'),
          // ),
          child: Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              width: 400.0,
              child: Text('Hello, World!'),
            ),
          )
        ),
      ),
    );
  }
}
