class RevenuesExceptions implements Exception {
  final String message;
  final StackTrace? stackTrace;

  RevenuesExceptions(this.message, [this.stackTrace]);
}

class RevenuesGetException extends RevenuesExceptions {
  RevenuesGetException() : super('Erro na busca das receitas!');
}
