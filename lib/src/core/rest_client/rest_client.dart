import 'package:arte_persa/src/core/rest_client/interceptors/connection_interceptor.dart';
import 'package:dio/io.dart';

final class RestClient extends DioForNative {
  RestClient() : super() {
    interceptors.addAll(
      [
        ConnectionInterceptor(),
      ],
    );

    options.copyWith(
      receiveTimeout: const Duration(seconds: 60),
      sendTimeout: const Duration(seconds: 60),
    );
  }

  RestClient get auth {
    options.extra['DIO_AUTH_KEY'] = true;
    return this;
  }

  RestClient get unAuth {
    options.extra['DIO_AUTH_KEY'] = false;
    return this;
  }
}
