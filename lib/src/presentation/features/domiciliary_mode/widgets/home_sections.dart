import 'package:motodomi_app/lib.dart';

class DomiciliaryWelcomeMessage extends GetView<DomiciliaryHomeCtrl> {
  const DomiciliaryWelcomeMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Obx(() {
          return Text(
            "Bienvenido ${controller.userFirstName}",
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
          );
        }),
        Text(
          "¿Qué deseas hacer hoy?",
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: Theme.of(context).colorScheme.primary.withOpacity(0.6),
              ),
        ),
      ],
    );
  }
}

class DeliveryManOptions extends GetView<DomiciliaryHomeCtrl> {
  const DeliveryManOptions({super.key});

  @override
  Widget build(BuildContext context) {
    final scrollCtrl = ScrollController();
    return Column(
      children: [
        Row(
          children: [
            const SizedBox(
              width: 20.0,
            ),
            Text(
              "Opciones como conductor",
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color:
                        Theme.of(context).colorScheme.primary.withOpacity(0.6),
                  ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                scrollCtrl.animateTo(
                  scrollCtrl.position.maxScrollExtent,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.ease,
                );
              },
              child: Column(
                children: [
                  Icon(
                    FontAwesomeIcons.arrowRight,
                    color:
                        Theme.of(context).colorScheme.primary.withOpacity(0.6),
                    size: 16,
                  ),
                  Text(
                    "Deslizar",
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(0.6),
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: 350,
          height: 90,
          child: ListView(
            scrollDirection: Axis.horizontal,
            controller: scrollCtrl,
            children: controller.deliveryManOptions
                .map((e) => InkWell(
                      onTap: () => e.onTap?.call(context),
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.tertiary,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        width: 110,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(e.icon),
                            const SizedBox(height: 8),
                            Text(
                              e.title,
                              style: Theme.of(context).textTheme.labelSmall,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ))
                .toList(),
          ),
        ),
      ],
    );
  }
}

class ManageDocumentsButton extends StatelessWidget {
  const ManageDocumentsButton({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          children: [
            Text(
              "Manten los documentos actualizados",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
            Image.asset("assets/img/balance-cash.png"),
            Text(
              "Nota: Esto es importante para tu seguridad como conductor",
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color:
                        Theme.of(context).colorScheme.primary.withOpacity(0.6),
                    fontStyle: FontStyle.italic,
                  ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class RechargeBalanceButton extends StatelessWidget {
  const RechargeBalanceButton({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Image.asset("assets/img/balance-cash_2.png"),
          Text(
            "Presiona para recargar saldo",
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
          ),
        ],
      ),
    );
  }
}
