import 'package:simubank/simubank.dart';

class HomeTransactionList extends StatelessWidget {
  final ScrollController controller;

  final List<TransactionEntity> transactions;

  const HomeTransactionList(
    this.transactions, {
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      controller: controller,
      itemCount: transactions.length,
      shrinkWrap: true,
      separatorBuilder: (context, position) {
        return Container(
          width: double.maxFinite,
          height: 0.5,
          color: Theme.of(context).disabledColor,
        );
      },
      itemBuilder: (context, position) {
        return HomeTransactionListItem(transactions[position]);
      },
    );
  }
}
