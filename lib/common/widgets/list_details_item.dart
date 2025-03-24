import 'package:simubank/simubank.dart';

class ListDetailsItem extends StatelessWidget {
  final String title;
  final String value;
  final TextStyle? valueTextStyle;

  const ListDetailsItem({
    super.key,
    required this.title,
    required this.value,
    this.valueTextStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: AppSizes(context).paddingSmallVertical,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).listTileTheme.titleTextStyle,
            ),
          ),
          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.end,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style:
                  valueTextStyle ??
                  Theme.of(context).listTileTheme.leadingAndTrailingTextStyle,
            ),
          ),
        ],
      ),
    );
  }
}
