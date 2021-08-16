import 'package:bytebankapp/screens/dashboard/dashboard.dart';
import 'package:bytebankapp/web-api/webclient.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
  findAll();
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ByteBankApp',
      theme: ThemeData(
        primaryColor: Colors.green,
        accentColor: Colors.blueAccent.shade700,
      ),
      home: Dashboard(),
    );
  }
}
