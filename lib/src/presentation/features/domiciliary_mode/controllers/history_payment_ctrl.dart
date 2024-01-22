import 'package:motodomi_app/lib.dart';

class HistoryPaymentCtrl extends GetxController {
  // ---------------------- Properties ----------------------

  final DeliveryManProfile deliveryManProfile;

  // ---------------------- Constructor ----------------------

  HistoryPaymentCtrl({required this.deliveryManProfile});

  // ---------------------- Observables ----------------------

  final RxList<PaymentHistory> _paymentHistory = RxList<PaymentHistory>([]);
  final RxBool _isLoading = false.obs;

  // --------------------- Getters ---------------------

  Map<DateTime, List<PaymentHistory>> get paymentHistoryGroupedByDate {
    final paymentHistory = _paymentHistory.toList();
    paymentHistory.sort((a, b) => a.reference.compareTo(b.reference));
    final groupedByDateMap = <String, List<PaymentHistory>>{};

    for (final payment in paymentHistory) {
      final date = payment.reference.split('-');
      final dateKey = '${date[0]}-${date[1]}-${date[2]}';

      if (groupedByDateMap.containsKey(dateKey)) {
        groupedByDateMap[dateKey]!.add(payment);
      } else {
        groupedByDateMap[dateKey] = [payment];
      }
    }

    final groupedByDate = <DateTime, List<PaymentHistory>>{};
    groupedByDateMap.forEach((key, value) {
      final date = key.split('-');
      groupedByDate[DateTime(
        int.parse(date[0]),
        int.parse(date[1]),
        int.parse(date[2]),
      )] = value;
    });
    return groupedByDate;
  }

  bool get isLoading => _isLoading.value;

  // --------------------- Life cycle ---------------------

  @override
  void onInit() {
    super.onInit();
    _fetchPaymentHistory();
  }

  @override
  void onClose() {
    super.onClose();
    _paymentHistory.close();
  }

  // ------------------- Private methods ------------------

  void _fetchPaymentHistory() {
    _isLoading.value = true;
    getIt<IGetPaymentHistoryUseCase>()
        .get(deliveryManProfile)
        .then((value) => _paymentHistory.addAll(value))
        .onError((error, stackTrace) {
      _isLoading.value = false;
      throw error as Exception;
    }).whenComplete(() => _isLoading.value = false);
  }

  // ------------------- Public methods ------------------
}
