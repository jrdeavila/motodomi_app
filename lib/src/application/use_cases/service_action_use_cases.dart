import 'package:injectable/injectable.dart';
import 'package:motodomi_app/lib.dart';

@Injectable(as: ISendRequestServiceUseCase)
class SendRequestServiceUseCase implements ISendRequestServiceUseCase {
  final IServiceActionService _serviceActionService;
  final IGenerateUuid _generateUuid;

  SendRequestServiceUseCase({
    required IServiceActionService serviceActionService,
    required IGenerateUuid generateUuid,
  })  : _serviceActionService = serviceActionService,
        _generateUuid = generateUuid;
  @override
  Future<void> sendRequestService(SendRequestServiceRequest request) {
    final requestService = RequestService(
      uuid: _generateUuid.generate(),
      clientCreator: request.clientCreator,
      origin: request.origin,
      destination: request.destination,
      payment: request.payment,
      tee: request.tee,
      deliveryManProfile: request.deliveryManProfile,
    );

    return _serviceActionService.sendRequestService(requestService);
  }
}

@Injectable(as: ICancelRequestServiceUseCase)
class CancelRequestServiceUseCase implements ICancelRequestServiceUseCase {
  final IServiceActionService _serviceActionService;

  CancelRequestServiceUseCase({
    required IServiceActionService serviceActionService,
  }) : _serviceActionService = serviceActionService;
  @override
  Future<void> cancelRequestService(CancelRequestServiceRequest request) {
    return _serviceActionService.cancelRequestService(request.requestService);
  }
}

@Injectable(as: IListenCurrentRequestServiceUseCase)
class ListenCurrentRequestServiceUseCase
    implements IListenCurrentRequestServiceUseCase {
  final IServiceActionService _serviceActionService;

  ListenCurrentRequestServiceUseCase({
    required IServiceActionService serviceActionService,
  }) : _serviceActionService = serviceActionService;
  @override
  Stream<RequestService?> listen(ListenCurrentRequestServiceRequest request) {
    return _serviceActionService.listenCurrentRequestService(request.user);
  }
}

@Injectable(as: IListenDriverLocationUseCase)
class ListenDriverLocationUseCase implements IListenDriverLocationUseCase {
  final IGetDriverLocationService _getDriverLocationService;

  ListenDriverLocationUseCase({
    required IGetDriverLocationService getDriverLocationService,
  }) : _getDriverLocationService = getDriverLocationService;

  @override
  Stream<DriverLocation?> listen(ListenDriverLocationRequest request) {
    return _getDriverLocationService.listen(request.driver);
  }
}

@Injectable(as: IListenRequestServiceCounterOffersUseCase)
class ListenRequestServiceCounterOffersUseCase
    implements IListenRequestServiceCounterOffersUseCase {
  final IServiceActionService _serviceActionService;

  ListenRequestServiceCounterOffersUseCase({
    required IServiceActionService serviceActionService,
  }) : _serviceActionService = serviceActionService;
  @override
  Stream<List<RequestService>> listen(
      ListenRequestServiceCounterOffersRequest request) {
    return _serviceActionService
        .getRequestServiceCounterOffers(request.requestService);
  }
}

@Injectable(as: IAcceptCounterOfferUseCase)
class AcceptCounterOfferUseCase implements IAcceptCounterOfferUseCase {
  final IServiceActionService _serviceActionService;

  AcceptCounterOfferUseCase({
    required IServiceActionService serviceActionService,
  }) : _serviceActionService = serviceActionService;
  @override
  Future<void> acceptCounterOffer(AcceptCounterOfferRequest request) {
    return _serviceActionService.acceptCounterOffer(
      request.requestService,
      request.offer,
    );
  }
}

@Injectable(as: ICancelCounterOfferUseCase)
class CancelCounterOfferUseCase implements ICancelCounterOfferUseCase {
  final IServiceActionService _serviceActionService;

  CancelCounterOfferUseCase({
    required IServiceActionService serviceActionService,
  }) : _serviceActionService = serviceActionService;
  @override
  Future<void> cancelCounterOffer(CancelCounterOfferRequest request) {
    return _serviceActionService.cancelCounterOffer(
      request.requestService,
      request.offer,
    );
  }
}

// ------------------------------ Driver ------------------------------

@Injectable(as: IListenAllRequestServiceUseCase)
class ListenAllRequestServiceUseCase
    implements IListenAllRequestServiceUseCase {
  final IServiceDriverActionService _serviceActionService;

  ListenAllRequestServiceUseCase({
    required IServiceDriverActionService serviceActionService,
  }) : _serviceActionService = serviceActionService;
  @override
  Stream<List<RequestService>> listen(ListenAllRequestServiceRequest request) {
    return _serviceActionService
        .listenAllRequestService(request.deliveryManProfile);
  }
}

@Injectable(as: IAcceptRequestServiceUseCase)
class AcceptRequestServiceUseCase implements IAcceptRequestServiceUseCase {
  final IServiceDriverActionService _serviceActionService;

  AcceptRequestServiceUseCase({
    required IServiceDriverActionService serviceActionService,
  }) : _serviceActionService = serviceActionService;
  @override
  Future<void> acceptRequestService(AcceptRequestServiceRequest request) {
    return _serviceActionService.acceptRequestService(
      request.requestService,
      request.deliveryManProfile,
    );
  }
}

