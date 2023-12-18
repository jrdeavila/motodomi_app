import 'package:motodomi_app/lib.dart';

class ResetPasswordPage extends GetView<ResetPasswordCtrl> {
  const ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: WelcomeRoundedBall(
                  color: Theme.of(context).colorScheme.surface,
                  height: 450,
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: WelcomeRoundedBall(
                  color: Theme.of(context).colorScheme.secondary,
                  height: 400,
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: WelcomeRoundedBall(
                  color: Theme.of(context).colorScheme.primary,
                  height: 350,
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: _buildForm(),
              ),
              const Align(
                alignment: Alignment.topLeft,
                child: BackOvalSection(
                  width: 300,
                  height: 220,
                  backLabel: "Iniciar sesión",
                  labelTitle: "Contraseña olvidada",
                  labelDesc: "Ingresa tu correo electrónico para continuar",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildForm() {
    return SizedBox(
      height: 230,
      width: 350,
      child: Obx(() {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              initialValue: controller.email,
              keyboardType: TextInputType.emailAddress,
              onChanged: controller.setEmail,
              decoration: const InputDecoration(
                hintText: "Correo electrónico",
                prefixIcon: Icon(FontAwesomeIcons.envelope),
              ),
            ),
            const SizedBox(height: 20),
            FadeInUpBig(
              animate: controller.isReady,
              child: ElevatedButton(
                onPressed: controller.resetPassword,
                child: SizedBox(
                  width: double.infinity,
                  child: controller.loading
                      ? const Center(
                          child: SizedBox(
                            height: 22,
                            child: LoadingIndicator(
                              color: Colors.white,
                            ),
                          ),
                        )
                      : const Text(
                          "Iniciar Sesión",
                          textAlign: TextAlign.center,
                        ),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
