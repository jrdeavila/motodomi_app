import 'package:motodomi_app/lib.dart';
import 'package:motodomi_app/src/presentacion/widgets/button.dart';

import '../routes/authentication_routes.dart';
import '../utils/colors.dart';
import '../utils/dimensions.dart';

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = Dimensions.screenWidth * 0.5;
    final double height = Dimensions.screenHeight * 0.07;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(top: Dimensions.height10),
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                height: Dimensions.screenHeight * 0.35,
                width: Dimensions.screenWidth * 1,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/logo/logo.png'),
                        fit: BoxFit.contain))),
            SizedBox(
              height: Dimensions.screenHeight * 0.65,
              child: Stack(
                children: [
                  Positioned(
                    top: Dimensions.screenHeight * 0.09,
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
                    top: Dimensions.screenHeight * 0.2,
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
                    top: Dimensions.screenHeight * 0.3,
                    left: -95,
                    child: Container(
                      height: Dimensions.screenHeight * 0.7,
                      width: Dimensions.screenWidth * 1.5,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Palette.secondaryColor,
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: Dimensions.screenHeight * 0.05),
                        child: Column(
                          children: [
                            ButtonClassic(
                                text: "Ingresar",
                                onPressed: () {},
                                backgroundColor: Palette.primaryColor,
                                width: width,
                                height: height,
                                textColor: Colors.white,
                                fontWeight: FontWeight.w500),
                            SizedBox(
                              height: Dimensions.screenHeight * 0.02,
                            ),
                            ButtonBorderClassic(
                                text: "Registrar",
                                onPressed: () {
                                  Get.offAllNamed(
                                      AuthenticationRoutes.register);
                                },
                                borderColor: Palette.primaryColor,
                                backgroundColor: Palette.secondaryColor,
                                width: width,
                                height: height,
                                textColor: Palette.primaryColor,
                                fontWeight: FontWeight.w500),
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
