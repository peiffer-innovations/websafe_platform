import 'package:flutter/material.dart';
import 'package:websafe_platform/websafe_platform.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Websafe Platform Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Websafe Platform Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var websafePlatform = WebsafePlatform();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('isAndroid: ${websafePlatform.isAndroid()}'),
            Text('isIOS: ${websafePlatform.isIOS()}'),
            Text('isWeb: ${websafePlatform.isWeb()}'),
          ],
        ),
      ),
    );
  }
}
