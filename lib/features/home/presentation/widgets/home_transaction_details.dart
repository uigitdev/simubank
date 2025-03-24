import 'package:simubank/simubank.dart';

class HomeTransactionDetails extends StatelessWidget with AppUIHelper {
  final TransactionEntity transaction;

  const HomeTransactionDetails(this.transaction, {super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes(context).paddingHorizontal,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Transaction details
          Text(
            AppStrings.transactionDetails,
            style: Theme.of(context).appBarTheme.titleTextStyle,
            textAlign: TextAlign.center,
          ),
          // Description
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: AppSizes(context).paddingVertical,
            ),
            child: ListDetailsItem(
              title: transaction.description,
              value: toListPrice(
                transaction.amount.toDouble(),
                transaction.currency,
              ),
              valueTextStyle: amountTextStyle(
                context,
                transaction.amount.toDouble(),
              ),
            ),
          ),
          // Date
          ListDetailsItem(
            title: AppStrings.transactionDetailsDate,
            value: toListDateTime(transaction.date),
          ),
          // Merchant
          ListDetailsItem(
            title: AppStrings.transactionDetailsMerchant,
            value: transaction.merchant,
          ),
          // Category
          ListDetailsItem(
            title: AppStrings.transactionDetailsCategory,
            value: transaction.category,
          ),
          // To Account
          ListDetailsItem(
            title: AppStrings.transactionDetailsToAccount,
            value: transaction.toAccount,
          ),
        ],
      ),
    );
  }
}
