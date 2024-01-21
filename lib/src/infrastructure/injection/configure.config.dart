// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:audioplayers/audioplayers.dart' as _i3;
import 'package:dio/dio.dart' as _i6;
import 'package:firebase_app_check/firebase_app_check.dart' as _i8;
import 'package:firebase_auth/firebase_auth.dart' as _i9;
import 'package:firebase_core/firebase_core.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:sqflite/sqflite.dart' as _i5;

import '../../../lib.dart' as _i4;
import '../../application/use_cases/authentication_use_case.dart' as _i32;
import '../../application/use_cases/bonification_use_case.dart' as _i28;
import '../../application/use_cases/delivery_man_use_cases.dart' as _i27;
import '../../application/use_cases/driver_request_use_cases.dart' as _i45;
import '../../application/use_cases/fetch_driver_request_use_cases.dart'
    as _i43;
import '../../application/use_cases/find_address_use_cases.dart' as _i26;
import '../../application/use_cases/find_file_use_cases.dart' as _i23;
import '../../application/use_cases/payment_history_use_case.dart' as _i30;
import '../../application/use_cases/profile_use_case.dart' as _i38;
import '../../application/use_cases/recharge_balance_use_case.dart' as _i31;
import '../../application/use_cases/service_action_use_cases.dart' as _i16;
import '../../src.dart' as _i44;
import '../device/services/background_notification_service.dart' as _i12;
import '../device/services/find_file.dart' as _i22;
import '../device/services/image_picker.dart' as _i34;
import '../device/services/play_sound.dart' as _i35;
import '../device/services/url_launcher_call_service.dart' as _i14;
import '../device/services/whatsapp_chat_message.dart' as _i17;
import '../domain/services/call_client_service.dart' as _i41;
import '../domain/services/chat_client_service.dart' as _i18;
import '../firebase/repositories/firebase_delivery_man_profile_repository.dart'
    as _i21;
import '../firebase/repositories/firebase_user_repository.dart' as _i40;
import '../firebase/services/firebase_auth_service.dart' as _i11;
import '../firebase/services/firebase_delivery_man_profile_service.dart'
    as _i42;
import '../firebase/services/firebase_driver_request_service.dart' as _i10;
import '../firebase/services/firebase_finish_service_actions_service.dart'
    as _i20;
import '../firebase/services/firebase_profile_service.dart' as _i36;
import '../firebase/services/firebase_service_action_service.dart' as _i15;
import '../firebase/services/firebase_service_driver_action_service.dart'
    as _i33;
import '../firebase/services/firebase_upload_file_service.dart' as _i39;
import '../firebase/services/firebase_user_bonification_service.dart' as _i19;
import '../google/services/google_find_address_service.dart' as _i25;
import '../recharge_balance/services/http_payment_history_service.dart' as _i29;
import '../recharge_balance/services/http_recharge_balance_service.dart'
    as _i13;
