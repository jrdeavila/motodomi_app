import 'package:flutter/services.dart';
import 'package:motodomi_app/lib.dart';

class ResumeLicenseBodyView extends GetView<DriverLicenseCtrl> {
  const ResumeLicenseBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Positioned.fill(
          child: ColoredBox(
            color: Colors.white,
          ),
        ),
        Positioned.fill(
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(
              top: kToolbarHeight + 20.0,
              left: 20.0,
              right: 20.0,
              bottom: 20.0,
            ),
            child: DomiciliaryThemeData(
              child: Column(
                children: [
                  Text(
                    "Numero de licencia",
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(0.5),
                        ),
                  ),
                  const SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        controller.licenseNumberFormatted,
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                      ),
                      const SizedBox(width: 10.0),
                      GestureDetector(
                        onTap: controller.editLicenseNumber,
                        child: Icon(
                          FontAwesomeIcons.penToSquare,
                          color: Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(0.5),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 5.0),
                  Text(
                    "Vence el ${controller.licenseExpirationDateFormatted}",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(0.5),
                        ),
                  ),
                  const SizedBox(height: 20.0),
                  Text(
                    "Lado frontal de la licencia",
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(0.5),
                        ),
                  ),
                  const SizedBox(height: 20.0),
                  controller.licenseFrontSide != null
                      ? DNISideResumeCard(
                          image: controller.licenseFrontSide!,
                          onRemoveAction: controller.clearBackImage,
                        )
                      : const BackSideIdentification(),
                  const SizedBox(height: 20.0),
                  Text(
                    "Lado trasero de la licencia",
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(0.5),
                        ),
                  ),
                  const SizedBox(height: 20.0),
                  controller.licenseBackSide != null
                      ? DNISideResumeCard(
                          image: controller.licenseBackSide!,
                          onRemoveAction: controller.clearBackImage,
                        )
                      : const FrontalSideIdentification(),
                  const SizedBox(height: 20.0),
                ],
              ),
            ),
          ),
        ),
        Obx(() {
          return Positioned(
            bottom: 16.0,
            right: 16.0,
            child: controller.loading
                ? FloatingActionButton.extended(
                    onPressed: () {},
                    label: Container(
                      width: 50.0,
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: const LoadingIndicator(
                        color: Colors.white,
                      ),
                    ))
                : FloatingActionButton.extended(
                    heroTag: 'save',
                    onPressed: controller.save,
                    icon: const Icon(FontAwesomeIcons.floppyDisk),
                    label: const Text("Guardar"),
                  ),
          );
        }),
      ],
    );
  }
}

class DriverLicenseResumeCard extends StatelessWidget {
  const DriverLicenseResumeCard({
    super.key,
    required this.image,
    this.onRemoveAction,
  });

