import 'package:motodomi_app/lib.dart';

import '../utils/dimensions.dart';

class ButtonClassic extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final double width;
  final double height;
  final Color textColor;
  final FontWeight fontWeight;

  const ButtonClassic({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.backgroundColor,
    required this.width,
    required this.height,
    required this.textColor,
    this.fontWeight = FontWeight.w600,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        minimumSize: Size(width, height),
      ),
      child: Text(
        text,
        style: GoogleFonts.nunito(
          color: textColor,
          fontSize: Dimensions.screenWidth * 0.05,
          letterSpacing: 1.6,
          fontWeight: fontWeight,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class ButtonBorderClassic extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color borderColor;
  final Color backgroundColor;
  final double width;
  final double height;
  final Color textColor;
  final FontWeight fontWeight;

  const ButtonBorderClassic({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.borderColor,
    required this.width,
    required this.height,
    required this.textColor,
    this.fontWeight = FontWeight.w600,
    required this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          side: BorderSide(color: borderColor, width: 4),
        ),
        minimumSize: Size(width, height),
      ),
      child: Text(
        text,
        style: GoogleFonts.nunito(
          color: textColor,
          fontSize: Dimensions.screenWidth * 0.05,
          letterSpacing: 1.6,
          fontWeight: fontWeight,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
