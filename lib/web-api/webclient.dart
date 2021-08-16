import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

void findAll() async {
  final Response response = await get(Uri.http(
    '192.168.100.45:8080',
    'transactions',
  ));

  debugPrint(response.body);
}
