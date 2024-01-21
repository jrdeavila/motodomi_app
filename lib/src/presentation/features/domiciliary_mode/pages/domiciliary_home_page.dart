import 'package:motodomi_app/lib.dart';

class DomiciliaryHomePage extends StatelessWidget {
  const DomiciliaryHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final key = GlobalKey<ScaffoldState>();
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      key: key,
      drawer: const DomiciliaryHomeDrawer(),
      appBar: AppBar(
        leadingWidth: 100,
        leading: Center(
          child: FloatingActionButton(
            onPressed: () {
              key.currentState?.openDrawer();
            },
            child: const Icon(FontAwesomeIcons.bars),
          ),
        ),
        actions: const [
          AvailableBalanceTarget(),
          SizedBox(width: 20),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(
          bottom: 16.0,
        ),
        child: Column(
            children: Get.find<DomiciliaryHomeCtrl>()
                .homeSections
                .map((e) => [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          children: [
                            Divider(
                              color: Theme.of(context)
                                  .colorScheme
                                  .primary
                                  .withOpacity(0.1),
                            ),
                            const SizedBox(height: 20),
                            e.child,
                            const SizedBox(height: 20),
                            Divider(
                              color: Theme.of(context)
                                  .colorScheme
                                  .primary
                                  .withOpacity(0.1),
                            ),
                          ],
                        ),
                      ),
                    ])
                .expand((element) => element)
                .toList()),
      ),
    );
  }
}

class AvailableBalanceTarget extends GetView<DomiciliaryHomeCtrl> {
  const AvailableBalanceTarget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Saldo disponible",
              style: Theme.of(context).textTheme.labelSmall),
          Obx(() {
            return Text(
              controller.balance,
              style: Theme.of(context).textTheme.headlineMedium,
            );
          }),
        ],
      ),
    );
  }
}
