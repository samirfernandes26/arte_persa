enum Turno {
  manha,
  tarde,
  noite;

  String get description => switch (this) {
        Turno.manha => 'Manhã',
        Turno.tarde => 'Tarde',
        Turno.noite => 'Noite',
      };

  Turno getTurno(String turno) => switch (turno) {
        'Manhã' => Turno.manha,
        'Tarde' => Turno.tarde,
        'Noite' => Turno.noite,
        _ => throw Exception('Turno inválido'),
      };
}
