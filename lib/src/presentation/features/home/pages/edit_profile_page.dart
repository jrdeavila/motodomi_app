import 'package:motodomi_app/lib.dart';

class EditProfilePage extends GetView<EditProfileCtrl> {
  const EditProfilePage({super.key});

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
            CircleAvatar(
              radius: 80,
              backgroundColor: Theme.of(context).colorScheme.secondary,
              child: const Icon(
                FontAwesomeIcons.user,
                color: Colors.white,
                size: 40,
              ),
            ),
            ..._buildPersonalInfo(context),
            ..._buildPasswordInfo(context),
          ],
        );
      }),
    );
  }

  List<Widget> _buildPasswordInfo(context) {
    return [
      const SizedBox(
        height: 20,
      ),
      Text(
        "Cambiar contraseña",
        style: Theme.of(context).textTheme.headlineMedium,
        textAlign: TextAlign.center,
      ),
      const SizedBox(
        height: 20,
      ),
      TextFormField(
        initialValue: controller.currentPassword,
        onChanged: (value) => controller.currentPassword = value,
        decoration: const InputDecoration(
          hintText: 'Contraseña actual',
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      TextFormField(
        initialValue: controller.password,
        onChanged: (value) => controller.password = value,
        decoration: const InputDecoration(
          hintText: 'Nueva contraseña',
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      TextFormField(
        initialValue: controller.confirmPassword,
        onChanged: (value) => controller.confirmPassword = value,
        decoration: const InputDecoration(
          hintText: 'Confirmar contraseña',
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

  List<Widget> _buildPersonalInfo(context) {
    final nameCtrl = TextEditingController(text: controller.name);
    final phoneCtrl = TextEditingController(text: controller.phone);
    final emailCtrl = TextEditingController(text: controller.email);
    final codeCtrl = TextEditingController(text: controller.code);
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
        controller: nameCtrl,
        onChanged: (value) => controller.name = value,
        decoration: const InputDecoration(
          hintText: 'Nombre',
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
              controller: codeCtrl,
              onChanged: (value) => controller.code = value,
              decoration: const InputDecoration(
                hintText: '+57',
              ),
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Expanded(
            child: TextFormField(
              controller: phoneCtrl,
              onChanged: (value) => controller.phone = value,
              decoration: const InputDecoration(
                hintText: 'Teléfono',
              ),
            ),
          ),
        ],
      ),
      const SizedBox(
        height: 10,
      ),
      TextFormField(
        controller: emailCtrl,
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
