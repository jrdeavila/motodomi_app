import 'package:flutter/services.dart';
import 'package:motodomi_app/lib.dart';

class ResumeAboutCarView extends GetView<AboutCarCtrl> {
  const ResumeAboutCarView({super.key});
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
                    "Imagen del vehículo",
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(0.5),
                        ),
                  ),
                  const SizedBox(height: 20.0),
                  controller.image != null
                      ? DNISideResumeCard(
                          image: controller.image!,
                          onRemoveAction: controller.removeImage,
                        )
                      : const SizedBox(),
                  const SizedBox(height: 20.0),
                  Text(
                    "Datos del vehículo",
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(0.5),
                        ),
                  ),
                  const SizedBox(height: 20.0),
                  Row(
                    children: [
                      Expanded(
                        child: ResumeCarDataCard(
                          label: "Marca",
                          data: controller.carBrand,
                        ),
                      ),
                      const SizedBox(width: 5.0),
                      Expanded(
                        child: ResumeCarDataCard(
                          label: "Modelo",
                          data: controller.carModel,
                        ),
                      ),
                      const SizedBox(width: 5.0),
                      Expanded(
                        child: ResumeCarDataCard(
                          label: "Placa",
                          data: controller.carPlateFormatted,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  TextButton(
                      onPressed: controller.editCarData,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(FontAwesomeIcons.penToSquare),
                          SizedBox(width: 5.0),
                          Text("Editar datos del vehículo"),
                        ],
                      ))
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

class ResumeCarDataCard extends StatelessWidget {
  const ResumeCarDataCard({super.key, required this.data, required this.label});

  final String data;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Theme.of(context).colorScheme.surface,
        border: Border.all(
          color: Theme.of(context).colorScheme.primary,
          width: 2,
        ),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 10.0,
      ),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  )),
          Text(
            data,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ],
      ),
    );
  }
}

class TakeCarPhotoView extends GetView<AboutCarCtrl> {
  const TakeCarPhotoView({super.key});

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
                      "Tomale una foto a tu vehículo",
                      style:
                          Theme.of(context).textTheme.headlineMedium?.copyWith(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "Por favor, toma una foto a tu vehículo para que los clientes puedan identificarte.",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                      textAlign: TextAlign.center,
                    ),
                    const Spacer(),
                    Image.asset("assets/img/domiciliary_4.png"),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: controller.pickImage,
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

class AboutCarFormView extends GetView<AboutCarCtrl> {
  const AboutCarFormView({
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
        SingleChildScrollView(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.3,
            left: 20.0,
            right: 20.0,
            bottom: 20.0,
          ),
          child: Obx(() {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Información del vehículo",
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "Por favor, ingresa la información de tu vehículo para que los clientes puedan identificarte.",
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 20,
                ),
                SearcheableDropdown<String>(
                  label: "Marca del vehículo",
                  value: controller.carBrand,
                  error: controller.errors['carBrand'],
                  items: controller.carBrandAndModels.entries.map(
                    (e) => SearcheableDropDownItem(
                        label: Row(
                          children: [
                            const Icon(FontAwesomeIcons.motorcycle),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(e.key,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurface,
                                    )),
                          ],
                        ),
                        key: e.key,
                        value: e.key),
                  ),
                  onChanged: (value) {
                    controller.carBrand = value;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                SearcheableDropdown<String>(
                  value: controller.carModel,
                  label: "Modelo del vehículo",
                  items: controller.carBrandAndModels[controller.carBrand]
                          ?.map((e) => SearcheableDropDownItem(
                                label: Row(
                                  children: [
                                    const Icon(FontAwesomeIcons.motorcycle),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(e,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.copyWith(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onSurface,
                                            )),
                                  ],
                                ),
                                key: e,
                                value: e,
                              )) ??
                      [],
                  onChanged: (value) {
                    controller.carModel = value;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: controller.carPlateCtrl,
                  onChanged: (value) {
                    controller.carPlate = value;
                  },
                  decoration: InputDecoration(
                      hintText: "Ingresa la placa de tu vehículo",
                      prefixIcon: const Icon(FontAwesomeIcons.car),
                      errorText: controller.errors['carPlate']),
                  // Keyboard on UpperCase
                  textCapitalization: TextCapitalization.characters,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(7),
                    CarPlateFormatter(),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    controller.goToPickImage();
                  },
                  child: const Text('Continuar'),
                ),
              ],
            );
          }),
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
