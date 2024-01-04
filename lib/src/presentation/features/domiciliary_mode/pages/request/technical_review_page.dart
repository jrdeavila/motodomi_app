import 'package:motodomi_app/lib.dart';

class TechnicalReviewPage extends GetView<TechnicalReviewCtrl> {
  const TechnicalReviewPage({super.key});

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
        _buildViewSoatMemory(context),
        _buildViewSoatNetwork(context),
      ],
    );
  }

  Widget _buildViewSoatMemory(BuildContext context) {
    return Obx(() {
      if (controller.technicalReviewFile == null) {
        return const SizedBox();
      }
      return SfPdfViewer.file(
        controller.technicalReviewFile!,
      );
    });
  }

  Widget _buildViewSoatNetwork(BuildContext context) {
    return Obx(() {
      if (controller.technicalReviewUploadedUrl == null) {
        return const SizedBox();
      }
      return SfPdfViewer.network(
        controller.technicalReviewUploadedUrl!,
      );
    });
  }

  Widget _buildButtonFindFile(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          controller.pickFile();
        },
        child: Card(
          color: Theme.of(context).colorScheme.secondary,
          child: Container(
            width: 300,
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
                  'Sube el documento de la técnica del vehículo',
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
