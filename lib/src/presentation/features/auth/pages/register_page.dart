import 'package:motodomi_app/lib.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

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
            decoration: const InputDecoration(
              labelText: "Nombre",
              prefixIcon: Icon(Icons.person),
            ),
          ),
          const SizedBox(height: 7),
          TextFormField(
            decoration: const InputDecoration(
              labelText: "Correo Electronico",
              prefixIcon: Icon(Icons.person),
            ),
          ),
          const SizedBox(height: 7),
          TextFormField(
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
}
