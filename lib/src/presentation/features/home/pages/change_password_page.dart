import 'package:motodomi_app/lib.dart';

class ChangePasswordPage extends GetView<EditProfileCtrl> {
  const ChangePasswordPage({super.key});

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
        top: MediaQuery.of(context).size.height * 0.3,
        left: 20.0,
        right: 20.0,
        bottom: 20.0,
      ),
      child: Obx(() {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
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
        obscureText: true,
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
        obscureText: true,
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
        obscureText: true,
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
          controller.savePassword();
        },
        child: const Text('Guardar'),
      ),
    ];
  }
}
