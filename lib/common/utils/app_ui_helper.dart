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

  void showCustomBottomSheet({required BuildContext context, required Widget child}) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => Container(
        decoration: BoxDecoration(
          color: Theme.of(context).bottomSheetTheme.backgroundColor,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(AppSizes(context).bottomSheetRadius),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.viewInsetsOf(context).bottom
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: EdgeInsets.all(
                    AppSizes(context).paddingVertical
                  ),
                  child: IconButton(
                    icon: Icon(
                      AppIcons.close,
                      color: Theme.of(context).primaryColor,
                    ),
                    onPressed: () {
                      if(context.mounted) {
                        Navigator.of(context).pop();
                      }
                    },
                  ),
                ),
              ),
              Flexible(
                child: Padding(
                  padding: EdgeInsets.only(
                    bottom: AppSizes(context).paddingPageBottom,
                  ),
                  child: child,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextStyle amountTextStyle(BuildContext context, double amount) {
    return TextStyle(
      color: amount > 0
          ? Theme.of(context).colorScheme.tertiary
          : Theme.of(context).colorScheme.error,
      fontSize: Theme.of(context,).listTileTheme.leadingAndTrailingTextStyle?.fontSize,
      fontWeight: Theme.of(context,).listTileTheme.leadingAndTrailingTextStyle?.fontWeight,
    );
  }
}