@Injectable(as: ISendCounterOfferUseCase)
class SendCounterOfferUseCase implements ISendCounterOfferUseCase {
  final IServiceDriverActionService _serviceActionService;

  SendCounterOfferUseCase({
    required IServiceDriverActionService serviceActionService,
  }) : _serviceActionService = serviceActionService;
  @override
  Future<void> sendCounterOffer(SendCounterOfferRequest request) {
    final counterOffer = request.requestService;
    counterOffer.deliveryManProfile = request.deliveryManProfile;
    counterOffer.tee = request.counterOffer;

    return _serviceActionService.sendCounterOffer(
      request.requestService,
      counterOffer,
      request.deliveryManProfile,
    );
  }
}

@Injectable(as: IListenCurrentRequestServiceDriverUseCase)
class ListenCurrentRequestServiceDriverUseCase
    implements IListenCurrentRequestServiceDriverUseCase {
  final IServiceDriverActionService _serviceActionService;

  ListenCurrentRequestServiceDriverUseCase({
    required IServiceDriverActionService serviceActionService,
  }) : _serviceActionService = serviceActionService;
  @override
  Stream<RequestService?> listen(
      ListenCurrentRequestServiceDriverRequest request) {
    return _serviceActionService
        .listenCurrentRequestService(request.deliveryManProfile);
  }
}

@Injectable(as: IUpdateProfileLocationDataUseCase)
class UpdateProfileLocationDataUseCase
    implements IUpdateProfileLocationDataUseCase {
  final IProfileLocationService _profileService;

  UpdateProfileLocationDataUseCase({
    required IProfileLocationService profileService,
  }) : _profileService = profileService;
  @override
  Future<void> updateProfileData(UpdateProfileLocationDataRequest request) {
    return _profileService.updateProfileLocationData(
      request.user,
      latitude: request.latitude,
      longitude: request.longitude,
    );
  }
}

@Injectable(as: IFinishServiceDriverUseCase)
class FinishServiceDriverUseCase implements IFinishServiceDriverUseCase {
  final IServiceFinishDriverActionService _serviceActionService;

  FinishServiceDriverUseCase({
    required IServiceFinishDriverActionService serviceActionService,
  }) : _serviceActionService = serviceActionService;
  @override
  Future<void> finish(FinishServiceDriverRequest request) {
    return _serviceActionService.finish(request.requestService);
  }
}

@Injectable(as: IGetServiceCommonOffertsUseCase)
class GetServiceCommonOffertsUseCase
    implements IGetServiceCommonOffertsUseCase {
  final IConsultServiceConfigurationService _configurationService;

  GetServiceCommonOffertsUseCase({
    required IConsultServiceConfigurationService configurationService,
  }) : _configurationService = configurationService;

  @override
  Future<List<ServiceCommonOffert>> get() {
    return _configurationService.get().then((value) {
      final offerts = value.commonOfferts;
      offerts.sort((a, b) => a.uses.compareTo(b.uses));
      // Get only first 9 elements
      return offerts.take(9).toList();
    });
  }
}

@Injectable(as: IMarkAsViewedRequestServiceUseCase)
class MarkAsViewedRequestServiceUseCase
    implements IMarkAsViewedRequestServiceUseCase {
  final IMarkAsViewedRequestServiceService _markAsViewedRequestServiceService;

  MarkAsViewedRequestServiceUseCase({
    required IMarkAsViewedRequestServiceService
        markAsViewedRequestServiceService,
  }) : _markAsViewedRequestServiceService = markAsViewedRequestServiceService;

  @override
  Future<void> markAsViewed(MarkAsViewedRequest request) {
    return _markAsViewedRequestServiceService.markAsViewed(
        request.requestService, request.driver);
  }
}

@Injectable(as: IChangeRequestServiceOfferUseCase)
class ChangeRequestServiceOfferUseCase
    implements IChangeRequestServiceOfferUseCase {
  final IChangeRequestServiceOfferService _changeRequestServiceOfferService;

  ChangeRequestServiceOfferUseCase({
    required IChangeRequestServiceOfferService changeRequestServiceOfferService,
  }) : _changeRequestServiceOfferService = changeRequestServiceOfferService;

  @override
  Future<void> changeRequestServiceOffer(
      ChangeRequestServiceOfferRequest request) {
    return _changeRequestServiceOfferService.changeRequestServiceOffer(
      request.requestService,
      request.offer,
    );
  }
}

@Injectable(as: ICallClientUseCase)
class CallClientUseCase implements ICallClientUseCase {
  final ICallClientService _callClientService;

  CallClientUseCase({
    required ICallClientService callClientService,
  }) : _callClientService = callClientService;

  @override
  Future<void> call(CallClientRequest request) {
    return _callClientService.call(request.client);
  }
}

@Injectable(as: IChatWithClientUseCase)
class ChatWithClientUseCase implements IChatWithClientUseCase {
  final IChatWithClientService _chatWithClientService;

  ChatWithClientUseCase({
    required IChatWithClientService chatWithClientService,
  }) : _chatWithClientService = chatWithClientService;

  @override
  Future<void> chat(ChatWithClientRequest request) {
    return _chatWithClientService.chat(request.client);
  }
}
