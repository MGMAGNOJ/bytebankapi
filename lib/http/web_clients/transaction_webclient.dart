import 'dart:convert';

import 'package:bytebankapp/models/contatos.dart';
import 'package:bytebankapp/models/transaction.dart';
import 'package:bytebankapp/web-api/webclient.dart';
import 'package:http/http.dart';

class TransactionWebClient {
  Future<List<Transaction>> findAll() async {
    // Verificação do timeout da rede IMPORTANTE
    final Response response = await client.get(url).timeout(
      Duration(seconds: 3),
    );

    List<Transaction> transactions = _toTransactions(response);
    return transactions;
  }

  Future<Transaction> save(Transaction transaction) async {
    Map<String, dynamic> transactionMap = _toMap(transaction);
    final String transactionJson = jsonEncode(transactionMap);
    final Response response = await client.post(url,
        headers: {
          'Content-type': 'application/json',
          'password': '2000',
        },
        body: transactionJson);

    return _toTransaction(response);
  }

  List<Transaction> _toTransactions(Response response) {
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

  Transaction _toTransaction(Response response) {
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

  Map<String, dynamic> _toMap(Transaction transaction) {
    final Map<String, dynamic> transactionMap = {
      'value': transaction.value,
      'contact': {
        'name': transaction.contact.nome,
        'accountNumber': transaction.contact.numeroDaConta
      }
    };
    return transactionMap;
  }

}
