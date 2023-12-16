import 'package:motodomi_app/lib.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginCtrl controller = Get.find<LoginCtrl>();

  final _scrollController = ScrollController();
  final FocusNode _emailFN = FocusNode();
  final FocusNode _passwordFN = FocusNode();

  @override
  void initState() {
    _emailFN.addListener(_scrollToBottom);
    _passwordFN.addListener(_scrollToBottom);
    super.initState();
  }

  @override
  void dispose() {
    _emailFN.removeListener(_scrollToBottom);
    _passwordFN.removeListener(_scrollToBottom);
    _emailFN.dispose();
    _passwordFN.dispose();
    _scrollController.dispose();
    controller.dispose();
    super.dispose();
  }

  void _scrollToBottom() {
    Future.delayed(const Duration(milliseconds: 400), () {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        controller: _scrollController,
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Stack(
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
                  height: 600,
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: WelcomeRoundedBall(
                  color: Theme.of(context).colorScheme.secondary,
                  height: 550,
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: WelcomeRoundedBall(
                  color: Theme.of(context).colorScheme.primary,
                  height: 500,
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
                  backLabel: "Inicio",
                  labelTitle: "Bienvenido",
                  labelDesc: "Inicia sesión para continuar",
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
      height: 350,
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
            const SizedBox(height: 10),
            TextFormField(
              focusNode: _passwordFN,
              initialValue: controller.password,
              keyboardType: TextInputType.visiblePassword,
              obscureText: !controller.isPasswordVisible,
              onChanged: controller.setPassword,
              decoration: InputDecoration(
                hintText: "Contraseña",
                prefixIcon: const Icon(FontAwesomeIcons.lock),
                suffixIcon: GestureDetector(
                  onTap: controller.togglePasswordVisibility,
                  child: Icon(controller.isPasswordVisible
                      ? FontAwesomeIcons.eyeSlash
                      : FontAwesomeIcons.eye),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Checkbox(
                  value: controller.isRememberMe,
                  onChanged: controller.toggleRememberMe,
                ),
                const Expanded(
                  child: Text("Recordar contraseña"),
                ),
              ],
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: controller.goToForgotPassword,
              child: const Text("¿Olvidaste tu contraseña?"),
            ),
            const SizedBox(height: 20),
            FadeInUpBig(
              animate: controller.isReady,
              child: ElevatedButton(
                onPressed: controller.login,
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
