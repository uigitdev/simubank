import 'package:simubank/simubank.dart';

abstract class UIKitInputFieldTypeConvert {
  static RegExp? getRegExFromType(UIKitInputFieldType inputFieldType) {
    switch (inputFieldType) {
      case UIKitInputFieldType.NUMBER:
        return RegExp(r"[0-9]");
      case UIKitInputFieldType.PHONE:
        return RegExp(r"[0-9]");
      case UIKitInputFieldType.NAME:
        return RegExp(r"[0-9.,+]");
      case UIKitInputFieldType.DECIMAL:
        return RegExp(r"[0-9.,]");
      case UIKitInputFieldType.PASSWORD:
        return null;
      case UIKitInputFieldType.EMAIL:
        return RegExp(r"[ \n\t\r\f]");
      case UIKitInputFieldType.TEXT:
        return null;
    }
  }

  static TextInputType getInputTypeFromType(UIKitInputFieldType inputFieldType, bool isMultiline) {
    switch (inputFieldType) {
      case UIKitInputFieldType.TEXT:
        return isMultiline ? TextInputType.multiline : TextInputType.text;
      case UIKitInputFieldType.EMAIL:
        return TextInputType.emailAddress;
      case UIKitInputFieldType.PASSWORD:
        return TextInputType.visiblePassword;
      case UIKitInputFieldType.PHONE:
        return TextInputType.number;
      case UIKitInputFieldType.NUMBER:
        return TextInputType.number;
      case UIKitInputFieldType.DECIMAL:
        return const TextInputType.numberWithOptions(
          decimal: true,
          signed: true,
        );
      case UIKitInputFieldType.NAME:
        return TextInputType.name;
    }
  }
}

class UIKitInputFieldLowercaseFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toLowerCase(),
      selection: newValue.selection,
    );
  }
}

class UIKitInputFieldNameFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.isNotEmpty ? '${newValue.text[0].toUpperCase()}${newValue.text.toLowerCase().substring(1)}' : '',
      selection: newValue.selection,
    );
  }
}
