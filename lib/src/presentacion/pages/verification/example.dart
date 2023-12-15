import 'package:motodomi_app/lib.dart';

import 'package:pin_code_fields/pin_code_fields.dart';

import '../../routes/main_routes.dart';
import '../../widgets/button.dart';

class VerificationCode extends StatefulWidget {
  const VerificationCode({
    super.key,
  });

  @override
  State<VerificationCode> createState() => _VerificationCodeState();
}

class _VerificationCodeState extends State<VerificationCode> {
  late Timer timer;

  final double width = Dimensions.screenWidth * 0.5;
  final double height = Dimensions.screenHeight * 0.07;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SlideInRight(
      duration: const Duration(milliseconds: 10),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: Dimensions.screenHeight * 1,
              child: Stack(
                children: [
                  Positioned(
                    top: Dimensions.screenHeight * 0.11,
                    left: Dimensions.screenWidth * 0.15,
                    child: Text('Codigo de verificación',
                        style: GoogleFonts.nunito(
                          color: Palette.secondaryColor,
                          fontSize: Dimensions.screenWidth * 0.065,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1,
                        )),
                  ),
                  Positioned(
                    top: Dimensions.screenHeight * 0.18,
                    left: Dimensions.screenWidth * 0.09,
                    child: SizedBox(
                      width: Dimensions.screenWidth * 0.8,
                      child: Text(
                          'Para confirmar tu identidad, te hemos enviado un código vía WhatsApp. Por favor, ingrésalo a continuación.',
                          style: GoogleFonts.nunito(
                            color: Palette.secondaryColor,
                            fontSize: Dimensions.screenWidth * 0.035,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 1,
                          )),
                    ),
                  ),
                  Positioned(
                    top: Dimensions.screenHeight * 0.34,
                    left: -95,
                    child: Container(
                      height: Dimensions.screenHeight * 0.7,
                      width: Dimensions.screenWidth * 1.5,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Palette.lightGrayColor,
                      ),
                    ),
                  ),
                  Positioned(
                    top: Dimensions.screenHeight * 0.43,
                    left: -95,
                    child: Container(
                      height: Dimensions.screenHeight * 0.7,
                      width: Dimensions.screenWidth * 1.5,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Palette.mediumGrayColor,
                      ),
                    ),
                  ),
                  Positioned(
                    top: Dimensions.screenHeight * 0.53,
                    left: -95,
                    child: Container(
                      height: Dimensions.screenHeight * 0.7,
                      width: Dimensions.screenWidth * 1.5,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Palette.secondaryColor,
                      ),
                    ),
                  ),
                  Positioned(
                    top: Dimensions.screenHeight * 0.3,
                    left: Dimensions.screenWidth * 0.09,
                    child: SizedBox(
                      width: Dimensions.screenWidth * 9,
                      child: PinCodeTextField(
                        appContext: context,
                        keyboardType: TextInputType.number,
                        length: 6,
                        onCompleted: (value) {},
                      ),
                    ),
                  ),
                  Positioned(
                    top: Dimensions.screenHeight * 0.45,
                    left: Dimensions.screenWidth * 0.45,
                    child: Text('00:)}',
                        style: GoogleFonts.nunito(
                          color: Palette.secondaryColor,
                          fontSize: Dimensions.screenWidth * 0.05,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1,
                        )),
                  ),
                  Positioned(
                    top: Dimensions.screenHeight * 0.57,
                    left: Dimensions.screenWidth * 0.29,
                    child: TextButton(
                      onPressed: () {},
                      child: Text('Reenviar Código',
                          style: GoogleFonts.nunito(
                            color: Colors.white,
                            fontSize: Dimensions.screenWidth * 0.045,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1,
                          )),
                    ),
                  ),
                  Positioned(
                    top: Dimensions.screenHeight * 0.68,
                    left: Dimensions.screenWidth * 0.25,
                    child: ButtonClassic(
                        text: "Verificar",
                        onPressed: () {
                          Get.offAll(
                            () => const VerificationCode(),
                          );
                        },
                        backgroundColor: Palette.primaryColor,
                        width: width,
                        height: height,
                        textColor: Colors.white,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }
}
