import 'package:simubank/simubank.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.system) {
    _loadTheme();
  }

  /// Load theme from preferences.
  ///
  /// Get stored theme mode and load.
  Future<void> _loadTheme() async {
    final storedTheme = await _getStoredThemeMode();
    emit(storedTheme);
  }

  /// Set theme by [ThemeMode]
  ///
  /// Replace current theme mode and store the [ThemeMode]
  /// in preferences.
  void setTheme(ThemeMode themeMode) {
    _storeThemeMode(themeMode);
    emit(themeMode);
  }

  Future<ThemeMode> _getStoredThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    final themeIndex = prefs.getInt('theme_mode') ?? 0;
    return ThemeMode.values[themeIndex];
  }

  void _storeThemeMode(ThemeMode themeMode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('theme_mode', themeMode.index);
  }
}
