import 'package:intl/intl.dart';
import 'package:motodomi_app/lib.dart';

class InputClassic extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool isPassword;
  final bool isNumericKeyboard;
  final bool isDateInput;
  final List<TextInputFormatter> formatters;
  final String? error;
  final double width;

  const InputClassic({
    Key? key,
    required this.hintText,
    required this.controller,
    required this.isPassword,
    required this.isNumericKeyboard,
    required this.isDateInput,
    this.error,
    this.formatters = const [],
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextInputType keyboardType = TextInputType.text;

    if (isNumericKeyboard) {
      keyboardType = TextInputType.number;
    }

    return Container(
      margin: EdgeInsets.symmetric(vertical: Dimensions.screenHeight * 0.01),
      width: width,
      child: TextField(
        onTap: () {
          if (isDateInput) {
            _selectDate(context);
          }
        },
        obscureText: isPassword,
        cursorColor: Palette.textInputColor,
        inputFormatters: formatters,
        style: GoogleFonts.montserrat(
          color: Colors.white,
        ),
        autofocus: false,
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(left: 30),
          filled: true,
          fillColor: Palette.mediumsecondaryColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: BorderSide.none,
          ),
          focusColor: Palette.textInputColor,
          hintText: hintText,
          hintStyle: GoogleFonts.montserrat(
              fontSize: Dimensions.screenWidth * 0.04,
              color: Palette.textInputColor),
          errorText: error,
          errorStyle: GoogleFonts.montserrat(
            fontSize: Dimensions.screenWidth * 0.03,
            color: Colors.red,
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );

    // ignore: unrelated_type_equality_checks
    if (pickedDate != null && pickedDate != controller.text) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      controller.text = formattedDate;
    }
  }
}
