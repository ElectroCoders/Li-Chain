import 'package:flutter/material.dart';
import 'package:trial_police/screens/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trial Check',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          canvasColor: Colors.transparent,
          accentColor: Colors.green),
      home: HomePage(),
    );
  }
}
