import 'package:geolocator/geolocator.dart';

enum GeolocationStatus {
  initial,
  loaded,
  success,
  error;
}

class GeolocationState {
  GeolocationStatus status;
  String? message;
  Position? position;

  GeolocationState({
    required this.status,
    this.message,
    required this.position,
  });

  GeolocationState.initial()
      : status = GeolocationStatus.initial,
        message = null,
        position = null;

  GeolocationState copyWith({
    GeolocationStatus? status,
    String? message,
    Position? position,
  }) =>
      GeolocationState(
        position: position ?? this.position,
        status: status ?? this.status,
        message: message ?? this.message,
      );
}
