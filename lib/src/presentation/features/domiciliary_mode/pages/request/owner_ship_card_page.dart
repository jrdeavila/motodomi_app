import 'package:motodomi_app/lib.dart';

class OwnerShipCardPage extends GetView<OwnerShipCardCtrl> {
  const OwnerShipCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return Stack(
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
        );
      }),
    );
  }

  Widget _buildBody(BuildContext context) {
    return PageView(
      controller: controller.pageCtrl,
      scrollDirection: Axis.horizontal,
      physics: const NeverScrollableScrollPhysics(),
      children: const [
        OwnerShipCardFrontSideBodyView(),
        OwnerShipCardBackSideBodyView(),
        ResumeOwnerShipCardBodyView(),
      ],
    );
  }
}
