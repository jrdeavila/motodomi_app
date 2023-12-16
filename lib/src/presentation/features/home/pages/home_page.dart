import 'package:motodomi_app/lib.dart';

final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      drawer: const HomeDrawer(),
      body: Stack(
        children: [
          Positioned.fill(
              child: Container(
            color: Colors.white,
          )),
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
              color: Theme.of(context).colorScheme.primary,
              height: 500,
            ),
          ),
          Align(
            alignment: const FractionalOffset(0.5, 0.1),
            child: Image.asset(
              "assets/img/domiciliary.png",
              width: 400,
              height: 400,
            ),
          ),
          Positioned(
            top: kToolbarHeight,
            left: 16,
            child: FloatingActionButton(
              onPressed: () {
                _key.currentState?.openDrawer();
              },
              child: const Icon(FontAwesomeIcons.barsStaggered),
            ),
          ),
        ],
      ),
    );
  }
}
