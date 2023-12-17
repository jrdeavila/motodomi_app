import 'package:motodomi_app/lib.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final themeCtrl = Get.put(ThemeCtrl());
    return Obx(() => GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Motodomi',
          themeMode: themeCtrl.themeMode,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          getPages: [
            ...MainRoutes.routes,
            ...AuthRoutes.routes,
            ...HomeRoutes.routes,
          ],
          initialBinding: MainBindings(),
        ));
  }
}
