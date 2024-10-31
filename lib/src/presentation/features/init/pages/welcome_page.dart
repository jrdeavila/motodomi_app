import 'package:motodomi_app/lib.dart';

class WelcomePage extends GetView<InitCtrl> {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              color: Theme.of(context).colorScheme.background,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: WelcomeRoundedBall(
              color: Theme.of(context).colorScheme.surface,
              height: 400,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: WelcomeRoundedBall(
              color: Theme.of(context).colorScheme.secondary,
              height: 350,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: WelcomeRoundedBall(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: _buildButtons(),
          ),
          Align(
            alignment: const FractionalOffset(0.5, 0.2),
            child: Image.asset(
              "assets/logo/logo.png",
              width: 300,
              height: 300,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButtons() {
    return SizedBox(
      height: 220,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 300,
            child: ElevatedButton(
              onPressed: controller.loginWithGoogle,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(FontAwesomeIcons.google),
                  SizedBox(width: 10),
                  Text("Iniciar con Google"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
