import 'package:flutter_web/material.dart';
import 'dart:html';
import 'package:flutter_web_ui/ui.dart' as ui;

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
    ui.platformViewRegistry.registerViewFactory(
      'hello-world-html',
      (int viewId) => IFrameElement()
        ..width = '640'
        ..height = '360'
        ..src = 'assets/sample.gif'
        ..style.border = 'none'
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Hello, World!'),
            Image.asset('sample.gif'),
            SizedBox(
              width: 640,
              height: 360,
              child: HtmlView(viewType: 'hello-world-html'),
            ),
          ],
        ),
      ),
    );
  }
}
