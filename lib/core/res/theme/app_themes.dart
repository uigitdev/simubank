import 'package:simubank/simubank.dart';

class AppThemes {
  final BuildContext context;

  AppThemes(this.context);

  ThemeData get light => ThemeData.light().copyWith(
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      color: Colors.grey[200],
      surfaceTintColor: Colors.grey[200],
      elevation: 2,
      shadowColor: Colors.black.withValues(alpha: 0.5),
    ),
    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        iconColor: WidgetStateProperty.all<Color>(Colors.black),
        overlayColor: WidgetStateProperty.all<Color>(
          Colors.grey.withValues(alpha: 0.2),
        ),
      ),
    ),
  );

  ThemeData get dark => ThemeData.dark().copyWith(
    primaryColor: Colors.black,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: AppBarTheme(
      color: Colors.grey[900],
      surfaceTintColor: Colors.grey[900],
      elevation: 2,
      shadowColor: Colors.grey.withValues(alpha: 0.2),
    ),
    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        iconColor: WidgetStateProperty.all<Color>(Colors.grey),
        overlayColor: WidgetStateProperty.all<Color>(
          Colors.grey.withValues(alpha: 0.2),
        ),
      ),
    ),
  );
}
