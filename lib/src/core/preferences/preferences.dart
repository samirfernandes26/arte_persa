/// {@category Core}
/// {@category Preferences}
///
/// Classe Preference retorna uma instancia única para armazenas as configurações
/// temporárias da aplicação.
class Preferences {
  /// A instância singleton da classe Preferences.
  static Preferences? _instance;

  /// Creates a new Preferences instance. This constructor is private to enforce the singleton pattern.
  Preferences._();

  /// Obtém a instância singleton da classe Preferences.

  /// Este método cria uma nova instância se ela ainda não existir.
  static Preferences get instance => _instance ??= Preferences._();

  /// A map to store key-value pairs for preferences.
  final Map<String, dynamic> _preferences = {};

  /// Gets a preference value for the given key.

  /// This method attempts to cast the retrieved value to the specified type `T`.
  /// If the key doesn't exist or the cast fails, it returns `null`.
  T? getPreference<T>(String preference) => _preferences[preference] as T?;

  /// Sets a preference value for the given key.

  /// This method stores the provided data under the specified key.
  void setPreference<T>(String preference, T data) =>
      _preferences[preference] = data;

  /// Removes a preference for the given key.

  /// This method removes the key-value pair from the internal map.
  void removePreference(String preference) => _preferences.remove(preference);

  /// Clears all stored preferences.

  /// This method removes all key-value pairs from the internal map.
  void clearAllPreferences() => _preferences.clear();

  /// Gets a list of all preference keys.

  /// This method returns a list containing all the keys currently stored in the preferences map.
  List<String> getPreferences() => _preferences.keys.toList();
}
