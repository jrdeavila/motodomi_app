import 'package:motodomi_app/lib.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _scrollController = ScrollController();
  final FocusNode _phoneFN = FocusNode();

  @override
  void initState() {
    _phoneFN.addListener(_scrollToBottom);
    super.initState();
  }

  @override
  void dispose() {
    _phoneFN.removeListener(_scrollToBottom);
    _phoneFN.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToBottom() {
    Future.delayed(const Duration(milliseconds: 200), () {
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
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: WelcomeRoundedBall(
                  color: Theme.of(context).colorScheme.surface,
                  height: 500,
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: WelcomeRoundedBall(
                  color: Theme.of(context).colorScheme.secondary,
                  height: 450,
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: WelcomeRoundedBall(
                  color: Theme.of(context).colorScheme.primary,
                  height: 400,
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
      height: 300,
      width: 350,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            decoration: const InputDecoration(
              labelText: "Telefono",
              prefixIcon: Icon(Icons.phone),
            ),
            inputFormatters: [
              PhoneInputFormatter(),
            ],
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {},
            child: const SizedBox(
              width: double.infinity,
              child: Text("Iniciar Sesión", textAlign: TextAlign.center),
            ),
          ),
        ],
      ),
    );
  }
}
