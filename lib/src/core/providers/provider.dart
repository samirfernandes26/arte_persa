@Riverpod(keepAlive: true)
RestClient restClient(Ref ref) => RestClient();

@Riverpod(keepAlive: true)
Database database(Ref ref) => Database();
