import 'package:motodomi_app/lib.dart';

class DomiciliaryRequestApprovedPage extends GetView<DomiciliaryModeCtrl> {
  const DomiciliaryRequestApprovedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            Positioned.fill(
              child: WelcomeRoundedBall(
                color: Theme.of(context).colorScheme.tertiary,
              ),
            ),
            Positioned.fill(
              top: MediaQuery.of(context).size.height * 0.1,
              child: WelcomeRoundedBall(
                color: Theme.of(context).colorScheme.background,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: kToolbarHeight,
                  ),
                  Image.asset(
                    "assets/img/process-successful.png",
                    width: 300,
                    height: 200,
                  ),
                  Text(
                    "Genial! Ya eres Motodomi",
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                          color: Theme.of(context).colorScheme.onSecondary,
                        ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "Ahora puedes empezar a recibir pedidos y ganar dinero",
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: Theme.of(context).colorScheme.onSecondary,
                        ),
                    textAlign: TextAlign.center,
                  ),
                  const Spacer(),
                  Obx(() {
                    return SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: controller.finishRequest,
                        child: controller.loading
                            ? SizedBox(
                                height: 25,
                                child: LoadingIndicator(
                                  color:
                                      Theme.of(context).colorScheme.background,
                                ),
                              )
                            : const Text("Continuar"),
                      ),
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DomiciliaryRequestRejectedPage extends GetView<DomiciliaryModeCtrl> {
  const DomiciliaryRequestRejectedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            Positioned.fill(
              child: WelcomeRoundedBall(
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            Positioned.fill(
              top: MediaQuery.of(context).size.height * 0.1,
              child: WelcomeRoundedBall(
                color: Theme.of(context).colorScheme.background,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Image.asset(
                    "assets/img/something-went-grown.png",
                    width: 300,
                    height: 300,
                  ),
                  Text(
                    "Revisamos tu solicitud",
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                          color: Theme.of(context).colorScheme.onSecondary,
                        ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "Hay algunos detalles que debes revisar, corrigelos y envianos la información",
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: Theme.of(context).colorScheme.onSecondary,
                        ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: controller.goBackToEdit,
                      child: const Text("Regresar a Modificar"),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  TextButton(
                    onPressed: controller.viewTermsAndConditions,
                    child: Text(
                      "Ver terminos y condiciones del Motodomi",
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: Theme.of(context)
                                .colorScheme
                                .onSurface
                                .withOpacity(0.5),
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DomiciliaryRequestSendedPage extends GetView<DomiciliaryModeCtrl> {
  const DomiciliaryRequestSendedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            Positioned.fill(
              child: WelcomeRoundedBall(
                color: Theme.of(context).colorScheme.tertiary,
              ),
            ),
            Positioned.fill(
              top: MediaQuery.of(context).size.height * 0.1,
              child: WelcomeRoundedBall(
                color: Theme.of(context).colorScheme.background,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Image.asset(
                    "assets/img/domiciliary_5.png",
                    width: 300,
                    height: 300,
                  ),
                  Text(
                    "Estamos revisando tu solicitud!",
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                          color: Theme.of(context).colorScheme.onSecondary,
                        ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "Por favor ten un poco de paciencia, en un plazo de 6 horas estaremos dandote respuesta",
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: Theme.of(context).colorScheme.onSecondary,
                        ),
                    textAlign: TextAlign.center,
                  ),
                  TextButton(
                    onPressed: controller.viewTermsAndConditions,
                    child: Text(
                      "Ver terminos y condiciones del Motodomi",
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: Theme.of(context)
                                .colorScheme
                                .onSurface
                                .withOpacity(0.5),
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DomiciliaryRequestCompletePage extends GetView<DomiciliaryModeCtrl> {
  const DomiciliaryRequestCompletePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            Positioned.fill(
              child: WelcomeRoundedBall(
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            Positioned.fill(
              top: MediaQuery.of(context).size.height * 0.1,
              child: WelcomeRoundedBall(
                color: Theme.of(context).colorScheme.background,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Image.asset(
                    "assets/img/domiciliary_4.png",
                    width: 300,
                    height: 300,
                  ),
                  Text(
                    "Estas a un paso de ser MotoDomi",
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                          color: Theme.of(context).colorScheme.onSecondary,
                        ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "Has completado las secciones de la solicitud. Ahora envianos la información para que verifiquemos que todo este en orden",
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: Theme.of(context).colorScheme.onSecondary,
                        ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Obx(() {
                    return SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: controller.sendRequest,
                        child: controller.loading
                            ? SizedBox(
                                height: 25,
                                child: LoadingIndicator(
                                  color:
                                      Theme.of(context).colorScheme.background,
                                ),
                              )
                            : const Text("Enviar Solicitud"),
                      ),
                    );
                  }),
                  const SizedBox(
                    height: 10.0,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: controller.goBackToEdit,
                      child: const Text("Regresar a Modificar"),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  TextButton(
                    onPressed: controller.viewTermsAndConditions,
                    child: Text(
                      "Ver terminos y condiciones del Motodomi",
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: Theme.of(context)
                                .colorScheme
                                .onSurface
                                .withOpacity(0.5),
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
