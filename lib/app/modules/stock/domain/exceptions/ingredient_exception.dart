class IngredientException implements Exception {
  final String message;
  final StackTrace? stackTrace;

  IngredientException(this.message, [this.stackTrace]);
}

class IngredientErrorCreateException extends IngredientException {
  IngredientErrorCreateException() : super('Erro ao criar novo ingrediente!');
}

class IngredientErrorDeleteException extends IngredientException {
  IngredientErrorDeleteException() : super('Erro ao deletar novo ingrediente!');
}

class IngredientErrorEditException extends IngredientException {
  IngredientErrorEditException() : super('Erro ao editar novo ingrediente!');
}



