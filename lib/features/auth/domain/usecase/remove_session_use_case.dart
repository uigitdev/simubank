import 'package:simubank/simubank.dart';

/// Remove [sessionId] from preferences.
class RemoveSessionUseCase extends AppUseCase<bool, NoData> {
  @override
  Future<bool> call(NoData _) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.remove('sessionId');
    } catch (_) {
      return false;
    }
  }
}
