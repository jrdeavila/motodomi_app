import 'package:motodomi_app/lib.dart';

class NoCriminalRecordPage extends GetView<NoCriminalRecordCtrl> {
  const NoCriminalRecordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            top: kToolbarHeight,
            child: WelcomeRoundedBall(
              color: Theme.of(context).colorScheme.background,
            ),
          ),
          Positioned.fill(
            top: kToolbarHeight + 20,
            child: _buildBody(context),
          ),
          Obx(() {
            return Positioned(
              bottom: 16.0,
              right: 16.0,
              child: FadeInUpBig(
                animate: controller.canEdit,
                child: FloatingActionButton.extended(
                  heroTag: 'edit',
                  onPressed: controller.pickFile,
                  icon: const Icon(FontAwesomeIcons.penToSquare),
                  label: const Text("Cambiar Documento"),
                ),
              ),
            );
          }),
          Obx(() {
            return Positioned(
              bottom: 16.0,
              right: 16.0,
              child: controller.loading
                  ? FloatingActionButton.extended(
                      onPressed: () {},
                      label: Container(
                        width: 50.0,
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: const LoadingIndicator(
                          color: Colors.white,
                        ),
                      ))
                  : FadeInUpBig(
                      animate: controller.canSave,
                      child: FloatingActionButton.extended(
                        heroTag: 'save',
                        onPressed: controller.save,
                        icon: const Icon(FontAwesomeIcons.floppyDisk),
                        label: const Text("Guardar"),
                      ),
                    ),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return PageView(
      controller: controller.pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        _buildButtonFindFile(context),
        _buildViewNcmMemory(context),
        _buildViewNcmNetwork(context),
      ],
    );
  }

  Widget _buildViewNcmMemory(BuildContext context) {
    return Obx(() {
      if (controller.ncmFile == null) {
        return const SizedBox();
      }
      return SfPdfViewer.file(
        controller.ncmFile!,
      );
    });
  }

  Widget _buildViewNcmNetwork(BuildContext context) {
    return Obx(() {
      if (controller.ncmUploadedUrl == null) {
        return const SizedBox();
      }
      return SfPdfViewer.network(
        controller.ncmUploadedUrl!,
      );
    });
  }

  Widget _buildButtonFindFile(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Por seguridad, debes subir tu carta de antecedentes penales",
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
              textAlign: TextAlign.center,
            ),
            Text(
              "Esto nos ayuda a verificar que todos los domiciliarios sean de confianza, incluyendote a ti",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                controller.pickFile();
              },
              child: SizedBox(
                width: 300,
                child: Card(
                  color: Theme.of(context).colorScheme.secondary,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          FontAwesomeIcons.solidFile,
                          size: 100,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Sube tu carta de antecedentes penales',
                          style: Theme.of(context).textTheme.headlineMedium,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
