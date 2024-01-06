class DeliveryManProfile {
  String uuid;
  String driverRequestUuid;
  CarInfo carInfo;
  String firstName;
  String lastName;
  String phone;
  String code;
  String profileImage;
  String email;

  DeliveryManProfile({
    required this.uuid,
    required this.driverRequestUuid,
    required this.carInfo,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.code,
    required this.profileImage,
    required this.email,
  });
}

class CarInfo {
  String carBrand;
  String carImage;
  String carModel;
  String carPlate;

  CarInfo({
    required this.carBrand,
    required this.carImage,
    required this.carModel,
    required this.carPlate,
  });
}
