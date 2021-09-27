import 'dart:io' show Platform;
import 'package:flutter/material.dart';

// ignore_for_file: public_member_api_docs

class MyApp2 extends StatefulWidget {
  const MyApp2({Key? key}) : super(key: key);

  @override
  State<MyApp2> createState() => _MyApp2State();
}

class _MyApp2State extends State<MyApp2> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text('Platform: ${Platform.operatingSystem}\n'),
        ),
      ),
    );
  }
}
