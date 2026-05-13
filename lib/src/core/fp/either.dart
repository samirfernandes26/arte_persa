// Definição da classe Either, que representa um resultado que pode ser um Failure ou Success.
sealed class Either<Left extends Exception, Right> {
  dynamic get left => Left;
  dynamic get right => Right;

  void isRight() {}
}

// Definição da classe Failure, que herda de Either e representa um resultado de falha.
class Failure<Left extends Exception, Right> extends Either<Left, Right> {
  final Left exception;

  @override
  Left get left => exception;

  // Construtor que recebe a exceção que causou a falha.
  Failure(this.exception);
}

// Definição da classe Success, que herda de Either e representa um resultado bem-sucedido.
class Success<Left extends Exception, Right> extends Either<Left, Right> {
  final Right value;

  // Construtor que recebe o valor bem-sucedido.
  Success(this.value);

  @override
  Right get right => value;
}