  final Uint8List image;
  final VoidCallback? onRemoveAction;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: SizedBox(
        width: 350,
        height: 200,
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.memory(
                image,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 10.0,
              right: 10.0,
              child: GestureDetector(
                onTap: onRemoveAction,
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    FontAwesomeIcons.xmark,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FormLicenseBodyView extends GetView<DriverLicenseCtrl> {
  const FormLicenseBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          top: (MediaQuery.of(context).size.height * 0.1),
          child: WelcomeRoundedBall(
            color: Theme.of(context).colorScheme.tertiary,
          ),
        ),
        Positioned.fill(
          top: (MediaQuery.of(context).size.height * 0.15),
          child: WelcomeRoundedBall(
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
        Positioned.fill(
          top: (MediaQuery.of(context).size.height * 0.2),
          child: const WelcomeRoundedBall(
            color: Colors.white,
          ),
        ),
        Positioned.fill(
          top: (MediaQuery.of(context).size.height * 0.3),
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.1,
              left: 20.0,
              right: 20.0,
              bottom: 20.0,
            ),
            child: DomiciliaryThemeData(
              child: Column(
                children: [
                  Text(
                    "Datos de tu licencia de conducción",
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20.0),
                  Obx(() {
                    return TextFormField(
                      controller: controller.licenseCtrl,
                      decoration: InputDecoration(
                        hintText: "Número de la licencia",
                        errorText: controller.errors["license"],
                      ),
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        // FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(14),
                        controller.licenseNumberFormatter,
                      ],
                    );
                  }),
                  const SizedBox(height: 10.0),
                  Obx(() {
                    return DateTimePicker(
                      date: controller.licenseExpirationDate,
                      firstDate: DateTime.now(),
                      lastDate: DateTime.now().add(const Duration(days: 3650)),
                      label: "Fecha de vencimiento de la licencia",
                      onChangeDate: controller.setLicenseExpirationDate,
                      error: controller.errors["expirationDate"],
                    );
                  }),
                  const SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: controller.validateLicense,
                    child: const Text("Guardar y Continuar"),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: kTextTabBarHeight,
          left: 16.0,
          child: FloatingActionButton(
            heroTag: 'back',
            onPressed: () {
              Get.back();
            },
            child: const Icon(FontAwesomeIcons.arrowLeft),
          ),
        ),
      ],
    );
  }
}

class DriverLicenseConfirmationBodyView extends GetView<DriverLicenseCtrl> {
  const DriverLicenseConfirmationBodyView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          top: (MediaQuery.of(context).size.height * 0.1),
          child: const WelcomeRoundedBall(
            color: Colors.white,
          ),
        ),
        Positioned.fill(
          top: (MediaQuery.of(context).size.height * 0.3),
          child: Center(
            child: SizedBox(
              width: 400,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "Tomate una foto con tu licencia de conducción",
                      style:
                          Theme.of(context).textTheme.headlineMedium?.copyWith(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "Trata de que la imagen sea lo más clara posible, sin reflejos ni sombras.",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                      textAlign: TextAlign.center,
                    ),
                    const Spacer(),
                    const Center(child: ConfirmationIdentification()),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: controller.scanConfirmation,
                      child: const Text("Tomar foto"),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: kTextTabBarHeight,
          left: 16.0,
          child: FloatingActionButton(
            heroTag: 'back',
            onPressed: () {
              Get.back();
            },
            child: const Icon(FontAwesomeIcons.arrowLeft),
          ),
        ),
      ],
    );
  }
}

class DriverLicenseScanBackSideBodyView extends GetView<DriverLicenseCtrl> {
  const DriverLicenseScanBackSideBodyView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          top: (MediaQuery.of(context).size.height * 0.1),
          child: const WelcomeRoundedBall(
            color: Colors.white,
          ),
        ),
        Positioned.fill(
          top: (MediaQuery.of(context).size.height * 0.3),
          child: Center(
            child: SizedBox(
              width: 400,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "Escanea el dorso de tu licencia de conducción",
                      style:
                          Theme.of(context).textTheme.headlineMedium?.copyWith(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "Intente que la imagen sea lo más clara posible, sin reflejos ni sombras.",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                      textAlign: TextAlign.center,
                    ),
                    const Spacer(),
                    const Center(child: BackSideIdentification()),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: controller.scanBackSide,
                      child: const Text("Escanear"),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: kTextTabBarHeight,
          left: 16.0,
          child: FloatingActionButton(
            heroTag: 'back',
            onPressed: () {
              Get.back();
            },
            child: const Icon(FontAwesomeIcons.arrowLeft),
          ),
        ),
      ],
    );
  }
}

class DriverLicenseScanFrontSideBodyView extends GetView<DriverLicenseCtrl> {
  const DriverLicenseScanFrontSideBodyView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          top: (MediaQuery.of(context).size.height * 0.1),
          child: const WelcomeRoundedBall(
            color: Colors.white,
          ),
        ),
        Positioned.fill(
          top: (MediaQuery.of(context).size.height * 0.3),
          child: Center(
            child: SizedBox(
              width: 400,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "Escanea el frente de tu licencia de conducción",
                      style:
                          Theme.of(context).textTheme.headlineMedium?.copyWith(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "Intente que la imagen sea lo más clara posible, sin reflejos ni sombras.",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                      textAlign: TextAlign.center,
                    ),
                    const Spacer(),
                    const Center(child: FrontalSideIdentification()),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: controller.scanFrontalSide,
                      child: const Text("Escanear"),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: kTextTabBarHeight,
          left: 16.0,
          child: FloatingActionButton(
            heroTag: 'back',
            onPressed: () {
              Get.back();
            },
            child: const Icon(FontAwesomeIcons.arrowLeft),
          ),
        ),
      ],
    );
  }
}
