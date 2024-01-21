import 'package:flutter/services.dart';
import 'package:motodomi_app/lib.dart';

class DomiciliaryRechargeBalancePage
    extends GetView<DomiciliaryRechargeBalanceCtrl> {
  const DomiciliaryRechargeBalancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Stack(
        children: [
          Positioned.fill(
            child: Obx(() {
              return DomiciliaryThemeData(
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.1 +
                        MediaQuery.of(context).padding.top,
                  ),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Digite monto y seleccione el método de pago",
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onBackground),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: "Valor a recargar",
                            prefixIcon: Icon(Icons.monetization_on),
                          ),
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            controller.amount = value;
                          },
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            COPCurrencyInputFormatter(),
                          ],
                        ),
                        const SizedBox(height: 10),
                        SearcheableDropdown<PaymentMethod>(
                          value: controller.paymentMethod,
                          label: "Metodo de Pago",
                          items: controller.paymentMethods
                              .map(
                                  (e) => SearcheableDropDownItem<PaymentMethod>(
                                      key: e.name,
                                      label: Row(
                                        children: [
                                          Icon(e.icon),
                                          const SizedBox(width: 10),
                                          Text(e.name),
                                        ],
                                      ),
                                      value: e))
                              .toList(),
                          onChanged: (value) {
                            controller.paymentMethod = value;
                          },
                        ),
                        const SizedBox(height: 20),
                        Text(
                          "Formulario de pago",
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(
                                color:
                                    Theme.of(context).colorScheme.onBackground,
                              ),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          "Ingrese los datos correspondientes al método de pago. Los datos ingresados son seguros y no se almacenan en el dispositivo.",
                          textAlign: TextAlign.start,
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onBackground
                                        .withOpacity(0.5),
                                  ),
                        ),
                        const SizedBox(height: 20),
                        if (controller.isNequiPaymentMethod)
                          const NequiPaymentForm(),
                        if (controller.isBancolombiaPaymentMethod)
                          const BancolombiaPaymentForm(),
                      ],
                    ),
                  ),
                ),
              );
            }),
          ),
          Positioned(
            left: 16,
            top: MediaQuery.of(context).padding.top,
            child: FloatingActionButton(
              onPressed: () {
                Get.back();
              },
              child: const Icon(Icons.arrow_back),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Theme.of(context).colorScheme.background,
        height: 140,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: controller.rechargeBalance,
              child: const Text("Recargar"),
            ),
            TextButton(
              onPressed: () {
                controller.showTermsAndConditions();
              },
              child: Text("Terminos y Condiciones del proceso de pago",
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color:
                        Theme.of(context).colorScheme.primary.withOpacity(0.5),
                  )),
            )
          ],
        ),
      ),
    );
  }
}

class BancolombiaPaymentForm extends GetView<DomiciliaryRechargeBalanceCtrl> {
  const BancolombiaPaymentForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: "Cuenta de ahorros Bancolombia",
        prefixIcon: Icon(Icons.phone),
      ),
      onChanged: (value) {
        controller.phoneNumber = value;
      },
      keyboardType: TextInputType.number,
      inputFormatters: [
        BancolombiaAccountInputFormatter(),
      ],
    );
  }
}

class NequiPaymentForm extends GetView<DomiciliaryRechargeBalanceCtrl> {
  const NequiPaymentForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: "Número de Nequi",
        prefixIcon: Icon(Icons.phone),
      ),
      onChanged: (value) {
        controller.phoneNumber = value;
      },
      keyboardType: TextInputType.number,
      inputFormatters: [
        PhoneInputFormatter(),
      ],
    );
  }
}
