import 'package:simubank/simubank.dart';

class HomeTransactionList extends StatelessWidget {
  final List<TransactionEntity> transactions;

  const HomeTransactionList(this.transactions, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
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
