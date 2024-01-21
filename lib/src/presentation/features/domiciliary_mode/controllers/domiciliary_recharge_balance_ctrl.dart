import 'package:motodomi_app/lib.dart';

class PaymentMethod {
  final PaymentMethodType key;
  final String name;
  final IconData icon;
  final Future Function() onTap;

  PaymentMethod({
    required this.key,
    required this.name,
    required this.icon,
    required this.onTap,
  });

  @override
  String toString() => name;
}

class DomiciliaryRechargeBalanceCtrl extends GetxController {
  // ------------------------ Local Variables ---------------------

  final DeliveryManProfile deliveryManProfile;

  // ------------------------ Constructor ---------------------

  DomiciliaryRechargeBalanceCtrl({required this.deliveryManProfile});

  // ------------------------ Observables ---------------------

  final Rx<PaymentTermsAndConditions?> _paymentTermsAndConditions =
      Rx<PaymentTermsAndConditions?>(null);
  late final Rx<PaymentMethod> _paymentMethod = paymentMethods.first.obs;
  final RxString _amount = "".obs;
  final RxString _phoneNumber = "".obs;

  // ------------------------ Getters ---------------------

  String get termsAndConditionsUrl =>
      _paymentTermsAndConditions.value?.termsAndConditionsUrl ?? "";
  PaymentMethod get paymentMethod => _paymentMethod.value;
  int get intAmount =>
      COPCurrencyInputFormatter.unformat(_amount.value).toInt();
  int get intPhoneNumber => PhoneInputFormatter.unformat(_phoneNumber.value);

  String get amount => _amount.value;
  String get phoneNumber => _phoneNumber.value;

  List<HomeOption> get rechargeOptions => [
        HomeOption(
          title: "Historial de recargas",
          icon: FontAwesomeIcons.clockRotateLeft,
          onTap: (context) {
            Get.toNamed(DomiciliaryRoutes.domiciliaryHistoryPayment);
          },
        ),
        HomeOption(
          title: "Recargar saldo",
          icon: FontAwesomeIcons.creditCard,
          onTap: (context) {
            Get.toNamed(DomiciliaryRoutes.domiciliaryRechargeBalance);
          },
        ),
      ];

  List<PaymentMethod> get paymentMethods => [
        PaymentMethod(
          key: PaymentMethodType.nequi,
          name: "Nequi",
          icon: FontAwesomeIcons.mobileScreenButton,
          onTap: () async {
            final useCase = getIt<IRechargeBalanceUseCase>();
            return useCase.call(RechargeBalanceParams(
              amount: intAmount,
              userId: deliveryManProfile.uuid,
              paymentType: PaymentMethodType.nequi,
              numberPhone: intPhoneNumber,
            ));
          },
        ),
        PaymentMethod(
          key: PaymentMethodType.bancolombiaALaMano,
          name: "Bancolombia a la mano",
          icon: FontAwesomeIcons.mobileScreenButton,
          onTap: () async {
            final useCase = getIt<IRechargeBalanceUseCase>();
            return useCase.call(RechargeBalanceParams(
              amount: intAmount,
              userId: deliveryManProfile.uuid,
              paymentType: PaymentMethodType.bancolombiaALaMano,
              accountNumber: intPhoneNumber,
            ));
          },
        ),
      ];

  bool get isNequiPaymentMethod =>
      _paymentMethod.value.key == PaymentMethodType.nequi;

  bool get isBancolombiaPaymentMethod =>
      _paymentMethod.value.key == PaymentMethodType.bancolombiaALaMano;

  // ------------------------ Setters ---------------------

  set paymentMethod(PaymentMethod value) {
    _paymentMethod.value = value;
  }

  set amount(String value) {
    _amount.value = value;
  }

  set phoneNumber(String value) {
    _phoneNumber.value = value;
  }

  // ------------------------- Life Cycle ---------------------

  @override
  void onReady() {
    super.onReady();

    _fetchTermsAndConditions();
  }

  // --------------------------- Private Methods ---------------------

  void _fetchTermsAndConditions() {
    final useCase = getIt<IGetTermsAndConditionsUseCase>();
    useCase.call().then((value) {
      _paymentTermsAndConditions.value = value;
    });
  }

  // ------------------------- Public Methods ---------------------

  void rechargeBalance() {
    paymentMethod.onTap();
  }

  void showTermsAndConditions() {
    if (termsAndConditionsUrl.isNotEmpty) {
      Get.toNamed(DomiciliaryRoutes.domiciliaryTermsAndConditions, arguments: {
        "url": termsAndConditionsUrl,
      });
    }
  }
}
