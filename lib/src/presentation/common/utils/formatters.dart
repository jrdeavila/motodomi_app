import 'package:flutter/services.dart';

class CarPlateFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final value = newValue.text.replaceAll(" ", "");
    if (newValue.text.length < oldValue.text.length) {
      return newValue;
    }
    if (newValue.text.length < 6) {
      return TextEditingValue(
        text: value.toUpperCase(),
        selection: newValue.selection,
      );
    } else {
      return TextEditingValue(
          text: "${value.substring(0, 3)} ${value.substring(3)}",
          selection: TextSelection.collapsed(
            offset: oldValue.selection.end + 1,
          ));
    }
  }

  static String unformat(String text) {
    return text.replaceAll(" ", "");
  }

  static String format(String text) {
    final filteredNewText = text.replaceAll(" ", "");
    if (filteredNewText.isNotEmpty) {
      final formatedValue =
          "${filteredNewText.substring(0, 3)} ${filteredNewText.substring(3)}";
      return formatedValue;
    }
    return text;
  }
}

class LicenseInputFormatter extends MaskInputFormatter {
  LicenseInputFormatter() : super(mask: "xxxx xxxx xxxx", separator: " ");

  String unformat(String text) {
    return text.replaceAll(separator, "");
  }

  String format(String text) {
    final filteredNewText = text.replaceAll(separator, "");
    if (filteredNewText.isNotEmpty) {
      final formatedValue = _formattedText(filteredNewText);
      return formatedValue;
    } else {
      return text;
    }
  }

  String _formattedText(String filteredNewText) {
    String formatedValue = "";
    for (int i = filteredNewText.length; i > 0; i--) {
      if ((filteredNewText.length - i) % 4 == 0 &&
          filteredNewText.length != i) {
        formatedValue = "${filteredNewText[i - 1]}$separator$formatedValue";
      } else {
        formatedValue = "${filteredNewText[i - 1]}$formatedValue";
      }
    }
    return formatedValue;
  }
}

class PhoneCodeInputFormatter extends MaskInputFormatter {
  PhoneCodeInputFormatter() : super(mask: "+xxx", separator: "+");
}

class PhoneInputFormatter extends MaskInputFormatter {
  PhoneInputFormatter() : super(mask: "xxx xxx xxxx", separator: " ");
}

class MaskInputFormatter extends TextInputFormatter {
  final String mask;
  final String separator;

  MaskInputFormatter({required this.mask, required this.separator});

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isNotEmpty) {
      if (newValue.text.length > oldValue.text.length) {
        if (newValue.text.length > mask.length) return oldValue;
        if (newValue.text.length < mask.length &&
            mask[newValue.text.length - 1] == separator) {
          return TextEditingValue(
            text:
                '${oldValue.text}$separator${newValue.text.substring(newValue.text.length - 1)}',
            selection: TextSelection.collapsed(
              offset: newValue.selection.end + 1,
            ),
          );
        }
      }
    }
    return newValue;
  }
}

class DNIInputFormatter extends TextInputFormatter {
  final int segment;
  final String separator;

  DNIInputFormatter({this.segment = 3, this.separator = " "});

  String format(String text) {
    final filteredNewText = text.replaceAll(separator, "");
    if (filteredNewText.isNotEmpty) {
      final formatedValue = _formattedText(filteredNewText);
      return formatedValue;
    }
    return text;
  }

  String unformat(String text) {
    return text.replaceAll(separator, "");
  }

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final filteredNewText = newValue.text.replaceAll(separator, "");
    if (filteredNewText.isNotEmpty) {
      final formatedValue = _formattedText(filteredNewText);
      return TextEditingValue(
        text: formatedValue,
      );
    }
    return newValue;
  }

  String _formattedText(String filteredNewText) {
    String formatedValue = "";
    for (int i = filteredNewText.length; i > 0; i--) {
      if ((filteredNewText.length - i) % segment == 0 &&
          filteredNewText.length != i) {
        formatedValue = "${filteredNewText[i - 1]}$separator$formatedValue";
      } else {
        formatedValue = "${filteredNewText[i - 1]}$formatedValue";
      }
    }
    return formatedValue;
  }
}
