import 'dart:convert';

import 'package:bytebankapp/models/contatos.dart';
import 'package:bytebankapp/models/transaction.dart';
import 'package:bytebankapp/web-api/Interceptor.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http/http.dart';

Client client = InterceptedClient.build(interceptors: [LoggerInterceptor()]);
var url = Uri.parse('http://192.168.100.45:8080/transactions');

Future<List<Transaction>> findAll() async {
  // Verificação do timeout da rede IMPORTANTE
  final Response response = await client.get(url).timeout(
        Duration(seconds: 3),
      );

  final List<dynamic> decodeJson = jsonDecode(response.body);
  final List<Transaction> transactions = [];

  for (Map<String, dynamic> transactionJson in decodeJson) {
    final Map<String, dynamic> contactJson = transactionJson['contact'];
    final Transaction transaction = Transaction(
      transactionJson['value'],
      Contato(
        0,
        contactJson['name'],
        contactJson['accountNumber'],
      ),
    );
    transactions.add(transaction);
  }
  return transactions;
}

Future<Transaction> save(Transaction transaction) async {
  final Map<String, dynamic> transactionMap = {
    'value': transaction.value,
    'contact': {
      'name': transaction.contact.nome,
      'accountNumber': transaction.contact.numeroDaConta
    }
  };
  final String transactionJson = jsonEncode(transactionMap);
  final Response response = await client.post(url,
      headers: {
        'Content-type': 'application/json',
        'password': '2000',
      },
      body: transactionJson);

  Map<String, dynamic> json = jsonDecode(response.body);
  final Map<String, dynamic> contactJson = json['contact'];
  return Transaction(
    json['value'],
    Contato(
      0,
      contactJson['name'],
      contactJson['accountNumber'],
    ),
  );
}

void findAllOld() async {
  final Response response = await get(Uri.http(
    '192.168.100.40:8080',
    'transactions',
  ));
  // final Response response = await get(Uri.http(
  //   '192.168.100.45:8080',
  //   'transactions',
  // ));

  debugPrint(response.body);
}
