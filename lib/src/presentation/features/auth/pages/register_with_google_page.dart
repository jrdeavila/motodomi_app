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
                    canGoBack: false,
                    width: 300,
                    height: 220,
                    backLabel: "Salir",
                    labelTitle: "Bienvenido",
                    labelDesc:
                        "Digite todos los campos para poder registrarse.",
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
            PhoneInput(
              codeValue: controller.code,
              codeChanged: controller.setCode,
              phoneValue: controller.phone,
              phoneChanged: controller.setPhone,
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

class PhoneInput extends StatefulWidget {
  const PhoneInput({
    super.key,
    this.codeValue,
    this.phoneValue,
    this.codeChanged,
    this.phoneChanged,
    this.codeCtrl,
    this.phoneCtrl,
  });

  final String? codeValue;
  final ValueChanged<String>? codeChanged;
  final String? phoneValue;
  final ValueChanged<String>? phoneChanged;
  final TextEditingController? codeCtrl;
  final TextEditingController? phoneCtrl;

  @override
  State<PhoneInput> createState() => _PhoneInputState();
}

class _PhoneInputState extends State<PhoneInput> {
  final _phoneFN = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 100,
          child: TextFormField(
            controller: widget.codeCtrl,
            initialValue: widget.codeValue,
            onChanged: widget.codeChanged,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              hintText: "+__",
            ),
            // When user write the code, focus on phone input
            onFieldSubmitted: (_) {
              _phoneFN.requestFocus();
            },
            inputFormatters: [
              PhoneCodeInputFormatter(),
            ],
          ),
        ),
        const SizedBox(width: 7),
        Expanded(
          child: TextFormField(
            focusNode: _phoneFN,
            controller: widget.phoneCtrl,
            initialValue: widget.phoneValue,
            onChanged: widget.phoneChanged,
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
    );
  }
}
