import 'package:simubank/simubank.dart';

mixin AppUIHelper {
  void showErrorSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: Theme.of(
            context,
          ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.normal),
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
