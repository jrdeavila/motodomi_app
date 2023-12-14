import 'package:motodomi_app/lib.dart';
import 'package:motodomi_app/src/presentacion/routes/main_routes.dart';

import '../routes/authentication_routes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    const color = Color.fromRGBO(5, 199, 242, 1);
    const swatch = <int, Color>{
      50: color,
      100: color,
      200: color,
      300: color,
      400: color,
      500: color,
      600: color,
      700: color,
      800: color,
      900: color,
    };
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          elevation: 0.0,
          toolbarHeight: kToolbarHeight + 50.0,
          centerTitle: true,
          backgroundColor: Colors.transparent,
          titleTextStyle: GoogleFonts.nunito(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        colorScheme: ColorScheme.fromSwatch(
          accentColor: color,
          primarySwatch: MaterialColor(
            color.value,
            swatch,
          ),
          brightness: Brightness.light,
        ),
      ),
      getPages: [
        ...MainRoutes.routes,
        ...AuthenticationRoutes.routes,
      ],
      initialRoute: MainRoutes.main,
    );
  }
}
