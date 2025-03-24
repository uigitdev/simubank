import 'package:simubank/simubank.dart';

class AppThemes {
  final BuildContext context;

  AppThemes(this.context);

  ThemeData get light => ThemeData.light().copyWith(
    primaryColor: Color(0xFF2563EB),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      color: Colors.white,
      surfaceTintColor: Colors.white,
      elevation: 0,
      titleTextStyle: TextStyle(
        color: Color(0xFF2563EB),
        fontSize: AppSizes(context).appBarTitle,
        fontWeight: FontWeight.bold,
      ),
      actionsIconTheme: IconThemeData(color: Color(0xFF2563EB)),
    ),
    textTheme: TextTheme(
      labelMedium: TextStyle(
        color: const Color(0xFF95989B),
        fontSize: AppSizes(context).label,
      ),
      displayMedium: TextStyle(
        fontSize: AppSizes(context).titleMedium,
        color: Color(0xFF2563EB),
      ),
      titleMedium: TextStyle(
        fontSize: AppSizes(context).titleMedium,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      bodyMedium: TextStyle(
        fontSize: AppSizes(context).titleMedium,
        color: Color(0xFF95989B),
      ),
      headlineLarge: TextStyle(
        fontSize: AppSizes(context).titleLarge,
        fontWeight: FontWeight.w600,
        color: Color(0xFF2D2A2A),
      ),
      bodyLarge: TextStyle(
        fontSize: AppSizes(context).titleLarge,
        fontWeight: FontWeight.bold,
        color: Color(0xFF2563EB),
      ),
      labelLarge: TextStyle(
        color: Colors.black,
        fontSize: AppSizes(context).titleLarge2,
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
    inputDecorationTheme: InputDecorationTheme(
      fillColor: Color(0xFFF3F4F6),
      border: OutlineInputBorder(
        borderSide: BorderSide(
          width: AppSizes(context).inputBorderWeight,
          color: Color(0xFF7088A8),
        ),
      ),
    ),
    dividerColor: Colors.grey[600],
    snackBarTheme: SnackBarThemeData(elevation: 0),
    colorScheme: ColorScheme.of(
      context,
    ).copyWith(error: Color(0xFFDC2626), tertiary: Colors.green),
    listTileTheme: ListTileThemeData(
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: AppSizes(context).titleMedium,
        fontWeight: FontWeight.normal,
      ),
      subtitleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: AppSizes(context).titleNormal,
      ),
      leadingAndTrailingTextStyle: TextStyle(
        fontSize: AppSizes(context).titleNormal,
        fontWeight: FontWeight.bold,
      ),
    ),
    bottomSheetTheme: BottomSheetThemeData(backgroundColor: Colors.white),
  );

  ThemeData get dark => ThemeData.dark().copyWith(
    primaryColor: Color(0xFF2563EB),
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: AppBarTheme(
      color: Colors.black,
      surfaceTintColor: Colors.black,
      elevation: 0,
      titleTextStyle: TextStyle(
        color: Color(0xFF2563EB),
        fontSize: AppSizes(context).appBarTitle,
        fontWeight: FontWeight.bold,
      ),
      actionsIconTheme: IconThemeData(color: Color(0xFF2563EB)),
    ),
    textTheme: TextTheme(
      labelMedium: TextStyle(
        color: const Color(0xFF95989B),
        fontSize: AppSizes(context).label,
      ),
      titleMedium: TextStyle(
        fontSize: AppSizes(context).titleMedium,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      displayMedium: TextStyle(
        fontSize: AppSizes(context).titleMedium,
        color: Color(0xFF2563EB),
      ),
      bodyMedium: TextStyle(
        fontSize: AppSizes(context).titleMedium,
        color: Color(0xFF95989B),
      ),
      headlineLarge: TextStyle(
        fontSize: AppSizes(context).titleLarge,
        fontWeight: FontWeight.w600,
        color: Colors.grey[400],
      ),
      bodyLarge: TextStyle(
        fontSize: AppSizes(context).titleLarge,
        fontWeight: FontWeight.bold,
        color: Color(0xFF2563EB),
      ),
      labelLarge: TextStyle(
        color: Colors.white,
        fontSize: AppSizes(context).titleLarge2,
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
    inputDecorationTheme: InputDecorationTheme(
      fillColor: Color(0xFF151515),
      border: OutlineInputBorder(
        borderSide: BorderSide(
          width: AppSizes(context).inputBorderWeight,
          color: Color(0xFF7088A8),
        ),
      ),
    ),
    dividerColor: Colors.grey[600],
    snackBarTheme: SnackBarThemeData(elevation: 0),
    colorScheme: ColorScheme.of(
      context,
    ).copyWith(error: Color(0xFFDC2626), tertiary: Colors.green),
    listTileTheme: ListTileThemeData(
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: AppSizes(context).titleMedium,
        fontWeight: FontWeight.normal,
      ),
      subtitleTextStyle: TextStyle(
        color: Colors.grey[600],
        fontSize: AppSizes(context).titleNormal,
      ),
      leadingAndTrailingTextStyle: TextStyle(
        fontSize: AppSizes(context).titleNormal,
        fontWeight: FontWeight.bold,
      ),
    ),
    bottomSheetTheme: BottomSheetThemeData(backgroundColor: Color(0xFF171717)),
  );
}
