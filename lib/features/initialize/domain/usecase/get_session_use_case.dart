import 'package:simubank/simubank.dart';

/// Get stored [sessionId] from preferences.
class GetSessionUseCase extends AppUseCase<String?, void> {
  @override
  Future<String?> call({Object? params}) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('sessionId');
  }
}
