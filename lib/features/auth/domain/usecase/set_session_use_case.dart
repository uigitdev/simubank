import 'package:simubank/simubank.dart';

/// Store [sessionId] in preferences.
class SetSessionUseCase extends AppUseCase<bool, String> {
  @override
  Future<bool> call(String sessionId) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.setString('sessionId', sessionId);
    } catch (_) {
      return false;
    }
  }
}
