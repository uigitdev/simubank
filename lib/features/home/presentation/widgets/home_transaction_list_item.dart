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
      contentPadding: EdgeInsets.symmetric(
        vertical: AppSizes(context).paddingSmallVertical
      ),
      title: Text(
        toListDateTime(transaction.date)
      ),
      subtitle: Text(transaction.merchant),
      trailing: Text(
        toListPrice(transaction.amount.toDouble(), transaction.currency),
        textAlign: TextAlign.end,
        style: amountTextStyle(context, transaction.amount.toDouble()),
      ),
      onTap: () {
        showCustomBottomSheet(
          context: context,
          child: HomeTransactionDetails(transaction)
        );
      },
    );
  }
}
