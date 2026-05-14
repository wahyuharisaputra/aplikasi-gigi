import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  static const String _favoritesKey = 'favorite_categories';
  static const String _progressKey = 'category_progress';
  static const String _lastOpenedKey = 'last_opened_category';

  Future<SharedPreferences> get _prefs async => await SharedPreferences.getInstance();

  // Favorite methods
  Future<List<String>> getFavoriteCategories() async {
    final prefs = await _prefs;
    return prefs.getStringList(_favoritesKey) ?? [];
  }

  Future<void> toggleFavorite(String categoryId) async {
    final prefs = await _prefs;
    final favorites = prefs.getStringList(_favoritesKey) ?? [];
    
    if (favorites.contains(categoryId)) {
      favorites.remove(categoryId);
    } else {
      favorites.add(categoryId);
    }
    
    await prefs.setStringList(_favoritesKey, favorites);
  }

  Future<bool> isFavorite(String categoryId) async {
    final favorites = await getFavoriteCategories();
    return favorites.contains(categoryId);
  }

  // Progress methods
  Future<double> getReadingProgress(String categoryId) async {
    final prefs = await _prefs;
    return prefs.getDouble('${_progressKey}_$categoryId') ?? 0.0;
  }

  Future<void> saveReadingProgress(String categoryId, double progress) async {
    final prefs = await _prefs;
    await prefs.setDouble('${_progressKey}_$categoryId', progress);
  }

  // Last opened methods
  Future<void> saveLastOpened(String categoryId) async {
    final prefs = await _prefs;
    await prefs.setString(_lastOpenedKey, categoryId);
  }

  Future<String?> getLastOpened() async {
    final prefs = await _prefs;
    return prefs.getString(_lastOpenedKey);
  }
}
