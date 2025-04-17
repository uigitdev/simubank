import 'package:simubank/simubank.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocators();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: serviceLocator<AppProviders>().mainProviders(),
      child: App(),
    );
  }
}