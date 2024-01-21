import 'package:motodomi_app/lib.dart';

class GetMyPointsRequest {
  final AppUser user;

  GetMyPointsRequest(this.user);
}

class GetMyBalanceRequest {
  final DeliveryManProfile deliveryMapProfile;

  GetMyBalanceRequest(this.deliveryMapProfile);
}
