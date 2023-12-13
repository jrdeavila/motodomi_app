import 'package:motodomi_app/lib.dart';

abstract class IGetPaymentsUseCase {
  Future<List<Payment>> get();
}
