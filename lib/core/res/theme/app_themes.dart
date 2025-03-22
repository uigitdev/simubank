import 'package:simubank/simubank.dart';

class AppThemes {
  final BuildContext context;

  AppThemes(this.context);

  ThemeData get light => ThemeData.light().copyWith(
    primaryColor: Color(0xFF2563EB),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      color: Colors.grey[200],
      surfaceTintColor: Colors.grey[200],
      elevation: 2,
      shadowColor: Colors.black.withValues(alpha: 0.5),
    ),
    textTheme: TextTheme(
      labelMedium: TextStyle(
        color: const Color(0xFF95989B),
        fontSize: AppSizes(context).label,
      ),
      titleMedium: TextStyle(
        fontSize: AppSizes(context).buttonTitle,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
    disabledColor: Color(0xFFD1D5DB),
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
    primaryColor: Color(0xFF2563EB),
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: AppBarTheme(
      color: Colors.grey[900],
      surfaceTintColor: Colors.grey[900],
      elevation: 2,
      shadowColor: Colors.grey.withValues(alpha: 0.2),
    ),
    textTheme: TextTheme(
      labelMedium: TextStyle(
        color: const Color(0xFF95989B),
        fontSize: AppSizes(context).label,
      ),
      titleMedium: TextStyle(
        fontSize: AppSizes(context).buttonTitle,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    ),
    disabledColor: Color(0xFF727477),
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
