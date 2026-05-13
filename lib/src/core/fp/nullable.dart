class Nullable<T> {
  final T? value;
  const Nullable(this.value);
}

mixin NullableMixin<T> {
  T? handleNullable(Nullable<T>? nullable, T originalValue) =>
      nullable is Nullable ? nullable?.value : originalValue;
}
