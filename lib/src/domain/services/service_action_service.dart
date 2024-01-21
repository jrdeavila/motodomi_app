import 'package:motodomi_app/lib.dart';

abstract class IServiceActionService {
  Future<void> sendRequestService(RequestService request);
  Future<void> cancelRequestService(RequestService request);
  Stream<RequestService?> listenCurrentRequestService(AppUser clientCreator);
  Future<void> acceptCounterOffer(
      RequestService requestService, RequestService counterOffer);
  Stream<List<RequestService>> getRequestServiceCounterOffers(
      RequestService requestService);

  Future<void> cancelCounterOffer(
      RequestService requestService, RequestService counterOffer);
}

abstract interface class IChangeRequestServiceOfferService {
  Future<void> changeRequestServiceOffer(
      RequestService requestService, double offer);
}

// -------------------------------- Driver --------------------------------

abstract class IServiceDriverActionService {
  Stream<List<RequestService>> listenAllRequestService(
      DeliveryManProfile driver);

  Future<void> acceptRequestService(
      RequestService requestService, DeliveryManProfile driver);

  Future<void> sendCounterOffer(RequestService requestService,
      RequestService counterOffer, DeliveryManProfile driver);

  Stream<RequestService?> listenCurrentRequestService(
      DeliveryManProfile driver);
}

abstract class IGetDriverLocationService {
  Stream<DriverLocation?> listen(AppUser driver);
}

abstract class IServiceFinishDriverActionService {
  Future<void> finish(RequestService requestService);
}

abstract class IMarkAsViewedRequestServiceService {
  Future<void> markAsViewed(RequestService requestService, AppUser driver);
}

abstract interface class IChatWithClientService {
  Future<void> chat(AppUser client);
}

abstract interface class ICallClientService {
  Future<void> call(AppUser client);
}
