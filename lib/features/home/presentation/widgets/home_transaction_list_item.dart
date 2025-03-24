import 'package:simubank/simubank.dart';

class HomeTransactionListItem extends StatelessWidget with AppUIHelper {
  final TransactionEntity transaction;

  const HomeTransactionListItem(this.transaction, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes(context).tileRadius),
      ),
      contentPadding: EdgeInsets.symmetric(vertical: 5),
      title: Text(toListDateTime(transaction.date)),
      subtitle: Text(transaction.merchant),
      trailing: Text(
        toListPrice(transaction.amount.toDouble(), transaction.currency),
        textAlign: TextAlign.end,
        style: TextStyle(
          color: transaction.amount > 0
                  ? Theme.of(context).colorScheme.tertiary
                  : Theme.of(context).colorScheme.error,
          fontSize: Theme.of(context,).listTileTheme.leadingAndTrailingTextStyle?.fontSize,
        ),
      ),
      onTap: () {},
    );
  }
}
