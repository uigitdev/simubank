import 'package:intl/intl.dart';
import 'package:simubank/simubank.dart';

mixin AppUIHelper {
  void showErrorSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: TextStyle(
            color: Theme.of(context).textTheme.titleMedium?.color,
            fontWeight: FontWeight.normal,
            fontSize: AppSizes(context).titleMedium,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.error,
        action: SnackBarAction(
          label: AppStrings.snackBarOk,
          textColor: Theme.of(context).textTheme.titleMedium?.color,
          onPressed: () {
            if (context.mounted) {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
            }
          },
        ),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  String toListDateTime(DateTime date) {
    return DateFormat('yyyy-MM-dd').format(date);
  }

  String toListPrice(double amount, String currency) {
    final formatter = NumberFormat.currency(
      locale: AppStrings.locale.languageCode,
      symbol: currency,
      decimalDigits: amount % 1 == 0 ? 0 : 2,
    );
    return formatter.format(amount);
  }
}
