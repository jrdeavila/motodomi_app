import 'package:motodomi_app/lib.dart';

class RegisterWithGooglePage extends StatefulWidget {
  const RegisterWithGooglePage({super.key});

  @override
  State<RegisterWithGooglePage> createState() => _RegisterWithGooglePageState();
}

class _RegisterWithGooglePageState extends State<RegisterWithGooglePage> {
  final controller = Get.find<RegisterWithGoogleCtrl>();

  final _scrollController = ScrollController();
  final FocusNode _phoneFN = FocusNode();
  final FocusNode _nameFN = FocusNode();

  @override
  void initState() {
    super.initState();
    _phoneFN.addListener(_scrollToBottom);
    _nameFN.addListener(_scrollToBottom);
  }

  @override
  void dispose() {
    _phoneFN.removeListener(_scrollToBottom);
    _nameFN.removeListener(_scrollToBottom);
    _phoneFN.dispose();
    _scrollController.dispose();
    _nameFN.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (didPop) {
        if (didPop) {
          controller.cancel();
        }
      },
      canPop: false,
      child: Scaffold(
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
                    height: 620,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: WelcomeRoundedBall(
                    color: Theme.of(context).colorScheme.secondary,
                    height: 570,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: WelcomeRoundedBall(
                    color: Theme.of(context).colorScheme.primary,
                    height: 520,
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
                    backLabel: "Salir",
                    labelTitle: "Bienvenido",
                    labelDesc: "Registra los datos de tu cuenta",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildForm() {
    return SizedBox(
      height: 450,
      width: 350,
      child: Obx(() {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 100,
                  child: TextFormField(
                    initialValue: controller.code,
                    onChanged: controller.setCode,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: "+57",
                    ),
                    inputFormatters: [
                      PhoneCodeInputFormatter(),
                    ],
                  ),
                ),
                const SizedBox(width: 7),
                Expanded(
                  child: TextFormField(
                    focusNode: _phoneFN,
                    initialValue: controller.phone,
                    onChanged: controller.setPhone,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      hintText: "Telefono",
                      prefixIcon: Icon(Icons.phone),
                    ),
                    inputFormatters: [
                      PhoneInputFormatter(),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 7),
            TextFormField(
              focusNode: _nameFN,
              initialValue: controller.name,
              onChanged: controller.setName,
              decoration: const InputDecoration(
                hintText: "Nombre",
                prefixIcon: Icon(Icons.person),
              ),
            ),
            const SizedBox(height: 20),
            FadeInUpBig(
              animate: controller.isReady,
              child: ElevatedButton(
                onPressed: controller.register,
                child: controller.loading
                    ? Container(
                        padding: const EdgeInsets.all(10.0),
                        width: double.infinity,
                        height: 22,
                        child: const Center(
                          child: LoadingIndicator(
                            color: Colors.white,
                          ),
                        ),
                      )
                    : const SizedBox(
                        width: double.infinity,
                        child: Text("Registrarse", textAlign: TextAlign.center),
                      ),
              ),
            ),
          ],
        );
      }),
    );
  }

  void _scrollToBottom() {
    Future.delayed(const Duration(milliseconds: 400), () {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }
}
