import 'package:flutter_web/material.dart';

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
    int threshold = 1000;
    Size media = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(),
      drawer: media.width < threshold ? Drawer( child: Menu() ) : null,
      body: Row(
        children: <Widget>[
          media.width > threshold ? Flexible(flex: 1, child: Menu()) : Container(),
          Flexible(
            flex: 4,
            child: Center(
              child: Text(
                "Size ${media.width} * ${media.height}",
                style: Theme.of(context).textTheme.title,
              )
            ),
          ),
        ],
      )
    );
  }
}

class Menu extends StatelessWidget {
  const Menu({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        DrawerHeader(
          child: Text('Drawer Header'),
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
        ),
        ListTile(
          title: Text('Item 1'),
          onTap: () {},
        ),
        ListTile(
          title: Text('Item 2'),
          onTap: () {},
        ),
      ],
    );
  }
}