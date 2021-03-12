import 'dart:math';

import 'package:dart_dl_example/test.dart';
import 'package:flutter/material.dart';

import 'package:dart_dl/dart_dl.dart';

void main() {
  DartDl.init();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Builder(
            builder: (context) => FlatButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => TestW(),
                  ),
                );
              },
              child: Text('Running on: $_platformVersion\n'),
            ),
          ),
        ),
      ),
    );
  }
}

class TestW extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _StateTest();
}

class _StateTest extends State<TestW> {
  Test test = Test();
  String a = "123";
  String b = "456";
  String c = "789";

  @override
  void initState() {
    testDL();
    super.initState();
  }

  void testDL() async {
    int v = await test.asyncTestInt();
    print(v);
    Random random = Random();
    test.testGC(this);
    test.testGC(this);
    test.testGC(this);
    test.testGC(this);
    //for (int i = 0; i < 1000; i++) {
    //  String a = random.nextDouble().toString();
    //  test.testGC(a);
    //  String b = random.nextDouble().toString();
    //  test.testGC(b);
    //  String c = random.nextDouble().toString();
    //  test.testGC(c);
    //}
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
