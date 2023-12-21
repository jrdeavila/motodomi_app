import 'package:motodomi_app/lib.dart';

class DomiciliaryRequestFormPage extends GetView<DomiciliaryRequestCtrl> {
  const DomiciliaryRequestFormPage({super.key});

  @override
  Widget build(BuildContext context) {
    final key = GlobalKey<ScaffoldState>();
    final modeCtrl = Get.find<DomiciliaryModeCtrl>();
    return WillPopScope(
      onWillPop: () async {
        modeCtrl.cancelWithAlert();
        return false;
      },
      child: Obx(() {
        return Scaffold(
          key: key,
          body: Stack(
            children: [
              Positioned.fill(
                  child: Container(
                color: Colors.white,
              )),
              Positioned.fill(
                top: MediaQuery.of(context).size.height * 0.15,
                child: WelcomeRoundedBall(
                  color: Theme.of(context).colorScheme.surface,
                ),
              ),
              Positioned.fill(
                top: controller.backgroundOffset,
                child: WelcomeRoundedBall(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              Align(
                alignment: const FractionalOffset(1, 0.1),
                child: Image.asset(
                  "assets/img/domiciliary_3.png",
                  height: 250,
                ),
              ),
              Positioned.fill(
                child: _buildBody(),
              ),
              if (controller.loading)
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

  Widget _buildBody() {
    return Obx(() {
      return CustomScrollView(
        controller: controller.scrollController,
        slivers: [
          SliverAppBar.large(
            backgroundColor: Colors.transparent,
            title: Text(
              "Solictud de Conductor",
              style: Theme.of(Get.context!).textTheme.headlineMedium?.copyWith(
                    color: Theme.of(Get.context!).colorScheme.primary,
                  ),
            ),
            leadingWidth: 100,
            leading: Center(
              child: FloatingActionButton(
                child: const Icon(FontAwesomeIcons.arrowLeft),
                onPressed: () {
                  Get.find<DomiciliaryModeCtrl>().cancelWithAlert();
                },
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: MediaQuery.of(Get.context!).size.height * 0.15,
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(20.0),
            sliver: SliverGrid.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                final step = controller.steps[index];
                return Card(
                  child: InkWell(
                    borderRadius: BorderRadius.circular(30),
                    onTap: step.onTap,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                            Icon(
                              step.icon,
                              size: 50,
                              color: Theme.of(Get.context!).colorScheme.primary,
                            ),
                            if (step.status == StepStatus.complete)
                              Positioned(
                                top: 0,
                                right: 0,
                                child: Icon(
                                  FontAwesomeIcons.solidCircleCheck,
                                  color: Theme.of(Get.context!)
                                      .colorScheme
                                      .secondary,
                                ),
                              )
                          ],
                        ),
                        const SizedBox(height: 10),
                        Text(
                          step.title,
                          style: Theme.of(Get.context!).textTheme.headlineSmall,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                );
              },
              itemCount: controller.steps.length,
            ),
          ),
        ],
      );
    });
  }
}
