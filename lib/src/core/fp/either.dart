// Definição da classe Either, que representa um resultado que pode ser um Failure ou Success.
sealed class Either<E extends Exception, S> {
  get left => E;
  get right => S;
}

// Definição da classe Failure, que herda de Either e representa um resultado de falha.
class Failure<E extends Exception, S> extends Either<E, S> {
  final E exception;

  @override
  get left => exception;

  // Construtor que recebe a exceção que causou a falha.
  Failure(this.exception);
}

// Definição da classe Success, que herda de Either e representa um resultado bem-sucedido.
class Success<E extends Exception, S> extends Either<E, S> {
  final S value;

  // Construtor que recebe o valor bem-sucedido.
  Success(this.value);

  @override
  get right => value;
}
