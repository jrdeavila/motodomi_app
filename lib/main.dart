import 'package:motodomi_app/lib.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Motodomi',
      getPages: [
        ...MainRoutes.routes,
      ],
      initialBinding: MainBindings(),
    );
  }
}
