import 'package:simubank/simubank.dart';

class HomeTransactionFilterBox extends StatefulWidget {
  final TextEditingController controller;
  final Function(String searchedText) onSearch;

  const HomeTransactionFilterBox({
    super.key,
    required this.controller,
    required this.onSearch,
  });

  @override
  State<HomeTransactionFilterBox> createState() =>
      _HomeTransactionFilterBoxState();
}

class _HomeTransactionFilterBoxState extends State<HomeTransactionFilterBox> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(right: AppSizes(context).paddingHorizontal),
          child: SvgPicture.asset(
            AppIcons.filter,
            color: Theme.of(context).primaryColor,
            width: AppSizes(context).filterIconSize,
            height: AppSizes(context).filterIconSize,
          ),
        ),
        Expanded(
          child: Semantics(
            label: AppStrings.transactionSearch,
            child: AppInputField(
              key: Key(AppStrings.transactionSearch),
              controller: widget.controller,
              hint: AppStrings.transactionSearch,
              inputType: TextInputType.text,
              action: TextInputAction.next,
              capitalization: TextCapitalization.sentences,
              isAutofocus: true,
              isEnabled: true,
              inputHeight: AppSizes(context).filterInputHeight,
              iconAsset: AppIcons.search,
              onChanged: widget.onSearch,
              onSubmitted: widget.onSearch,
            ),
          ),
        ),
      ],
    );
  }
}
