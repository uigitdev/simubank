import 'package:simubank/simubank.dart';

enum UIKitInputFieldType { TEXT, EMAIL, PASSWORD, PHONE, NUMBER, DECIMAL, NAME }

class UIKitInputFieldCapacity {
  final int minLines;
  final int maxLines;
  final int maxLength;

  const UIKitInputFieldCapacity({
    this.minLines = 1,
    this.maxLines = 1,
    this.maxLength = 255,
  });
}

class UIKitInputFieldAppearance {
  final Color cursorColor;
  final TextStyle textStyle;
  final InputDecoration decoration;

  const UIKitInputFieldAppearance({
    required this.cursorColor,
    required this.textStyle,
    required this.decoration,
  });
}

class UIKitInputField extends StatefulWidget {
  final UIKitInputFieldType _inputFieldType;
  final TextEditingController _controller;
  final TextInputAction _action;
  final bool _isEnabled;
  final bool _isAutocorrect;
  final bool _isSuggestion;
  final bool _isAutofocus;
  final bool _isReadOnly;
  final bool _isSecure;
  final UIKitInputFieldCapacity _capacity;
  final UIKitInputFieldAppearance _appearance;
  final TextCapitalization _capitalization;
  final String _passwordCharacter;
  final Function(String)? _submittedFunction;
  final FocusNode? _focusNode;
  final EdgeInsets? _scrollPadding;
  final VoidCallback? _onEditingComplete;

  const UIKitInputField({
    super.key,
    required UIKitInputFieldType inputFieldType,
    required TextEditingController controller,
    required TextInputAction action,
    VoidCallback? onEditingComplete,
    bool isEnabled = true,
    bool isAutocorrect = false,
    bool isSuggestion = false,
    bool isAutofocus = false,
    bool isReadOnly = false,
    bool isSecure = false,
    String passwordHideCharacter = '*',
    EdgeInsets? scrollPadding,
    UIKitInputFieldCapacity capacity = const UIKitInputFieldCapacity(
      minLines: 1,
      maxLines: 1,
      maxLength: 255,
    ),
    UIKitInputFieldAppearance appearance = const UIKitInputFieldAppearance(
      cursorColor: Colors.blue,
      textStyle: TextStyle(),
      decoration: InputDecoration(),
    ),
    TextCapitalization capitalization = TextCapitalization.none,
    FocusNode? focusNode,
    Function(String)? submittedFunction,
  }) : _inputFieldType = inputFieldType,
       _controller = controller,
       _action = action,
       _isEnabled = isEnabled,
       _isAutocorrect = isAutocorrect,
       _isReadOnly = isReadOnly,
       _passwordCharacter = passwordHideCharacter,
       _isSuggestion = isSuggestion,
       _isAutofocus = isAutofocus,
       _isSecure = isSecure,
       _capacity = capacity,
       _appearance = appearance,
       _capitalization = capitalization,
       _focusNode = focusNode,
       _submittedFunction = submittedFunction,
       _onEditingComplete = onEditingComplete,
       _scrollPadding = scrollPadding;

  @override
  State<UIKitInputField> createState() => _UIKitInputFieldState();
}

class _UIKitInputFieldState extends State<UIKitInputField> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: TextField(
        textAlignVertical: TextAlignVertical.center,
        clipBehavior: Clip.none,
        controller: widget._controller,
        textInputAction: widget._action,
        enabled: widget._isEnabled,
        focusNode: widget._focusNode,
        autocorrect: widget._isAutocorrect,
        enableSuggestions: widget._isSuggestion,
        minLines: widget._capacity.minLines,
        maxLines: widget._capacity.maxLines,
        maxLength: widget._capacity.maxLength,
        autofocus: widget._isAutofocus,
        readOnly: widget._isReadOnly,
        obscuringCharacter: widget._passwordCharacter,
        textCapitalization: widget._capitalization,
        obscureText: _obscureText(),
        onEditingComplete: widget._onEditingComplete ?? () => FocusScope.of(context).nextFocus(),
        onSubmitted: widget._submittedFunction,
        cursorColor: widget._appearance.cursorColor,
        style: widget._appearance.textStyle,
        decoration: widget._appearance.decoration,
        scrollPadding: widget._scrollPadding ?? const EdgeInsets.all(20),
        keyboardType: UIKitInputFieldTypeConvert.getInputTypeFromType(
          widget._inputFieldType,
          widget._action == TextInputAction.newline,
        ),
        inputFormatters: _inputFormatters(),
      ),
    );
  }

  bool _obscureText() {
    if (widget._inputFieldType == UIKitInputFieldType.PASSWORD) return true;
    return widget._isSecure;
  }

  List<TextInputFormatter>? _inputFormatters() {
    switch (widget._inputFieldType) {
      case UIKitInputFieldType.NUMBER:
        return [
          FilteringTextInputFormatter.allow(
            UIKitInputFieldTypeConvert.getRegExFromType(
              widget._inputFieldType,
            )!,
          ),
        ];
      case UIKitInputFieldType.PHONE:
        return [
          FilteringTextInputFormatter.allow(
            UIKitInputFieldTypeConvert.getRegExFromType(
              widget._inputFieldType,
            )!,
          ),
        ];
      case UIKitInputFieldType.DECIMAL:
        return [
          FilteringTextInputFormatter.allow(
            UIKitInputFieldTypeConvert.getRegExFromType(
              widget._inputFieldType,
            )!,
          ),
          TextInputFormatter.withFunction((oldValue, value) {
            try {
              if (value.text.isNotEmpty) {
                double.parse(value.text.replaceAll(',', '.'));
              }
              return value.copyWith(text: value.text.replaceAll(',', '.'));
            } catch (_) {}
            return oldValue.copyWith(text: oldValue.text.replaceAll(',', '.'));
          }),
        ];
      case UIKitInputFieldType.NAME:
        return [
          FilteringTextInputFormatter.deny(
            UIKitInputFieldTypeConvert.getRegExFromType(
              widget._inputFieldType,
            )!,
          ),
          UIKitInputFieldNameFormatter(),
        ];
      case UIKitInputFieldType.EMAIL:
        return [
          FilteringTextInputFormatter.deny(
            UIKitInputFieldTypeConvert.getRegExFromType(
              widget._inputFieldType,
            )!,
          ),
          UIKitInputFieldLowercaseFormatter(),
        ];
      case UIKitInputFieldType.TEXT:
        return null;
      case UIKitInputFieldType.PASSWORD:
        return null;
    }
  }
}
