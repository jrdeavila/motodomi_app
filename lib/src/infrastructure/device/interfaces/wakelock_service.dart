abstract interface class IWakelockService {
  Future<void> enable();

  Future<void> disable();

  Stream<bool> get wakelockStream;

  void dispose();

  Future<void> init();
}
