import 'package:motodomi_app/lib.dart';

class DomiciliaryLoadingPage extends GetView<DomiciliaryModeCtrl> {
  const DomiciliaryLoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox.shrink(),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/img/domiciliary_2.png',
                  width: 300,
                  height: 200,
                ),
                LoadingIndicator(
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                controller.cancel();
              },
              child: const Text("Cancelar"),
            )
          ],
        ),
      ),
    );
  }
}
