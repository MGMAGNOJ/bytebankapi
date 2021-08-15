class Contato {
  final int id;
  final String nome;
  final int numeroDaConta;

  Contato(this.id, this.nome, this.numeroDaConta);
  @override
  String toString() {
    return 'Nome: {valor: $nome, conta: $numeroDaConta}';
  }
}
