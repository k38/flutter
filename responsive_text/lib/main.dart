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
      home: MyHomePage(title: 'Column内におけるTextのResponsive対応の検討'),
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
      body: ListView(
        children: <Widget>[
          Text('A) Columnで囲ったContainerにTextを配置した'),
          Text('幅を越えた部分が表示されないので困る'),
          rowText(context),
          Container(height: 20.0),

          Text('B) TextにtextScaleFactorとsoftWrapを設定してみた'),
          Text('縮小しきれていないので困る'),
          rowText2(context),
          Container(height: 20.0),

          Text('C) Containerにfit(fitWidth)を設定してみた'),
          Text('幅はいいけど高さが合わない場合があって困る'),
          rowText3(context),
          Container(height: 20.0),

          Text('D) Containerにfit(scaleDown)を設定してみた'),
          Text('見えなくなる事はなくなったので、ひとまずこれでいい'),
          rowText4(context),
        ],
      ),
    );
  }

  Widget columnText(BuildContext context, String str) {
    double w = MediaQuery.of(context).size.width / 50.0;
    return Column(
      children: <Widget>[
        Container(
          width: w,
          height: 20.0,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blueGrey),
          ),
          child: Text(str),
        )
      ],
    );
  }
  Widget rowText(BuildContext context) {
    return Row(
      children: <Widget>[
        columnText(context, '9'),
        columnText(context, ''),
        columnText(context, ''),
        columnText(context, '10'),
        columnText(context, ''),
        columnText(context, ''),
        columnText(context, 'CCCCC'),
        columnText(context, ''),
        columnText(context, ''),
        columnText(context, 'DDDDD'),
        columnText(context, ''),
        columnText(context, ''),
        columnText(context, 'EEEEE'),
        columnText(context, ''),
        columnText(context, ''),
      ],
    );
  }

  Widget columnText2(BuildContext context, String str) {
    double w = MediaQuery.of(context).size.width / 50.0;
    return Column(
      children: <Widget>[
        Container(
          width: w,
          height: 20.0,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blueGrey),
          ),
          child: Text(str, textScaleFactor: 0.5, softWrap: false),
        )
      ],
    );
  }
  Widget rowText2(BuildContext context) {
    return Row(
      children: <Widget>[
        columnText2(context, '9'),
        columnText2(context, ''),
        columnText2(context, ''),
        columnText2(context, '10'),
        columnText2(context, ''),
        columnText2(context, ''),
        columnText2(context, 'CCCCC'),
        columnText2(context, ''),
        columnText2(context, ''),
        columnText2(context, 'DDDDD'),
        columnText2(context, ''),
        columnText2(context, ''),
        columnText2(context, 'EEEEE'),
        columnText2(context, ''),
        columnText2(context, ''),
      ],
    );
  }

  Widget columnText3(BuildContext context, String str) {
    double w = MediaQuery.of(context).size.width / 50.0;
    return Column(
      children: <Widget>[
        Container(
          width: w,
          height: 20.0,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blueGrey),
          ),
          child: FittedBox(
            fit: BoxFit.fitWidth,
            child: Text(str),
          ),
        )
      ],
    );
  }
  Widget rowText3(BuildContext context) {
    return Row(
      children: <Widget>[
        columnText3(context, '9'),
        columnText3(context, ''),
        columnText3(context, ''),
        columnText3(context, '10'),
        columnText3(context, ''),
        columnText3(context, ''),
        columnText3(context, 'CCCCC'),
        columnText3(context, ''),
        columnText3(context, ''),
        columnText3(context, 'DDDDD'),
        columnText3(context, ''),
        columnText3(context, ''),
        columnText3(context, 'EEEEE'),
        columnText3(context, ''),
        columnText3(context, ''),
      ],
    );
  }

  Widget columnText4(BuildContext context, String str) {
    double w = MediaQuery.of(context).size.width / 50.0;
    return Column(
      children: <Widget>[
        Container(
          width: w,
          height: 20.0,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blueGrey),
          ),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(str),
          ),
        )
      ],
    );
  }
  Widget rowText4(BuildContext context) {
    return Row(
      children: <Widget>[
        columnText4(context, '9'),
        columnText4(context, ''),
        columnText4(context, ''),
        columnText4(context, '10'),
        columnText4(context, ''),
        columnText4(context, ''),
        columnText4(context, 'CCCCC'),
        columnText4(context, ''),
        columnText4(context, ''),
        columnText4(context, 'DDDDD'),
        columnText4(context, ''),
        columnText4(context, ''),
        columnText4(context, 'EEEEE'),
        columnText4(context, ''),
        columnText4(context, ''),
      ],
    );
  }

}
