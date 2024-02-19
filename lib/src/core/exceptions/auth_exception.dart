/// Class AuthException
///
/// Exception lançada quando há um problema na autenticação do usuário
sealed class AuthException implements Exception {
  final String message;
  AuthException({required this.message});
}

/// Class AuError
/// Expecption lançada quando existe algum erro durante o processo de autenticação
class AuthError extends AuthException {
  AuthError({required super.message});
}

/// Class AuthUnauthorizedException
/// Expecption lançada quando o usuário não possui autorização de acesso
class AuthUnauthorizedException extends AuthException {
  AuthUnauthorizedException() : super(message: '');
}
