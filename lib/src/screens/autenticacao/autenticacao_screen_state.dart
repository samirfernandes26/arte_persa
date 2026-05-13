enum AutenticacaoScreenStatus {
  initial,
  loading,
  error,
  success;
}

class AutenticacaoScreenState {
  const AutenticacaoScreenState({
    required this.status,
    required this.showPassword,
    this.message,
  });

  const AutenticacaoScreenState.initial()
      : this(
          status: AutenticacaoScreenStatus.initial,
          showPassword: false,
        );

  final AutenticacaoScreenStatus status;
  final String? message;
  final bool showPassword;

  AutenticacaoScreenState copyWith({
    AutenticacaoScreenStatus? status,
    String? message,
    bool? showPassword,
  }) {
    return AutenticacaoScreenState(
      status: status ?? this.status,
      message: message,
      showPassword: showPassword ?? this.showPassword,
    );
  }
}
