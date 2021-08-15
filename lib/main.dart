import 'package:bytebankapp/database/database.dart';
import 'package:bytebankapp/models/contatos.dart';
import 'package:bytebankapp/screens/dashboard/dashboard.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
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
