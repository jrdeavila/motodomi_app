import 'package:motodomi_app/lib.dart';

DeliveryManProfile deliveryManFromJson(Map<String, dynamic> json) =>
    DeliveryManProfile(
      uuid: json["uuid"],
      driverRequestUuid: json["driver_request_uuid"],
      carInfo: carInfofromJson(json["car_info"]),
      firstName: json["first_name"],
      lastName: json["last_name"],
      phone: json["phone"],
      code: json["code"],
      profileImage: json["profile_image"],
      email: json["email"],
    );

Map<String, dynamic> deliveryManProfileToJson(
        DeliveryManProfile deliveryManProfile) =>
    {
      "uuid": deliveryManProfile.uuid,
      "driver_request_uuid": deliveryManProfile.driverRequestUuid,
      "car_info": carInfoToJson(deliveryManProfile.carInfo),
      "first_name": deliveryManProfile.firstName,
      "last_name": deliveryManProfile.lastName,
      "phone": deliveryManProfile.phone,
      "code": deliveryManProfile.code,
      "profile_image": deliveryManProfile.profileImage,
      "email": deliveryManProfile.email,
    };
CarInfo carInfofromJson(Map<String, dynamic> json) => CarInfo(
      carBrand: json["car_brand"],
      carImage: json["car_image"],
      carModel: json["car_model"],
      carPlate: json["car_plate"],
    );

Map<String, dynamic> carInfoToJson(CarInfo carInfo) => {
      "car_brand": carInfo.carBrand,
      "car_image": carInfo.carImage,
      "car_model": carInfo.carModel,
      "car_plate": carInfo.carPlate,
    };
