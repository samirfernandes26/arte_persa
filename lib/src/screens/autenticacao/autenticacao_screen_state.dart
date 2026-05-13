enum AutenticacaoScreenStatus {
  intial,
  loaded,
  error,
  success;
}

class AutenticacaoScreenState {
  AutenticacaoScreenStatus status;

  String? message;

  bool showPassword;

  AutenticacaoScreenState.initial()
      : this(
          status: AutenticacaoScreenStatus.intial,
          message: null,
          showPassword: false,
        );

  AutenticacaoScreenState({
    required this.status,
    required this.showPassword,
    this.message,
  });

  AutenticacaoScreenState copyWith({
    AutenticacaoScreenStatus? status,
    String? message,
    bool? showPassword,
  }) {
    return AutenticacaoScreenState(
      status: status ?? this.status,
      message: message ?? this.message,
      showPassword: showPassword ?? this.showPassword,
    );
  }
}
