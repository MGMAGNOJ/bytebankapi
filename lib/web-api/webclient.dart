import 'package:bytebankapp/web-api/Interceptor.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http/http.dart';

Future<void> findAll() async {
  Client client = InterceptedClient.build(interceptors: [LoggerInterceptor()]);

  var url = Uri.parse('http://192.168.100.45:8080/transactions');
  final Response response = await client.get(url);
  print(response.body);
}

void findAllOld() async {
  final Response response = await get(Uri.http(
    '192.168.100.45:8080',
    'transactions',
  ));

  debugPrint(response.body);
}
