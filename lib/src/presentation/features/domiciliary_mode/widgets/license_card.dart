import 'package:motodomi_app/lib.dart';

class ConfirmationIdentification extends StatelessWidget {
  const ConfirmationIdentification({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      height: 300,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Image.asset(
              "assets/img/formal-person.png",
              width: 200,
              height: 200,
            ),
          ),
          Positioned(
            bottom: 0.0,
            left: 50.0,
            child: Transform.scale(
              alignment: Alignment.bottomLeft,
              scale: 0.5,
              child: const FrontalSideIdentification(),
            ),
          ),
        ],
      ),
    );
  }
}
