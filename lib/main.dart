import 'package:flutter/services.dart';
import 'package:motodomi_app/lib.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // Close the keyboard if is open
  SystemChannels.textInput.invokeMethod('TextInput.hide');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
          ],
          initialBinding: MainBindings(),
        ));
  }
}
