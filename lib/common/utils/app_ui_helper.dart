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
}
