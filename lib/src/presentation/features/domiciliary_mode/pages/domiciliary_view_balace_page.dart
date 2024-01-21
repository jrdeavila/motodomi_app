import 'package:motodomi_app/lib.dart';

class DomiciliaryViewBalancePage
    extends GetView<DomiciliaryRechargeBalanceCtrl> {
  const DomiciliaryViewBalancePage({super.key});

  @override
  Widget build(BuildContext context) {
    final key = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: key,
      drawer: const DomiciliaryHomeDrawer(),
      body: Stack(
        children: [
          Positioned.fill(
              child: Container(
            color: Colors.white,
          )),
          Positioned.fill(
            top: MediaQuery.of(context).size.height * 0.2,
            child: WelcomeRoundedBall(
              color: Theme.of(context).colorScheme.surface,
            ),
          ),
          Positioned.fill(
              top: (MediaQuery.of(context).size.height * 0.2) + 50,
              left: 16,
              right: 16,
              child: Column(
                children: [
                  const CarBalance(balance: 10000),
                  const SizedBox(height: 20),
                  ...controller.rechargeOptions
                      .map((e) => [
                            Material(
                              color: Colors.transparent,
                              child: ListTile(
                                onTap: () => e.onTap?.call(context),
                                tileColor: Colors.grey[200],
                                title: Text(
                                  e.title,
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge
                                      ?.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurface,
                                      ),
                                ),
                                minLeadingWidth: 50,
                                leading: Icon(
                                  e.icon,
                                  size: 32,
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ])
                      .expand((element) => element)
                      .toList(),
                ],
              )),
          Positioned(
            top: kToolbarHeight,
            left: 16,
            child: FloatingActionButton(
              onPressed: () {
                Get.back();
              },
              child: const Icon(FontAwesomeIcons.arrowLeft),
            ),
          ),
        ],
      ),
    );
  }
}

class CarBalance extends StatelessWidget {
  final double balance;
  const CarBalance({
    super.key,
    required this.balance,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: 300,
        height: 150,
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Saldo actual",
              style: Theme.of(context).textTheme.labelSmall,
            ),
            Text(
              currencyFormatWithSymbolAndCOP(balance),
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              "DISPONIBLE",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}