import '../sqflite/repositories/sqflite_travel_point_repository.dart' as _i37;
import '../sqflite/services/find_known_address_service.dart' as _i46;
import '../uuid/generate_uuid_service.dart' as _i24;
import 'dependecies.dart' as _i47;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final audioPlayerModule = _$AudioPlayerModule();
    final cameraModule = _$CameraModule();
    final databaseModule = _$DatabaseModule();
    final dioModule = _$DioModule();
    final facebookAuthModule = _$FacebookAuthModule();
    final firebaseAppModule = _$FirebaseAppModule();
    final appCheckModule = _$AppCheckModule();
    final firebaseAuthModule = _$FirebaseAuthModule();
    final firestoreModule = _$FirestoreModule();
    final firebaseStorageModule = _$FirebaseStorageModule();
    final flutterLocalNotificationModule = _$FlutterLocalNotificationModule();
    final googleSignInModule = _$GoogleSignInModule();
    final paymentModuleServicesModule = _$PaymentModuleServicesModule();
    gh.lazySingleton<_i3.AudioPlayer>(() => audioPlayerModule.audioPlayer);
    await gh.lazySingletonAsync<_i4.CameraDescription>(
      () => cameraModule.camera,
      preResolve: true,
    );
    await gh.lazySingletonAsync<_i5.Database>(
      () => databaseModule.database,
      preResolve: true,
    );
    gh.lazySingleton<_i6.Dio>(() => dioModule.dio);
    await gh.lazySingletonAsync<_i4.FacebookAuth>(
      () => facebookAuthModule.facebookAuth,
      preResolve: true,
    );
    await gh.factoryAsync<_i7.FirebaseApp>(
      () => firebaseAppModule.firebaseApp,
      preResolve: true,
    );
    await gh.factoryAsync<_i7.FirebaseApp>(
      () => firebaseAppModule.firebaseAppForPasswordReset,
      instanceName: 'FirebaseAppForPasswordReset',
      preResolve: true,
    );
    await gh.lazySingletonAsync<_i8.FirebaseAppCheck>(
      () => appCheckModule.appCheck,
      preResolve: true,
    );
    await gh.lazySingletonAsync<_i9.FirebaseAuth>(
      () => firebaseAuthModule.firebaseAuthForPasswordReset,
      instanceName: 'FirebaseAuthForPasswordReset',
      preResolve: true,
    );
    await gh.lazySingletonAsync<_i9.FirebaseAuth>(
      () => firebaseAuthModule.firebaseAuth,
      preResolve: true,
    );
    await gh.lazySingletonAsync<_i4.FirebaseFirestore>(
      () => firestoreModule.firestore,
      preResolve: true,
    );
    await gh.lazySingletonAsync<_i4.FirebaseStorage>(
      () => firebaseStorageModule.firebaseStorage,
      preResolve: true,
    );
    await gh.lazySingletonAsync<_i4.FlutterLocalNotificationsPlugin>(
      () => flutterLocalNotificationModule.flutterLocalNotificationsPlugin,
      preResolve: true,
    );
    await gh.lazySingletonAsync<_i4.GoogleSignIn>(
      () => googleSignInModule.googleSignIn,
      preResolve: true,
    );
    await gh.lazySingletonAsync<_i4.HttpGetTokenService>(
      () => paymentModuleServicesModule.httpGetTokenService,
      preResolve: true,
    );
    gh.factory<_i4.IAboutCarSectionService>(() =>
        _i10.FirebaseAboutCarSectionService(
            firebaseFirestore: gh<_i4.FirebaseFirestore>()));
    gh.factory<_i4.IAboutMeSectionService>(() =>
        _i10.FirebaseAboutMeSectionService(
            firebaseFirestore: gh<_i4.FirebaseFirestore>()));
    gh.factory<_i4.IAuthenticationService>(
        () => _i11.FirebaseAuthService(firebaseAuth: gh<_i9.FirebaseAuth>()));
    gh.factory<_i4.IBackgroundNotificationService>(() =>
        _i12.BackgroundNotificationService(
            flutterLocalNotificationsPlugin:
                gh<_i4.FlutterLocalNotificationsPlugin>()));
    gh.factory<_i4.IBalancePaymentService>(
        () => _i13.HttpRechargeBalanceService(
              dio: gh<_i6.Dio>(),
              getTokenService: gh<_i4.HttpGetTokenService>(),
            ));
    gh.lazySingleton<_i4.ICallService>(() => _i14.UrlLauncherCallService());
    gh.factory<_i4.IChangeRequestServiceOfferService>(() =>
        _i15.FirebaseChangeRequestServiceOfferService(
            firestore: gh<_i4.FirebaseFirestore>()));
    gh.factory<_i4.IChangeRequestServiceOfferUseCase>(() =>
        _i16.ChangeRequestServiceOfferUseCase(
            changeRequestServiceOfferService:
                gh<_i4.IChangeRequestServiceOfferService>()));
    gh.lazySingleton<_i4.IChatService>(() => _i17.WhatsappChatMessageService());
    gh.factory<_i4.IChatWithClientService>(
        () => _i18.ChatWithClientService(gh<_i4.IChatService>()));
    gh.factory<_i4.IChatWithClientUseCase>(() => _i16.ChatWithClientUseCase(
        chatWithClientService: gh<_i4.IChatWithClientService>()));
    gh.factory<_i4.IClientPointsService>(() => _i19.FirebaseClientPointsService(
        firebaseFirestore: gh<_i4.FirebaseFirestore>()));
    gh.factory<_i4.IConsultServiceConfigurationService>(() =>
        _i20.FirebaseConsultServiceConfigurationService(
            firestore: gh<_i4.FirebaseFirestore>()));
    gh.factory<_i4.IDNISectionService>(() => _i10.FirebaseDNISectionService(
        firebaseFirestore: gh<_i4.FirebaseFirestore>()));
    gh.factory<_i4.IDeliveryManProfileRepository>(() =>
        _i21.FirebaseDeliveryMnaProfileRepository(gh<_i4.FirebaseFirestore>()));
    gh.factory<_i4.IDriverBalanceService>(() =>
        _i19.FirebaseDriverBalanceService(
            firebaseFirestore: gh<_i4.FirebaseFirestore>()));
    gh.factory<_i4.IDriverLicenseSectionService>(() =>
        _i10.FirebaseDriverLicenseSectionService(
            firebaseFirestore: gh<_i4.FirebaseFirestore>()));
    gh.factory<_i4.IDriverPaymentService>(() =>
        _i20.FirebaseDriverPaymentService(
          firebaseFirestore: gh<_i4.FirebaseFirestore>(),
          driverBalanceService: gh<_i4.IDriverBalanceService>(),
          configurationService: gh<_i4.IConsultServiceConfigurationService>(),
        ));
    gh.factory<_i4.IFacebookAuthenticationService>(
        () => _i11.FirebaseFacebookAuthenticationService(
              firebaseAuth: gh<_i9.FirebaseAuth>(),
              facebookLogin: gh<_i4.FacebookAuth>(),
            ));
    gh.factory<_i4.IFileSearchService>(() => _i22.FindFileService());
    gh.factory<_i4.IFindFileUseCase>(
        () => _i23.FindFileUseCase(gh<_i4.IFileSearchService>()));
    gh.factory<_i4.IFinishDriverRequestService>(() =>
        _i10.FirebaseFinishDriverRequestService(
            firebaseFirestore: gh<_i4.FirebaseFirestore>()));
    gh.factory<_i4.IGenerateUuid>(() => _i24.GenerateUuidService());
    gh.factory<_i4.IGetAddressByGeopointService>(
        () => _i25.GoogleGetAddressByGeopointService(gh<_i6.Dio>()));
    gh.factory<_i4.IGetAddressByGeopointUseCase>(() =>
        _i26.GetMyAddressByGeopointUseCase(
            gh<_i4.IGetAddressByGeopointService>()));
    gh.factory<_i4.IGetAddressByQueryService>(
        () => _i25.GoogleFindAddressService(gh<_i6.Dio>()));
    gh.factory<_i4.IGetAddressesByQueryUseCase>(() =>
        _i26.GetAddressesByQueryUseCase(gh<_i4.IGetAddressByQueryService>()));
    gh.factory<_i4.IGetDeliveryManProfileUseCase>(() =>
        _i27.GetDeliveryManProfileUseCase(
            gh<_i4.IDeliveryManProfileRepository>()));
    gh.factory<_i4.IGetDriverLocationService>(() =>
        _i15.FirebaseGetDriverLocationService(
            firestore: gh<_i4.FirebaseFirestore>()));
    gh.factory<_i4.IGetDriverRequestService>(() =>
        _i10.FirebaseGetDriverRequestService(
            firebaseFirestore: gh<_i4.FirebaseFirestore>()));
    gh.factory<_i4.IGetMyPointsUseCase>(
        () => _i28.GetMyPointsUseCase(gh<_i4.IClientPointsService>()));
    gh.factory<_i4.IGetPaymentHistoryService>(
        () => _i29.HttpGetPaymentHistoryService(
              dio: gh<_i6.Dio>(),
              getTokenService: gh<_i4.HttpGetTokenService>(),
            ));
    gh.factory<_i4.IGetPaymentHistoryUseCase>(() =>
        _i30.GetPaymenHistoryUseCase(gh<_i4.IGetPaymentHistoryService>()));
    gh.factory<_i4.IGetServiceCommonOffertsUseCase>(() =>
        _i16.GetServiceCommonOffertsUseCase(
            configurationService:
                gh<_i4.IConsultServiceConfigurationService>()));
    gh.factory<_i4.IGetTermsAndConditionsUseCase>(() =>
        _i31.GetTermsAndConditionsUseCase(
            balancePaymentService: gh<_i4.IBalancePaymentService>()));
    gh.factory<_i4.IGoogleAuthenticationService>(
        () => _i11.FirebaseGoogleAuthenticationService(
              firebaseAuth: gh<_i9.FirebaseAuth>(),
              googleSignIn: gh<_i4.GoogleSignIn>(),
            ));
    gh.factory<_i4.IListenAuthenticationUseCase>(() =>
        _i32.ListenAuthenticationUseCase(gh<_i4.IAuthenticationService>()));
    gh.factory<_i4.IListenDriverLocationUseCase>(() =>
        _i16.ListenDriverLocationUseCase(
            getDriverLocationService: gh<_i4.IGetDriverLocationService>()));
    gh.factory<_i4.IListenMyBalanceUseCase>(
        () => _i28.ListenMyBalanceUseCase(gh<_i4.IDriverBalanceService>()));
    gh.factory<_i4.IListenMyPointsUseCase>(
        () => _i28.ListenMyPointsUseCase(gh<_i4.IClientPointsService>()));
    gh.factory<_i4.ILoginWithFacebookUseCase>(() =>
        _i32.LoginWithFacebookUseCase(
            gh<_i4.IFacebookAuthenticationService>()));
    gh.factory<_i4.ILoginWithGoogleUseCase>(() =>
        _i32.LoginWithGoogleUseCase(gh<_i4.IGoogleAuthenticationService>()));
    gh.factory<_i4.ILogoutUseCase>(
        () => _i32.LogoutUseCase(gh<_i4.IAuthenticationService>()));
    gh.factory<_i4.IMarkAsViewedRequestServiceService>(() =>
        _i33.FirebaseMarkAsViewedRequestServiceService(
            firebaseFirestore: gh<_i4.FirebaseFirestore>()));
    gh.factory<_i4.IMarkAsViewedRequestServiceUseCase>(() =>
        _i16.MarkAsViewedRequestServiceUseCase(
            markAsViewedRequestServiceService:
                gh<_i4.IMarkAsViewedRequestServiceService>()));
    gh.factory<_i4.INoCriminalRecordSectionService>(() =>
        _i10.FirebaseNoCriminalRecordSectionService(
            firebaseFirestore: gh<_i4.FirebaseFirestore>()));
    gh.factory<_i4.IOwnerShipCardSectionService>(() =>
        _i10.FirebaseOwnerShipSectionService(
            firebaseFirestore: gh<_i4.FirebaseFirestore>()));
    gh.factory<_i4.IPickImage>(() => _i34.CroppPickImageUtility());
    gh.factory<_i4.IPlaySound>(() => _i35.AudioPlayerPlaySound());
    gh.factory<_i4.IProfileAvatarService>(
        () => _i36.FirebaseProfileAvatarService(
              firestore: gh<_i4.FirebaseFirestore>(),
              storage: gh<_i4.FirebaseStorage>(),
              pickImage: gh<_i4.IPickImage>(),
            ));
    gh.factory<_i4.IProfileLocationService>(() =>
        _i36.FirebaseProfileService(firestore: gh<_i4.FirebaseFirestore>()));
    gh.factory<_i4.IRechargeBalanceUseCase>(() => _i31.RechargeBalanceUseCase(
        balancePaymentService: gh<_i4.IBalancePaymentService>()));
    gh.factory<_i4.ISendDriverRequestService>(() =>
        _i10.FirebaseSendDriverRequestService(
            firebaseFirestore: gh<_i4.FirebaseFirestore>()));
    gh.factory<_i4.IServiceActionService>(() =>
        _i15.FirebaseServiceActionService(
            firestore: gh<_i4.FirebaseFirestore>()));
    gh.factory<_i4.IServiceDriverActionService>(() =>
        _i33.FirebaseServiceDriverActionService(
            firebaseFirestore: gh<_i4.FirebaseFirestore>()));
    gh.factory<_i4.ISoatSectionService>(() => _i10.FirebaseSoatSectionService(
        firebaseFirestore: gh<_i4.FirebaseFirestore>()));
    gh.factory<_i4.ITechnicalReviewSectionService>(() =>
        _i10.FirebaseTechnicalReviewSectionService(
            firebaseFirestore: gh<_i4.FirebaseFirestore>()));
    gh.factory<_i4.ITravelPointRepository>(
        () => _i37.SqfliteTravelPointRepository(gh<_i5.Database>()));
    gh.factory<_i4.IUpdateDeliveryManProfileUseCase>(() =>
        _i27.UpdateDeliveryManProfileUseCase(
            gh<_i4.IDeliveryManProfileRepository>()));
    gh.factory<_i4.IUpdateProfileAvatarWithCameraUseCase>(() =>
        _i38.UpdateProfileAvatarWithCameraUseCase(
            profileAvatarService: gh<_i4.IProfileAvatarService>()));
    gh.factory<_i4.IUpdateProfileAvatarWithGalleryUseCase>(() =>
        _i38.UpdateProfileAvatarWithGalleryUseCase(
            profileAvatarService: gh<_i4.IProfileAvatarService>()));
    gh.factory<_i4.IUpdateProfileLocationDataUseCase>(() =>
        _i16.UpdateProfileLocationDataUseCase(
            profileService: gh<_i4.IProfileLocationService>()));
    gh.factory<_i4.IUploadFile>(() => _i39.FirebaseUploadFileService(
        firebaseStorage: gh<_i4.FirebaseStorage>()));
    gh.factory<_i4.IUserRepository>(() =>
        _i40.FirebaseUserRepository(firestore: gh<_i4.FirebaseFirestore>()));
    gh.factory<_i4.IAcceptCounterOfferUseCase>(() =>
        _i16.AcceptCounterOfferUseCase(
            serviceActionService: gh<_i4.IServiceActionService>()));
    gh.factory<_i4.IAcceptRequestServiceUseCase>(() =>
        _i16.AcceptRequestServiceUseCase(
            serviceActionService: gh<_i4.IServiceDriverActionService>()));
    gh.factory<_i4.ICallClientService>(
        () => _i41.CallClientService(gh<_i4.ICallService>()));
    gh.factory<_i4.ICallClientUseCase>(() => _i16.CallClientUseCase(
        callClientService: gh<_i4.ICallClientService>()));
    gh.factory<_i4.ICancelCounterOfferUseCase>(() =>
        _i16.CancelCounterOfferUseCase(
            serviceActionService: gh<_i4.IServiceActionService>()));
    gh.factory<_i4.ICancelRequestServiceUseCase>(() =>
        _i16.CancelRequestServiceUseCase(
            serviceActionService: gh<_i4.IServiceActionService>()));
    gh.factory<_i4.IClientBonificationService>(() =>
        _i20.FirebaseClientBonificationService(
          firebaseFirestore: gh<_i4.FirebaseFirestore>(),
          clientPointsService: gh<_i4.IClientPointsService>(),
          configurationService: gh<_i4.IConsultServiceConfigurationService>(),
        ));
    gh.factory<_i4.IDeleteProfileAvatarUseCase>(() =>
        _i38.DeleteProfileAvatarUseCase(
            profileAvatarService: gh<_i4.IProfileAvatarService>()));
    gh.factory<_i4.IDeliveryManProfileAvatarService>(
        () => _i42.FirebaseDeliveryManProfileService(
              firebaseFirestore: gh<_i4.FirebaseFirestore>(),
              firebaseStorage: gh<_i4.FirebaseStorage>(),
              pickImage: gh<_i4.IPickImage>(),
            ));
    gh.factory<_i4.IFetchDriverRequestUseCase>(() =>
        _i43.FetchDriverRequestUseCase(
            driverRequestService: gh<_i4.IGetDriverRequestService>()));
    gh.factory<_i44.IFinishDriverRequestUseCase>(
        () => _i45.FinishDriverRequestUseCase(
              driverRequestService: gh<_i44.IFinishDriverRequestService>(),
              userService: gh<_i44.IUserRepository>(),
            ));
    gh.factory<_i4.IGetKnownAddressesService>(() =>
        _i46.SqfliteGetKnownAddressesService(gh<_i4.ITravelPointRepository>()));
    gh.factory<_i4.IGetKnownAddressesUseCase>(() =>
        _i26.GetKnownAddressesUseCase(gh<_i4.IGetKnownAddressesService>()));
    gh.factory<_i4.IGetUserUseCase>(() => _i32.GetUserUseCase(
          authenticationService: gh<_i4.IAuthenticationService>(),
          userRepository: gh<_i4.IUserRepository>(),
        ));
    gh.factory<_i4.IListenAllRequestServiceUseCase>(() =>
        _i16.ListenAllRequestServiceUseCase(
            serviceActionService: gh<_i4.IServiceDriverActionService>()));
    gh.factory<_i4.IListenCurrentRequestServiceDriverUseCase>(() =>
        _i16.ListenCurrentRequestServiceDriverUseCase(
            serviceActionService: gh<_i4.IServiceDriverActionService>()));
    gh.factory<_i4.IListenCurrentRequestServiceUseCase>(() =>
        _i16.ListenCurrentRequestServiceUseCase(
            serviceActionService: gh<_i4.IServiceActionService>()));
    gh.factory<_i4.IListenRequestServiceCounterOffersUseCase>(() =>
        _i16.ListenRequestServiceCounterOffersUseCase(
            serviceActionService: gh<_i4.IServiceActionService>()));
    gh.factory<_i4.IRegisterWithFacebookUseCase>(
        () => _i32.RegisterWithFacebookUseCase(
              userService: gh<_i4.IUserRepository>(),
              authenticationService: gh<_i4.IAuthenticationService>(),
              facebookAuthenticationService:
                  gh<_i4.IFacebookAuthenticationService>(),
            ));
    gh.factory<_i4.IRegisterWithGoogleUseCase>(() =>
        _i32.RegisterWithGoogleUseCase(
          userService: gh<_i4.IUserRepository>(),
          authenticationService: gh<_i4.IAuthenticationService>(),
          googleAuthenticationService: gh<_i4.IGoogleAuthenticationService>(),
        ));
    gh.factory<_i4.ISaveAddressService>(
        () => _i46.SqfliteSaveAddressService(gh<_i4.ITravelPointRepository>()));
    gh.factory<_i4.ISaveAddressUseCase>(
        () => _i26.SaveAddressUseCase(gh<_i4.ISaveAddressService>()));
    gh.factory<_i44.ISendAboutCarSectionUseCase>(
        () => _i45.SendAboutCarSectionUseCase(
              aboutCarSectionService: gh<_i44.IAboutCarSectionService>(),
              userService: gh<_i44.IUserRepository>(),
              uploadFile: gh<_i44.IUploadFile>(),
            ));
    gh.factory<_i44.ISendAboutMeSectionUseCase>(
        () => _i45.SendAboutMeSectionUseCase(
              aboutMeSectionService: gh<_i44.IAboutMeSectionService>(),
              userService: gh<_i44.IUserRepository>(),
              uploadFile: gh<_i44.IUploadFile>(),
            ));
    gh.factory<_i4.ISendCounterOfferUseCase>(() => _i16.SendCounterOfferUseCase(
        serviceActionService: gh<_i4.IServiceDriverActionService>()));
    gh.factory<_i44.ISendDNISectionUseCase>(() => _i45.SendDNISectionUseCase(
          dniSectionService: gh<_i44.IDNISectionService>(),
          userService: gh<_i44.IUserRepository>(),
          uploadFile: gh<_i44.IUploadFile>(),
        ));
    gh.factory<_i44.ISendDriverLicenseSectionUseCase>(() =>
        _i45.SendDriverLicenseSectionUseCase(
          driverLicenseSectionService: gh<_i44.IDriverLicenseSectionService>(),
          userService: gh<_i44.IUserRepository>(),
          uploadFile: gh<_i44.IUploadFile>(),
        ));
    gh.factory<_i44.ISendDriverRequestUseCase>(
        () => _i45.SendDriverRequestUseCase(
              driverRequestService: gh<_i44.ISendDriverRequestService>(),
              userService: gh<_i44.IUserRepository>(),
            ));
    gh.factory<_i44.ISendNoCriminalRecordSectionUseCase>(
        () => _i45.SendNoCriminalRecordSectionUseCase(
              noCriminalRecordSectionService:
                  gh<_i44.INoCriminalRecordSectionService>(),
              userService: gh<_i44.IUserRepository>(),
              uploadFile: gh<_i44.IUploadFile>(),
            ));
    gh.factory<_i44.ISendOwnerShipCardSectionUseCase>(() =>
        _i45.SendOwnerShipCardSectionUseCase(
          ownerShipCardSectionService: gh<_i44.IOwnerShipCardSectionService>(),
          userService: gh<_i44.IUserRepository>(),
          uploadFile: gh<_i44.IUploadFile>(),
        ));
    gh.factory<_i4.ISendRequestServiceUseCase>(
        () => _i16.SendRequestServiceUseCase(
              serviceActionService: gh<_i4.IServiceActionService>(),
              generateUuid: gh<_i4.IGenerateUuid>(),
            ));
    gh.factory<_i44.ISendSoatSectionUseCase>(() => _i45.SendSoatSectionUseCase(
          soatSectionService: gh<_i44.ISoatSectionService>(),
          userService: gh<_i44.IUserRepository>(),
          uploadFile: gh<_i44.IUploadFile>(),
        ));
    gh.factory<_i44.ISendTechnicalReviewSectionUseCase>(
        () => _i45.SendTechnicalReviewSectionUseCase(
              technicalReviewSectionService:
                  gh<_i44.ITechnicalReviewSectionService>(),
              userService: gh<_i44.IUserRepository>(),
              uploadFile: gh<_i44.IUploadFile>(),
            ));
    gh.factory<_i4.IServiceFinishDriverActionService>(
        () => _i33.FirebaseServiceFinishDriverActionService(
              firebaseFirestore: gh<_i4.FirebaseFirestore>(),
              clientBoniticationService: gh<_i4.IClientBonificationService>(),
              driverPaymentService: gh<_i4.IDriverPaymentService>(),
            ));
    gh.factory<_i4.IUpdateDeliveryManProfileAvatarFromCameraUseCase>(() =>
        _i27.UpdateDeliveryManProfileAvatarFromCameraUseCase(
            gh<_i4.IDeliveryManProfileAvatarService>()));
    gh.factory<_i4.IUpdateDeliveryManProfileAvatarFromGalleryUseCase>(() =>
        _i27.UpdateDeliveryManProfileAvatarFromGalleryUseCase(
            gh<_i4.IDeliveryManProfileAvatarService>()));
    gh.factory<_i4.IUpdateProfileUseCase>(() =>
        _i38.UpdateProfileUseCase(userRepository: gh<_i4.IUserRepository>()));
    gh.factory<_i4.IDeleteDeliveryManProfileAvatarUseCase>(() =>
        _i27.DeleteDeliveryManProfileAvatarUseCase(
            gh<_i4.IDeliveryManProfileAvatarService>()));
    gh.factory<_i4.IFinishServiceDriverUseCase>(() =>
        _i16.FinishServiceDriverUseCase(
            serviceActionService: gh<_i4.IServiceFinishDriverActionService>()));
    return this;
  }
}

class _$AudioPlayerModule extends _i47.AudioPlayerModule {}

class _$CameraModule extends _i47.CameraModule {}

class _$DatabaseModule extends _i47.DatabaseModule {}

class _$DioModule extends _i47.DioModule {}

class _$FacebookAuthModule extends _i47.FacebookAuthModule {}

class _$FirebaseAppModule extends _i47.FirebaseAppModule {}

class _$AppCheckModule extends _i47.AppCheckModule {}

class _$FirebaseAuthModule extends _i47.FirebaseAuthModule {}

class _$FirestoreModule extends _i47.FirestoreModule {}

class _$FirebaseStorageModule extends _i47.FirebaseStorageModule {}

class _$FlutterLocalNotificationModule
    extends _i47.FlutterLocalNotificationModule {}

class _$GoogleSignInModule extends _i47.GoogleSignInModule {}

class _$PaymentModuleServicesModule extends _i47.PaymentModuleServicesModule {}
