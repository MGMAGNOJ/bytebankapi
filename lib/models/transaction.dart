import 'package:bytebankapp/models/contatos.dart';

class Transaction {
  final double value;
  final Contato contact;

  Transaction(
    this.value,
    this.contact,
  );

  Transaction.fromJson(Map<String, dynamic> json)
      : value = json['value'],
        contact = Contato.fromJson(json['contact']);

  Map<String, dynamic> toJson() => {
    'value': value,
    'contact': contact.toJson(),
  };

  @override
  String toString() {
    return 'Transaction{value: $value, contact: $contact}';
  }
}
