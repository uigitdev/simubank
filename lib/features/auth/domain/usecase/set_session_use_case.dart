import 'package:simubank/simubank.dart';

/// Store [sessionId] in preferences.
class SetSessionUseCase extends AppUseCase<bool, String> {
  @override
  Future<bool> call(String params) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setString('sessionId', params);
  }
}
