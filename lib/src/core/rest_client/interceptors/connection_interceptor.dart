import 'package:dio/dio.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

/// Interceptor personalizado para verificar a conexão à internet antes de fazer uma requisição Dio.
class ConnectionInterceptor extends Interceptor {
  final _internetConnectionChecker = InternetConnectionChecker();

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // Instância de verificador de conexão à internet.

    // Obter o status da conexão à internet.
    final internetStatus = await _internetConnectionChecker.connectionStatus;

    switch (internetStatus) {
      case InternetConnectionStatus.connected:
        // Se estiver conectado à internet, prosseguir com a requisição.
        handler.next(options);
        break;
      case InternetConnectionStatus.disconnected:
        // Se não estiver conectado à internet, rejeitar a requisição com um erro de conexão.
        _handleDisconnectedRequest(handler, options);
        break;
    }
  }

  void _handleDisconnectedRequest(
      RequestInterceptorHandler handler, RequestOptions options) {
    handler.reject(
      DioException.connectionError(
        reason: 'Not connected',
        requestOptions: options,
      ),
    );
  }
}
