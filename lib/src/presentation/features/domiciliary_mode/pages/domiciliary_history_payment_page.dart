import 'package:motodomi_app/lib.dart';

class DomiciliaryHistoryPaymentPage extends GetView<HistoryPaymentCtrl> {
  const DomiciliaryHistoryPaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Theme(
        data: Theme.of(context).copyWith(
          listTileTheme: ListTileThemeData(
            tileColor: Theme.of(context).colorScheme.surface,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
          ),
        ),
        child: Stack(
          children: [
            Positioned.fill(
              top: MediaQuery.of(context).size.height * 0.4,
              child: WelcomeRoundedBall(
                color: Theme.of(context).colorScheme.secondary.withOpacity(0.3),
              ),
            ),
            Positioned.fill(
              top: MediaQuery.of(context).size.height * 0.5,
              child: WelcomeRoundedBall(
                color: Theme.of(context).colorScheme.secondary.withOpacity(0.3),
              ),
            ),
            Positioned.fill(
                child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  toolbarHeight: kToolbarHeight + 20,
                  leadingWidth: 100,
                  leading: Center(
                    child: FloatingActionButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: const Icon(FontAwesomeIcons.arrowLeft),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(height: 20),
                        Text(
                          'Historial de pagos',
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge
                              ?.copyWith(
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Aquí puedes ver el historial de tus pagos',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.only(top: 20, left: 16, right: 16),
                  sliver: Obx(
                    () => SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          final paymentHistoryRange = controller
                              .paymentHistoryGroupedByDate.entries
                              .toList()[index];
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                parseEEEDMMMMyyyyFormat(
                                  paymentHistoryRange.key,
                                ),
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge
                                    ?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .tertiary,
                                    ),
                              ),
                              const SizedBox(height: 10),
                              ...paymentHistoryRange.value
                                  .map((e) => [
                                        PaymentHistoryItem(
                                          paymentHistory: e,
                                        ),
                                        const SizedBox(height: 10),
                                      ])
                                  .expand((element) => element)
                                  .toList(),
                              const SizedBox(height: 20),
                            ],
                          );
                        },
                        childCount: controller
                            .paymentHistoryGroupedByDate.entries.length,
                      ),
                    ),
                  ),
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }
}

class PaymentHistoryItem extends StatelessWidget {
  const PaymentHistoryItem({
    super.key,
    required this.paymentHistory,
  });

  final PaymentHistory paymentHistory;

  String get _typeOfPayment => paymentHistory.paymentData.paymentType ==
          PaymentMethodType.bancolombiaALaMano
      ? 'Recarga de Bancolombia a la mano'
      : 'Recarga de Nequi';

  Widget get _status => paymentHistory.status == PaymentStatus.approved
      ? Row(
          children: [
            Icon(
              FontAwesomeIcons.circleCheck,
              color: Theme.of(Get.context!).colorScheme.primary,
            ),
            const SizedBox(width: 10),
            Text('PAGO APROBADO',
                style: Theme.of(Get.context!).textTheme.bodySmall?.copyWith(
                      color: Theme.of(Get.context!).colorScheme.onSurface,
                    )),
          ],
        )
      : paymentHistory.status == PaymentStatus.declined
          ? Row(
              children: [
                Icon(
                  FontAwesomeIcons.circleXmark,
                  color: Theme.of(Get.context!).colorScheme.error,
                ),
                const SizedBox(width: 5),
                Text(
                  'PAGO DECLINADO',
                  style: Theme.of(Get.context!).textTheme.bodySmall?.copyWith(
                        color: Theme.of(Get.context!).colorScheme.onSurface,
                      ),
                ),
              ],
            )
          : Row(
              children: [
                Icon(
                  FontAwesomeIcons.clock,
                  color: Colors.grey[600],
                ),
                const SizedBox(width: 5),
                Text(
                  'PENDIENTE',
                  style: Theme.of(Get.context!).textTheme.bodySmall?.copyWith(
                      color: Theme.of(Get.context!).colorScheme.onSurface),
                ),
              ],
            );

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: ListTile(
        title: Text(
          _typeOfPayment,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _status,
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  currencyFormat(paymentHistory.amount.toDouble()),
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
