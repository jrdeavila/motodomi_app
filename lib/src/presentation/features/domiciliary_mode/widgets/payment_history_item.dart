import 'package:motodomi_app/lib.dart';

class PaymentItemGroupByDateItem extends StatelessWidget {
  const PaymentItemGroupByDateItem({
    super.key,
    required this.paymentHistoryRange,
  });

  final MapEntry<DateTime, List<PaymentHistory>> paymentHistoryRange;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          parseEEEDMMMMyyyyFormat(
            paymentHistoryRange.key,
          ),
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: Theme.of(context).colorScheme.tertiary,
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
                  currencyFormatWithSymbolAndCOP(
                      paymentHistory.amount.toDouble()),
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

class PaymentHistoryGroupByDateItemSkeleton extends StatelessWidget {
  const PaymentHistoryGroupByDateItemSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 20,
          width: 200,
          child: Shimmer.fromColors(
            baseColor: Colors.grey[400]!,
            highlightColor: Colors.grey[600]!,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        ...List.generate(
            2,
            (index) => [
                  _buildItemShimmer(),
                  const SizedBox(height: 10),
                ]).expand((element) => element),
      ],
    );
  }

  Material _buildItemShimmer() {
    return Material(
      color: Colors.transparent,
      child: ListTile(
        title: SizedBox(
          height: 20,
          width: 200,
          child: Shimmer.fromColors(
              baseColor: Colors.grey[400]!,
              highlightColor: Colors.grey[600]!,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
              )),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Container(
                    height: 25,
                    width: 25,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Shimmer.fromColors(
                      baseColor: Colors.grey[400]!,
                      highlightColor: Colors.grey[600]!,
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                      ),
                    )),
                const SizedBox(width: 10),
                SizedBox(
                  height: 20,
                  width: 150,
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey[400]!,
                    highlightColor: Colors.grey[600]!,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  height: 30,
                  width: 170,
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey[400]!,
                    highlightColor: Colors.grey[600]!,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
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
