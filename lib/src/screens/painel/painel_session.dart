import 'package:shared_preferences/shared_preferences.dart';

class PainelSession {
  static const _loggedInKey = 'session.logged_in';
  static const _usernameKey = 'session.username';

  static Future<String> loadUsername() async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getString(_usernameKey) ?? 'Visitante';
  }

  static Future<void> clearSession() async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.remove(_loggedInKey);
    await preferences.remove(_usernameKey);
  }

  static String formatDisplayName(String rawUsername) {
    final trimmed = rawUsername.trim();
    if (trimmed.isEmpty) {
      return 'Visitante';
    }

    final normalized = trimmed.contains('@')
        ? trimmed.split('@').first
        : trimmed.replaceAll(RegExp(r'\s+'), ' ');

    final words = normalized
        .split(RegExp(r'[._\-\s]+'))
        .where((word) => word.isNotEmpty)
        .toList();

    if (words.isEmpty) {
      return 'Visitante';
    }

    return words
        .map(
          (word) =>
              '${word[0].toUpperCase()}${word.substring(1).toLowerCase()}',
        )
        .join(' ');
  }

  static String initials(String rawUsername) {
    final displayName = formatDisplayName(rawUsername);
    final words = displayName.split(' ').where((word) => word.isNotEmpty);
    final letters = words.take(2).map((word) => word[0]).join();

    if (letters.isNotEmpty) {
      return letters.toUpperCase();
    }

    return 'AP';
  }
}
