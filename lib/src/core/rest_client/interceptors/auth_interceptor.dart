import 'dart:convert';
import 'dart:io';

class AuthInterceptor extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final RequestOptions(:headers, :extra) = options;

    const authHeaderKey = 'Authorization';
    headers.remove(authHeaderKey);

    if (extra case {'DIO_AUTH_KEY': true}) {
      final sp = await SharedPreferences.getInstance();

      final instanciasString = sp.getString(LocalStorageKeys.instanciaInfo);
      final userInfoString = sp.getString(LocalStorageKeys.userInfo);

      if (instanciasString != null && userInfoString != null) {
        dynamic instancias = json.decode(instanciasString);
        dynamic userInfo = json.decode(userInfoString);

        String instanciaUrl = (instancias
            .where((instancia) => instancia['id'] == userInfo['instancia_id'])
            .first)['url'];

        options.baseUrl = instanciaUrl;

        headers.addAll({authHeaderKey: 'Bearer ${userInfo['token']}'});
      }
    }

    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    final DioException(requestOptions: RequestOptions(:extra), :response) = err;

    if (extra case {'DIO_AUTH_KEY': true}) {
      if (response != null &&
          [HttpStatus.forbidden].contains(response.statusCode)) {
        final BuildContext context =
            AppNavigatorKey.instance.navKey.currentContext!;

        await context.navigator.pushNamedAndRemoveUntil(
          RouteGeneratorKeys.authLogin,
          (_) => false,
        );

        return handler.reject(err);
      }
    }

    handler.reject(err);
  }
}
