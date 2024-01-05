import 'package:motodomi_app/lib.dart';

class AboutCarPage extends GetView<AboutCarCtrl> {
  const AboutCarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return DomiciliaryThemeData(
          child: Stack(
            fit: StackFit.expand,
            children: [
              _buildBody(context),
              if (controller.pageLoading)
                Positioned.fill(
                  child: Container(
                    color: Colors.black.withOpacity(0.5),
                    child: const Center(
                      child: LoadingIndicator(),
                    ),
                  ),
                ),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildBody(BuildContext context) {
    return PageView(
      controller: controller.pageController,
      scrollDirection: Axis.horizontal,
      physics: const NeverScrollableScrollPhysics(),
      children: const [
        AboutCarFormView(),
        TakeCarPhotoView(),
        ResumeAboutCarView(),
      ],
    );
  }
}
