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
                      delegate: controller.isLoading
                          ? SliverChildBuilderDelegate(
                              (context, index) {
                                return const PaymentHistoryGroupByDateItemSkeleton();
                              },
                              childCount: 5,
                            )
                          : SliverChildBuilderDelegate(
                              (context, index) {
                                final paymentHistoryRange = controller
                                    .paymentHistoryGroupedByDate.entries
                                    .toList()[index];
                                return PaymentItemGroupByDateItem(
                                    paymentHistoryRange: paymentHistoryRange);
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
