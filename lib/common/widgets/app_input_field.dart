import 'package:simubank/simubank.dart';

class AppInputField extends StatefulWidget {
  final FocusNode? focusNode;
  final TextEditingController controller;
  final String hint;
  final TextInputType inputType;
  final TextInputAction action;
  final TextCapitalization capitalization;
  final EdgeInsets? scrollPadding;
  final String? iconAsset;
  final String? showPasswordIconAsset;
  final bool isAutofocus;
  final bool isAutocorrect;
  final bool isSuggestion;
  final bool isReadOnly;
  final bool isEnabled;
  final int minLines;
  final int maxLines;
  final int? maxLength;
  final Function(String)? onSubmitted;
  final VoidCallback? onEditingComplete;

  const AppInputField({
    required super.key,
    this.focusNode,
    required this.controller,
    required this.hint,
    required this.inputType,
    required this.action,
    required this.capitalization,
    this.scrollPadding,
    this.iconAsset,
    this.showPasswordIconAsset,
    required this.isAutofocus,
    this.isAutocorrect = false,
    this.isSuggestion = false,
    this.isReadOnly = false,
    required this.isEnabled,
    this.minLines = 1,
    this.maxLines = 1,
    this.maxLength,
    this.onEditingComplete,
    this.onSubmitted,
  });

  @override
  State<AppInputField> createState() => _AppInputFieldState();
}

class _AppInputFieldState extends State<AppInputField> {
  late bool _isSecure;

  @override
  void initState() {
    _isSecure = widget.inputType == TextInputType.visiblePassword;
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Container(
    decoration: BoxDecoration(
      color: Theme.of(context).inputDecorationTheme.fillColor,
      borderRadius: BorderRadius.circular(AppSizes(context).inputRadius),
      border: _border,
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: SizedBox(
            height: AppSizes(context).inputHeight,
            child: ClipRRect(
              child: TextField(
                textAlignVertical: TextAlignVertical.center,
                clipBehavior: Clip.none,
                controller: widget.controller,
                textInputAction: widget.action,
                enabled: widget.isEnabled,
                focusNode: widget.focusNode,
                autocorrect: widget.isAutocorrect,
                enableSuggestions: widget.isSuggestion,
                minLines: widget.minLines,
                maxLines: widget.maxLines,
                maxLength: widget.maxLength,
                autofocus: widget.isAutofocus,
                readOnly: widget.isReadOnly,
                obscuringCharacter: '•',
                textCapitalization: widget.capitalization,
                obscureText: _isSecure,
                onEditingComplete: _onEditingComplete,
                onSubmitted: widget.onSubmitted,
                cursorColor: Theme.of(context).primaryColor,
                style: Theme.of(context).textTheme.displayMedium,
                decoration: _decoration(),
                scrollPadding: _scrollPadding,
                keyboardType: widget.inputType,
                inputFormatters: _inputFormatters(),
              ),
            ),
          ),
        ),
        Visibility(
          visible: widget.iconAsset != null,
          replacement: const SizedBox(),
          child: Semantics(
            label: AppStrings.showPassword,
            child: IconButton(
              onPressed: _passwordIconFunction,
              icon: SvgPicture.asset(
                _iconAsset(),
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

  InputDecoration _decoration() {
    return InputDecoration(
      isDense: true,
      contentPadding: EdgeInsets.symmetric(
        horizontal: AppSizes(context).inputDecorationHorizontal,
        // Calculate vertical center position of text.
        vertical: (AppSizes(context).inputHeight / 2) - (AppSizes(context).titleMedium / 1.5),
      ),
      focusedBorder: InputBorder.none,
      enabledBorder: InputBorder.none,
      disabledBorder: InputBorder.none,
      counterText: '',
      hintStyle: Theme.of(context).textTheme.labelMedium,
      hintText: widget.hint,
    );
  }

  /// Show icon asset
  ///
  /// Handle password icon asset with [_isSecure] params if [inputType] is password
  /// otherwise show [iconAsset] if provided.
  String _iconAsset() {
    if (widget.inputType == TextInputType.visiblePassword && widget.showPasswordIconAsset != null) {
      return _isSecure
          ? '${widget.iconAsset}'
          : '${widget.showPasswordIconAsset}';
    }
    return '${widget.iconAsset}';
  }

  EdgeInsets get _scrollPadding => widget.scrollPadding ?? EdgeInsets.zero;

  VoidCallback get _onEditingComplete =>
      widget.onEditingComplete ?? () => FocusScope.of(context).nextFocus();

  Border get _border => Border.all(
    width: Theme.of(context).inputDecorationTheme.border?.borderSide.width ?? 1,
    color: Theme.of(context).inputDecorationTheme.border?.borderSide.color ?? Colors.transparent,
  );

  /// Handle password icon button function.
  ///
  /// Disable clicks and tap effects if [inputType] is not [password] otherwise
  /// handle [_isSecure] show password function.
  VoidCallback? get _passwordIconFunction =>
      widget.inputType == TextInputType.visiblePassword
          ? () => setState(() => _isSecure = !_isSecure)
          : null;

  List<TextInputFormatter>? _inputFormatters() {
    if(widget.inputType == TextInputType.emailAddress){
      return [_EmailInputFormatter(),];
    }
    return null;
  }
}

/// Email input formatter
///
/// Replaces all spaces with blank characters and converts
/// the input text to lowercase characters.
class _EmailInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.replaceAll(' ', '').toLowerCase(),
      selection: newValue.selection,
    );
  }
}
