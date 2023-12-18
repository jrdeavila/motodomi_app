import 'package:motodomi_app/lib.dart';

class AboutMePage extends GetView<AboutMeCtrl> {
  const AboutMePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            top: (MediaQuery.of(context).size.height * 0.1),
            child: const WelcomeRoundedBall(
              color: Colors.white,
            ),
          ),
          Positioned.fill(
            child: _buildUserData(context),
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
      ),
    );
  }

  Widget _buildUserData(context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.1,
        left: 20.0,
        right: 20.0,
        bottom: 20.0,
      ),
      child: Theme(
        data: Theme.of(context).copyWith(
          textTheme: Theme.of(context).textTheme.copyWith(
                // Input Text Style
                bodySmall: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                bodyMedium: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                bodyLarge: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
          inputDecorationTheme: InputDecorationTheme(
            filled: true,
            fillColor: Theme.of(context).colorScheme.surface,
            labelStyle:
                Theme.of(context).inputDecorationTheme.labelStyle?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
            hintStyle: Theme.of(context)
                .inputDecorationTheme
                .hintStyle
                ?.copyWith(
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
                ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildAvatar(context),
            _buildPersonalInfo(context),
          ],
        ),
      ),
    );
  }

  Widget _buildAvatar(context) {
    return Center(
      child: SizedBox(
        width: 160,
        height: 160,
        child: Stack(
          children: [
            Obx(() {
              return Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    shape: BoxShape.circle,
                  ),
                  child: controller.image != null
                      ? Center(
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.memory(
                                controller.image!,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        )
                      : const Icon(
                          FontAwesomeIcons.user,
                          color: Colors.white,
                          size: 40,
                        ),
                ),
              );
            }),
            Positioned(
              bottom: 0,
              right: 0,
              child: FloatingActionButton.small(
                heroTag: "avatar",
                onPressed: () {
                  controller.pickImage();
                },
                child: const Icon(FontAwesomeIcons.camera),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPersonalInfo(context) {
    return Obx(() {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 20,
          ),
          Text(
            "Información Personal",
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: controller.firstnameCtrl,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
            onChanged: (value) => controller.firstName = value,
            decoration: InputDecoration(
              hintText: 'Nombres',
              errorText: controller.errors['firstName'],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: controller.lastnameCtrl,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
            onChanged: (value) => controller.lastName = value,
            decoration: InputDecoration(
              hintText: 'Apellidos',
              errorText: controller.errors['lastName'],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 100,
                child: TextFormField(
                  keyboardType: TextInputType.phone,
                  controller: controller.codeCtrl,
                  onChanged: (value) => controller.code = value,
                  decoration: const InputDecoration(
                    hintText: '+57',
                  ),
                  inputFormatters: [
                    PhoneCodeInputFormatter(),
                  ],
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Expanded(
                child: TextFormField(
                  keyboardType: TextInputType.phone,
                  controller: controller.phoneCtrl,
                  onChanged: (value) => controller.phone = value,
                  decoration: InputDecoration(
                    hintText: 'Teléfono',
                    errorText:
                        controller.errors['phone'] ?? controller.errors['code'],
                  ),
                  inputFormatters: [
                    PhoneInputFormatter(),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          DatePickerField(
            date: controller.birthDate,
            label: "Fecha de Nacimiento",
            errorText: controller.errors['birthDate'],
            onChangeDate: (value) {
              controller.birthDate = value;
            },
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: controller.emailCtrl,
            onChanged: (value) => controller.email = value,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: 'Correo',
              errorText: controller.errors['email'],
            ),
          ),
          if (controller.errors['image'] != null) ...[
            const SizedBox(
              height: 10,
            ),
            Text(
              controller.errors['image']!,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.error,
                  ),
            ),
          ],
          const SizedBox(
            height: 20,
          ),
          FadeInUpBig(
            animate: controller.isValid,
            child: ElevatedButton(
              onPressed: () {
                controller.save();
              },
              child: const Text('Guardar'),
            ),
          ),
        ],
      );
    });
  }
}
