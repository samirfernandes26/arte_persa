final class RestClient extends DioForNative {
  RestClient() : super() {
    interceptors.addAll([ConnectionInterceptor(), AuthInterceptor()]);

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
