import 'dart:convert';

import 'package:bytebankapp/models/transaction.dart';
import 'package:bytebankapp/web-api/webclient.dart';
import 'package:http/http.dart';

class TransactionWebClient {
  Future<List<Transaction>> findAll() async {
    // Verificação do timeout da rede IMPORTANTE
    final Response response = await client.get(url).timeout(
          Duration(seconds: 3),
        );

    final List<dynamic> decodeJson = jsonDecode(response.body);
    return decodeJson.map((dynamic json) {
      return Transaction.fromJson(json);
    }).toList();
  }

  Future<Transaction> save(Transaction transaction, String password) async {
    final String transactionJson = jsonEncode(transaction.toJson());
    final Response response = await client.post(url,
        headers: {
          'Content-type': 'application/json',
          'password': password,
        },
        body: transactionJson);

    return Transaction.fromJson(jsonDecode(response.body));
  }
}
