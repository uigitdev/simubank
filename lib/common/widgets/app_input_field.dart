import 'package:simubank/simubank.dart';

class AppInputField extends StatefulWidget {
  final TextEditingController controller;
  final String hint;
  final TextInputAction action;
  final UIKitInputFieldType inputFieldType;
  final UIKitInputFieldCapacity capacity;
  final bool isAutofocus;
  final TextCapitalization capitalization;
  final bool isEnabled;
  final String? iconAsset;
  final String? showPasswordIconAsset;
  final Function(String)? onSubmitted;
  final FocusNode? focusNode;
  final VoidCallback? onEditingComplete;

  const AppInputField({
    required super.key,
    required this.controller,
    required this.hint,
    required this.action,
    required this.inputFieldType,
    this.capacity = const UIKitInputFieldCapacity(),
    required this.capitalization,
    required this.isAutofocus,
    required this.isEnabled,
    this.iconAsset,
    this.showPasswordIconAsset,
    this.onEditingComplete,
    this.onSubmitted,
    this.focusNode,
  });

  @override
  State<AppInputField> createState() => _AppInputFieldState();
}

class _AppInputFieldState extends State<AppInputField> {
  late UIKitInputFieldType inputFieldType;

  @override
  void initState() {
    inputFieldType = widget.inputFieldType;
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Container(
    decoration: BoxDecoration(
      color: Theme.of(context).inputDecorationTheme.fillColor,
      borderRadius: BorderRadius.circular(AppSizes(context).inputRadius),
      border: Border.all(
        width:
            Theme.of(context).inputDecorationTheme.border?.borderSide.width ??
            1,
        color:
            Theme.of(context).inputDecorationTheme.border?.borderSide.color ??
            Colors.transparent,
      ),
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: SizedBox(
            height: AppSizes(context).inputHeight,
            child: UIKitInputField(
              focusNode: widget.focusNode,
              inputFieldType: inputFieldType,
              controller: widget.controller,
              action: widget.action,
              isEnabled: widget.isEnabled,
              isAutofocus: widget.isAutofocus,
              capitalization: widget.capitalization,
              capacity: widget.capacity,
              onEditingComplete: widget.onEditingComplete,
              passwordHideCharacter: '•',
              submittedFunction: widget.onSubmitted,
              appearance: UIKitInputFieldAppearance(
                cursorColor: Theme.of(context).primaryColor,
                textStyle:
                    Theme.of(context).textTheme.displayMedium ?? TextStyle(),
                decoration: _decoration(context, widget.hint),
              ),
            ),
          ),
        ),
        Visibility(
          visible: widget.iconAsset != null,
          replacement: const SizedBox(),
          child: InkWell(
            onTap:
                widget.inputFieldType == UIKitInputFieldType.PASSWORD
                    ? () => setState(() {
                      if (inputFieldType == UIKitInputFieldType.PASSWORD) {
                        inputFieldType = UIKitInputFieldType.TEXT;
                      } else {
                        inputFieldType = UIKitInputFieldType.PASSWORD;
                      }
                    })
                    : null,
            child: Padding(
              padding: EdgeInsets.only(
                left: AppSizes(context).inputDecorationInternalIconLeft,
                right: AppSizes(context).inputDecorationInternalIconRight,
              ),
              child: SvgPicture.asset(
                widget.inputFieldType == UIKitInputFieldType.PASSWORD &&
                        widget.showPasswordIconAsset != null
                    ? inputFieldType == UIKitInputFieldType.PASSWORD
                        ? '${widget.iconAsset}'
                        : widget.showPasswordIconAsset!
                    : '${widget.iconAsset}',
                width: AppSizes(context).inputIconSize,
                height: AppSizes(context).inputIconSize,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        ),
      ],
    ),
  );

  InputDecoration _decoration(BuildContext context, String hint) =>
      InputDecoration(
        isDense: true,
        contentPadding: EdgeInsets.symmetric(
          horizontal: AppSizes(context).inputDecorationHorizontal,
          vertical:
              (AppSizes(context).inputHeight / 2) -
              (AppSizes(context).titleMedium / 1.5),
        ),
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        counterText: '',
        hintStyle: Theme.of(context).textTheme.labelMedium,
        hintText: hint,
      );
}
