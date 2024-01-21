import 'package:motodomi_app/lib.dart';

class DomiciliaryTermsAndConditionsPage extends StatelessWidget {
  final String url;
  const DomiciliaryTermsAndConditionsPage({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: AppBar(
          leading: Center(
            child: FloatingActionButton(
              onPressed: () {
                Get.back();
              },
              child: const Icon(Icons.arrow_back),
            ),
          ),
          leadingWidth: 100,
          title: const Text("Términos y condiciones"),
          titleTextStyle: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
        ),
        body: SfPdfViewer.network(
          url,
          key: const ValueKey("pdf-viewer"),
        ));
  }
}
