import 'package:motodomi_app/lib.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _scrollController = ScrollController();
  final FocusNode _phoneFN = FocusNode();
  final FocusNode _nameFN = FocusNode();
  final FocusNode _emailFN = FocusNode();
  final FocusNode _passwordFN = FocusNode();

  @override
  void initState() {
    super.initState();
    _phoneFN.addListener(_scrollToBottom);
    _nameFN.addListener(_scrollToBottom);
    _emailFN.addListener(_scrollToBottom);
    _passwordFN.addListener(_scrollToBottom);
  }

  @override
  void dispose() {
    _phoneFN.removeListener(_scrollToBottom);
    _nameFN.removeListener(_scrollToBottom);
    _emailFN.removeListener(_scrollToBottom);
    _passwordFN.removeListener(_scrollToBottom);
    _phoneFN.dispose();
    _scrollController.dispose();
    _nameFN.dispose();
    _emailFN.dispose();
    _passwordFN.dispose();

    super.dispose();
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
                  backLabel: "Inicio",
                  labelTitle: "Registrate",
                  labelDesc: "Crea una cuenta para continuar",
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
      height: 400,
      width: 350,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            focusNode: _phoneFN,
            keyboardType: TextInputType.phone,
            decoration: const InputDecoration(
              labelText: "Telefono",
              prefixIcon: Icon(Icons.phone),
            ),
            inputFormatters: [
              PhoneInputFormatter(),
            ],
          ),
          const SizedBox(height: 20),
          TextFormField(
            focusNode: _nameFN,
            decoration: const InputDecoration(
              labelText: "Nombre",
              prefixIcon: Icon(Icons.person),
            ),
          ),
          const SizedBox(height: 7),
          TextFormField(
            focusNode: _emailFN,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              labelText: "Correo Electronico",
              prefixIcon: Icon(Icons.person),
            ),
          ),
          const SizedBox(height: 7),
          TextFormField(
            focusNode: _passwordFN,
            obscureText: true,
            decoration: const InputDecoration(
              labelText: "Contraseña",
              prefixIcon: Icon(Icons.lock),
            ),
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
