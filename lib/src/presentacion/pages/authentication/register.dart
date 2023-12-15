import 'package:motodomi_app/lib.dart';
import '../../routes/main_routes.dart';
import '../../widgets/button.dart';
import '../../widgets/input.dart';
import '../verification/verification_code.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _controllerPhone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final double width = Dimensions.screenWidth * 0.5;
    final double height = Dimensions.screenHeight * 0.07;
    final double widthInput = Dimensions.screenWidth * 0.85;
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
                    top: -160,
                    left: -60,
                    child: Container(
                      height: Dimensions.screenHeight * 0.5,
                      width: Dimensions.screenWidth * 0.7,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Palette.primaryColor,
                      ),
                    ),
                  ),
                  Positioned(
                      top: Dimensions.screenHeight * 0.03,
                      left: Dimensions.screenWidth * 0.05,
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                Get.offAllNamed(MainRoutes.main);
                              },
                              icon: const Icon(Icons.arrow_back_ios_rounded,
                                  color: Colors.white)),
                          Text(
                            "atrás",
                            style: GoogleFonts.nunito(
                              color: Colors.white,
                              fontSize: Dimensions.screenWidth * 0.05,
                              letterSpacing: 1,
                              fontWeight: FontWeight.w700,
                            ),
                          )
                        ],
                      )),
                  Positioned(
                      top: Dimensions.screenHeight * 0.1,
                      left: Dimensions.screenWidth * 0.08,
                      child: Text(
                        "Registrar",
                        style: GoogleFonts.nunito(
                          color: Colors.white,
                          fontSize: Dimensions.screenWidth * 0.08,
                          letterSpacing: 1,
                          fontWeight: FontWeight.w700,
                        ),
                      )),
                  Positioned(
                    top: Dimensions.screenHeight * 0.25,
                    left: -155,
                    child: Container(
                      height: Dimensions.screenHeight * 0.85,
                      width: Dimensions.screenWidth * 1.8,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Palette.secondaryColor,
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: Dimensions.screenHeight * 0.05,
                            left: Dimensions.screenWidth * 0.47),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: Dimensions.screenHeight * 0.05,
                            ),
                            Text(
                              "Telefono",
                              style: GoogleFonts.nunito(
                                color: Colors.white,
                                fontSize: Dimensions.screenWidth * 0.045,
                                letterSpacing: 1,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            InputClassic(
                              hintText: "escribe aqui",
                              controller: _controllerPhone,
                              isPassword: false,
                              isNumericKeyboard: true,
                              isDateInput: false,
                              width: widthInput,
                            ),
                            SizedBox(
                              height: Dimensions.screenHeight * 0.04,
                            ),
                            Text(
                              "Nombre",
                              style: GoogleFonts.nunito(
                                color: Colors.white,
                                fontSize: Dimensions.screenWidth * 0.045,
                                letterSpacing: 1,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            InputClassic(
                              hintText: "escribe aqui",
                              controller: _controllerPhone,
                              isPassword: false,
                              isNumericKeyboard: true,
                              isDateInput: false,
                              width: widthInput,
                            ),
                            SizedBox(
                              height: Dimensions.screenHeight * 0.01,
                            ),
                            Text(
                              "Apellido",
                              style: GoogleFonts.nunito(
                                color: Colors.white,
                                fontSize: Dimensions.screenWidth * 0.045,
                                letterSpacing: 1,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            InputClassic(
                              hintText: "escribe aqui",
                              controller: _controllerPhone,
                              isPassword: false,
                              isNumericKeyboard: true,
                              isDateInput: false,
                              width: widthInput,
                            ),
                            SizedBox(
                              height: Dimensions.screenHeight * 0.01,
                            ),
                            Text(
                              "Correo",
                              style: GoogleFonts.nunito(
                                color: Colors.white,
                                fontSize: Dimensions.screenWidth * 0.045,
                                letterSpacing: 1,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            InputClassic(
                              hintText: "escribe aqui",
                              controller: _controllerPhone,
                              isPassword: false,
                              isNumericKeyboard: true,
                              isDateInput: false,
                              width: widthInput,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: Dimensions.screenHeight * 0.04,
                                  horizontal: Dimensions.screenWidth * 0.2),
                              child: ButtonClassic(
                                  text: "Ingresar",
                                  onPressed: () {
                                    Get.offAll(
                                      () => const VerificationCode(
                                        timer: Duration(minutes: 1),
                                        codeDigits: 6,
                                      ),
                                    );
                                  },
                                  backgroundColor: Palette.primaryColor,
                                  width: width,
                                  height: height,
                                  textColor: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        )),
      ),
    );
  }
}
