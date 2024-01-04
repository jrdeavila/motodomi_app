import 'package:flutter/services.dart';
import 'package:motodomi_app/lib.dart';

class ResumeOwnerShipCardBodyView extends GetView<OwnerShipCardCtrl> {
  const ResumeOwnerShipCardBodyView({super.key});

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
                    "Lado frontal de la tarjeta de propiedad",
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(0.5),
                        ),
                  ),
                  const SizedBox(height: 20.0),
                  controller.onwerShipCardFrontSide != null
                      ? DNISideResumeCard(
                          image: controller.onwerShipCardFrontSide!,
                          onRemoveAction: controller.clearBackImage,
                        )
                      : const BackSideIdentification(),
                  const SizedBox(height: 20.0),
                  Text(
                    "Lado trasero de la tarjeta de propiedad",
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(0.5),
                        ),
                  ),
                  const SizedBox(height: 20.0),
                  controller.onwerShipCardBackSide != null
                      ? DNISideResumeCard(
                          image: controller.onwerShipCardBackSide!,
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

class OwnerShipCardBackSideBodyView extends GetView<OwnerShipCardCtrl> {
  const OwnerShipCardBackSideBodyView({
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
                      "Escanea el dorso de tu tarjeta de propiedad",
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

class OwnerShipCardFrontSideBodyView extends GetView<OwnerShipCardCtrl> {
  const OwnerShipCardFrontSideBodyView({
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
                      "Escanea el frente de tu tarjeta de propiedad",
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
