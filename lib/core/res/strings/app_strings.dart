import 'package:simubank/simubank.dart';

class AppStrings{
  AppStrings._();

  static Locale get locale => Locale('hu');

  static List<Locale> get supportedLocale => [
    Locale('en'),
    Locale('hu'),
  ];

  static Iterable<LocalizationsDelegate> get delegates => const [
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];

  static final String appName = 'SimuBank';
  static final String appNameLabel = 'Digital Banking';
  static final String pageNotFound = 'This page is not found';

  static final String versionTitle = '© {year} {name} - Ver. {version}';

  static final String authLogin = 'Login';
  static final String authRegistration = 'Registration';
  static final String authNoAccount = 'No account yet? Create now!';
  static final String authEmailHint = 'Email';
  static final String authPasswordHint = 'Password';
  static final String showPassword = 'Show password';

  static final String authErrorUnauthorizedAccess = 'Unauthorized Access.';
  static final String authErrorInvalidSessionId = 'Invalid session ID.';
  static final String authErrorMissingFields = 'Missing required fields.';
  static final String authErrorLoginFailed = 'Incorrect username or password.';
  static final String authErrorSomethingWentWrong = 'Something went wrong during authentication.';
  static final String authErrorSomethingWentWrongLogout = 'Something went wrong during logout.';

  static final String profileNotFound = 'User profile not found.';
  static final String profileHello = 'Hello';

  static final String transactionSearch = 'Search transaction';
  static final String transactionsEmpty = 'No found transactions';

  static final String snackBarOk = 'OK';
  static final String snackBarNoInternet = 'No Internet Connection';

  static final String transactions = 'Transactions';
  static final String transactionDetails = 'Transaction details';

  static final String transactionDetailsDate = 'Date';
  static final String transactionDetailsMerchant = 'Merchant';
  static final String transactionDetailsCategory = 'Category';
  static final String transactionDetailsToAccount = 'To Account';

  static final String logout = 'Logout';
}