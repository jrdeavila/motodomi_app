import 'package:motodomi_app/lib.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: CircularProgressIndicator(
          color: Get.theme.colorScheme.primary,
        ),
      ),
    );
  }
}
