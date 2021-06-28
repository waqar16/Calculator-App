import 'package:flutter/material.dart';
// import 'package:hello/calc_app.dart';

import 'calc_app.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: ThemeData.light(),
      home: Calculator(),
    );
  }
}
