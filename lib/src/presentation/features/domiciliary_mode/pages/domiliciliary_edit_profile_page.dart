import 'package:motodomi_app/lib.dart';

class DomiciliaryEditProfilePage extends GetView<DomiciliaryEditProfileCtrl> {
  const DomiciliaryEditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              color: Colors.white,
            ),
          ),
          Positioned.fill(
            top: MediaQuery.of(context).size.height * 0.2,
            child: WelcomeRoundedBall(
              color: Theme.of(context).colorScheme.primary,
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
        top: MediaQuery.of(context).size.height * 0.2,
        left: 20.0,
        right: 20.0,
        bottom: 20.0,
      ),
      child: Obx(() {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildAvatar(context),
            ..._buildPersonalInfo(context),
          ],
        );
      }),
    );
  }

  Widget _buildAvatar(context) {
    return Center(
      child: SizedBox(
        width: 160,
        height: 160,
        child: Stack(
          children: [
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  shape: BoxShape.circle,
                ),
                child: controller.avatar != null
                    ? Center(
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: CachedNetworkImage(
                              imageUrl: controller.avatar!,
                              placeholder: (context, url) => const Icon(
                                FontAwesomeIcons.user,
                                color: Colors.white,
                                size: 40,
                              ),
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
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: FloatingActionButton.small(
                onPressed: () {
                  controller.pickImage();
                },
                child: controller.loadingAvatar
                    ? const LoadingIndicator(
                        count: 1,
                      )
                    : const Icon(FontAwesomeIcons.camera),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildPersonalInfo(context) {
    return [
      const SizedBox(
        height: 20,
      ),
      Text(
        "Información de perfil",
        style: Theme.of(context).textTheme.headlineMedium,
        textAlign: TextAlign.center,
      ),
      const SizedBox(
        height: 20,
      ),
      TextFormField(
        controller: controller.firstNameCtrl,
        onChanged: (value) => controller.firstName = value,
        decoration: const InputDecoration(
          hintText: 'Nombres',
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      TextFormField(
        controller: controller.lastNameCtrl,
        onChanged: (value) => controller.lastName = value,
        decoration: const InputDecoration(
          hintText: "Apellidos",
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      Row(
        children: [
          SizedBox(
            width: 100,
            child: TextFormField(
              controller: controller.codeCtrl,
              onChanged: (value) => controller.code = value,
              keyboardType: TextInputType.phone,
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
              controller: controller.phoneCtrl,
              onChanged: (value) => controller.phone = value,
              decoration: const InputDecoration(
                hintText: 'Teléfono',
              ),
              keyboardType: TextInputType.phone,
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
      TextFormField(
        controller: controller.emailCtrl,
        onChanged: (value) => controller.email = value,
        decoration: const InputDecoration(
          hintText: 'Correo',
        ),
      ),
      const SizedBox(
        height: 20,
      ),
      ElevatedButton(
        onPressed: () {
          controller.saveProfileData();
        },
        child: const Text('Guardar'),
      ),
    ];
  }
}
