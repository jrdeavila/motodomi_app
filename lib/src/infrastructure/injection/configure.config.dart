// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:audioplayers/audioplayers.dart' as _i656;
import 'package:dio/dio.dart' as _i361;
import 'package:firebase_app_check/firebase_app_check.dart' as _i56;
import 'package:firebase_auth/firebase_auth.dart' as _i59;
import 'package:firebase_core/firebase_core.dart' as _i982;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:sqflite/sqflite.dart' as _i779;

import '../../../lib.dart' as _i608;
import '../../application/use_cases/authentication_use_case.dart' as _i377;
import '../../application/use_cases/bonification_use_case.dart' as _i233;
import '../../application/use_cases/brightness_use_case.dart' as _i162;
import '../../application/use_cases/delivery_man_use_cases.dart' as _i858;
import '../../application/use_cases/driver_request_use_cases.dart' as _i430;
import '../../application/use_cases/fetch_driver_request_use_cases.dart'
    as _i47;
import '../../application/use_cases/find_address_use_cases.dart' as _i700;
import '../../application/use_cases/find_file_use_cases.dart' as _i514;
import '../../application/use_cases/payment_history_use_case.dart' as _i974;
import '../../application/use_cases/profile_use_case.dart' as _i879;
import '../../application/use_cases/recharge_balance_use_case.dart' as _i795;
import '../../application/use_cases/service_action_use_cases.dart' as _i878;
import '../../application/use_cases/wakelock_use_case.dart' as _i502;
import '../../src.dart' as _i697;
import '../device/services/background_notification_service.dart' as _i315;
import '../device/services/brightness_service.dart' as _i697;
import '../device/services/find_file.dart' as _i958;
import '../device/services/image_picker.dart' as _i659;
import '../device/services/play_sound.dart' as _i208;
import '../device/services/url_launcher_call_service.dart' as _i59;
import '../device/services/wakelock_service.dart' as _i675;
import '../device/services/whatsapp_chat_message.dart' as _i666;
import '../domain/services/call_client_service.dart' as _i343;
import '../domain/services/chat_client_service.dart' as _i815;
import '../firebase/repositories/firebase_delivery_man_profile_repository.dart'
    as _i570;
import '../firebase/repositories/firebase_user_repository.dart' as _i173;
import '../firebase/services/firebase_auth_service.dart' as _i716;
import '../firebase/services/firebase_delivery_man_profile_service.dart'
    as _i653;
import '../firebase/services/firebase_driver_request_service.dart' as _i496;
import '../firebase/services/firebase_finish_service_actions_service.dart'
    as _i906;
import '../firebase/services/firebase_profile_service.dart' as _i105;
import '../firebase/services/firebase_service_action_service.dart' as _i499;
import '../firebase/services/firebase_service_driver_action_service.dart'
    as _i510;
import '../firebase/services/firebase_upload_file_service.dart' as _i105;
import '../firebase/services/firebase_user_bonification_service.dart' as _i6;
import '../google/services/google_find_address_service.dart' as _i819;
import '../recharge_balance/services/http_payment_history_service.dart' as _i8;
import '../recharge_balance/services/http_recharge_balance_service.dart'
    as _i158;
import '../sqflite/repositories/sqflite_travel_point_repository.dart' as _i477;
import '../sqflite/services/find_known_address_service.dart' as _i1043;
import '../uuid/generate_uuid_service.dart' as _i892;
import 'dependecies.dart' as _i1048;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final firebaseAppModule = _$FirebaseAppModule();
    final firebaseAuthModule = _$FirebaseAuthModule();
    final firestoreModule = _$FirestoreModule();
    final firebaseStorageModule = _$FirebaseStorageModule();
    final appCheckModule = _$AppCheckModule();
    final googleSignInModule = _$GoogleSignInModule();
    final facebookAuthModule = _$FacebookAuthModule();
    final dioModule = _$DioModule();
    final databaseModule = _$DatabaseModule();
    final audioPlayerModule = _$AudioPlayerModule();
    final flutterLocalNotificationModule = _$FlutterLocalNotificationModule();
    final cameraModule = _$CameraModule();
    final paymentModuleServicesModule = _$PaymentModuleServicesModule();
    final brightnessModule = _$BrightnessModule();
    await gh.lazySingletonAsync<_i982.FirebaseApp>(
      () => firebaseAppModule.firebaseApp,
      preResolve: true,
    );
    await gh.lazySingletonAsync<_i59.FirebaseAuth>(
      () => firebaseAuthModule.firebaseAuth,
      preResolve: true,
    );
    await gh.lazySingletonAsync<_i608.FirebaseFirestore>(
      () => firestoreModule.firestore,
      preResolve: true,
    );
    await gh.lazySingletonAsync<_i608.FirebaseStorage>(
      () => firebaseStorageModule.firebaseStorage,
      preResolve: true,
    );
    await gh.lazySingletonAsync<_i56.FirebaseAppCheck>(
      () => appCheckModule.appCheck,
      preResolve: true,
    );
    await gh.lazySingletonAsync<_i608.GoogleSignIn>(
      () => googleSignInModule.googleSignIn,
      preResolve: true,
    );
    await gh.lazySingletonAsync<_i608.FacebookAuth>(
      () => facebookAuthModule.facebookAuth,
      preResolve: true,
    );
    gh.lazySingleton<_i361.Dio>(() => dioModule.dio);
    await gh.lazySingletonAsync<_i779.Database>(
      () => databaseModule.database,
      preResolve: true,
    );
    gh.lazySingleton<_i656.AudioPlayer>(() => audioPlayerModule.audioPlayer);
    await gh.lazySingletonAsync<_i608.FlutterLocalNotificationsPlugin>(
      () => flutterLocalNotificationModule.flutterLocalNotificationsPlugin,
      preResolve: true,
    );
    await gh.lazySingletonAsync<_i608.CameraDescription>(
      () => cameraModule.camera,
      preResolve: true,
    );
    await gh.lazySingletonAsync<_i608.HttpGetTokenService>(
      () => paymentModuleServicesModule.httpGetTokenService,
      preResolve: true,
    );
    await gh.lazySingletonAsync<_i608.ScreenBrightness>(
      () => brightnessModule.brightnessService,
      preResolve: true,
    );
    gh.factory<_i608.IDeliveryManProfileRepository>(() =>
        _i570.FirebaseDeliveryManProfileRepository(
            gh<_i608.FirebaseFirestore>()));
    gh.factory<_i608.IBalancePaymentService>(
        () => _i158.HttpRechargeBalanceService(
              dio: gh<_i361.Dio>(),
              getTokenService: gh<_i608.HttpGetTokenService>(),
            ));
    gh.factory<_i608.ITechnicalReviewSectionService>(() =>
        _i496.FirebaseTechnicalReviewSectionService(
            firebaseFirestore: gh<_i608.FirebaseFirestore>()));
    gh.lazySingleton<_i608.ICallService>(() => _i59.UrlLauncherCallService());
    gh.factory<_i608.IServiceDriverActionService>(() =>
        _i510.FirebaseServiceDriverActionService(
            firebaseFirestore: gh<_i608.FirebaseFirestore>()));
    gh.factory<_i608.IMarkAsViewedRequestServiceService>(() =>
        _i510.FirebaseMarkAsViewedRequestServiceService(
            firebaseFirestore: gh<_i608.FirebaseFirestore>()));
    gh.factory<_i608.IDriverLicenseSectionService>(() =>
        _i496.FirebaseDriverLicenseSectionService(
            firebaseFirestore: gh<_i608.FirebaseFirestore>()));
    gh.factory<_i608.IPickImage>(() => _i659.CroppPickImageUtility());
    gh.lazySingleton<_i608.IChatService>(
        () => _i666.WhatsappChatMessageService());
    gh.factory<_i608.ISendDriverRequestService>(() =>
        _i496.FirebaseSendDriverRequestService(
            firebaseFirestore: gh<_i608.FirebaseFirestore>()));
    gh.factory<_i608.IDriverBalanceService>(() =>
        _i6.FirebaseDriverBalanceService(
            firebaseFirestore: gh<_i608.FirebaseFirestore>()));
    gh.factory<_i608.IDNISectionService>(() => _i496.FirebaseDNISectionService(
        firebaseFirestore: gh<_i608.FirebaseFirestore>()));
    gh.factory<_i608.IGetAddressByQueryService>(
        () => _i819.GoogleFindAddressService(gh<_i361.Dio>()));
    gh.factory<_i608.IOwnerShipCardSectionService>(() =>
        _i496.FirebaseOwnerShipSectionService(
            firebaseFirestore: gh<_i608.FirebaseFirestore>()));
    gh.factory<_i608.IGetPaymentHistoryService>(
        () => _i8.HttpGetPaymentHistoryService(
              dio: gh<_i361.Dio>(),
              getTokenService: gh<_i608.HttpGetTokenService>(),
            ));
    gh.lazySingleton<_i608.IWakelockService>(() => _i675.WakelockPlusService());
    gh.lazySingleton<_i608.IBrightnessService>(
        () => _i697.ScreenBrightnessService(gh<_i608.ScreenBrightness>()));
    gh.factory<_i608.IGetAddressByGeopointService>(
        () => _i819.GoogleGetAddressByGeopointService(gh<_i361.Dio>()));
    gh.factory<_i608.IAboutCarSectionService>(() =>
        _i496.FirebaseAboutCarSectionService(
            firebaseFirestore: gh<_i608.FirebaseFirestore>()));
    gh.factory<_i608.IDeliveryManProfileAvatarService>(
        () => _i653.FirebaseDeliveryManProfileService(
              firebaseFirestore: gh<_i608.FirebaseFirestore>(),
              firebaseStorage: gh<_i608.FirebaseStorage>(),
              pickImage: gh<_i608.IPickImage>(),
            ));
    gh.factory<_i608.IMarkAsViewedRequestServiceUseCase>(() =>
        _i878.MarkAsViewedRequestServiceUseCase(
            markAsViewedRequestServiceService:
                gh<_i608.IMarkAsViewedRequestServiceService>()));
    gh.factory<_i608.ISetTotalBrightnessUseCase>(
        () => _i162.SetTotalBrightnessUseCase(gh<_i608.IBrightnessService>()));
    gh.factory<_i608.IListenMyBalanceUseCase>(
        () => _i233.ListenMyBalanceUseCase(gh<_i608.IDriverBalanceService>()));
    gh.factory<_i608.IDeleteDeliveryManProfileAvatarUseCase>(() =>
        _i858.DeleteDeliveryManProfileAvatarUseCase(
            gh<_i608.IDeliveryManProfileAvatarService>()));
    gh.factory<_i608.IClientPointsService>(() =>
        _i6.FirebaseClientPointsService(
            firebaseFirestore: gh<_i608.FirebaseFirestore>()));
    gh.factory<_i608.IGenerateUuid>(() => _i892.GenerateUuidService());
    gh.factory<_i608.INoCriminalRecordSectionService>(() =>
        _i496.FirebaseNoCriminalRecordSectionService(
            firebaseFirestore: gh<_i608.FirebaseFirestore>()));
    gh.factory<_i608.ISoatSectionService>(() =>
        _i496.FirebaseSoatSectionService(
            firebaseFirestore: gh<_i608.FirebaseFirestore>()));
    gh.factory<_i608.IGetDriverRequestService>(() =>
        _i496.FirebaseGetDriverRequestService(
            firebaseFirestore: gh<_i608.FirebaseFirestore>()));
    gh.factory<_i608.IGoogleAuthenticationService>(
        () => _i716.FirebaseGoogleAuthenticationService(
              firebaseAuth: gh<_i59.FirebaseAuth>(),
              googleSignIn: gh<_i608.GoogleSignIn>(),
            ));
    gh.factory<_i608.IPlaySound>(() => _i208.AudioPlayerPlaySound());
    gh.factory<_i608.IFinishDriverRequestService>(() =>
        _i496.FirebaseFinishDriverRequestService(
            firebaseFirestore: gh<_i608.FirebaseFirestore>()));
    gh.factory<_i608.IAboutMeSectionService>(() =>
        _i496.FirebaseAboutMeSectionService(
            firebaseFirestore: gh<_i608.FirebaseFirestore>()));
    gh.factory<_i608.IFacebookAuthenticationService>(
        () => _i716.FirebaseFacebookAuthenticationService(
              firebaseAuth: gh<_i59.FirebaseAuth>(),
              facebookLogin: gh<_i608.FacebookAuth>(),
            ));
    gh.factory<_i608.IFileSearchService>(() => _i958.FindFileService());
    gh.factory<_i608.ILoginWithGoogleUseCase>(() =>
        _i377.LoginWithGoogleUseCase(gh<_i608.IGoogleAuthenticationService>()));
    gh.factory<_i608.IGetDeliveryManProfileUseCase>(() =>
        _i858.GetDeliveryManProfileUseCase(
            gh<_i608.IDeliveryManProfileRepository>()));
    gh.factory<_i608.IGetPaymentHistoryUseCase>(() =>
        _i974.GetPaymenHistoryUseCase(gh<_i608.IGetPaymentHistoryService>()));
    gh.factory<_i608.IChangeRequestServiceOfferService>(() =>
        _i499.FirebaseChangeRequestServiceOfferService(
            firestore: gh<_i608.FirebaseFirestore>()));
    gh.factory<_i608.IListenCurrentRequestServiceDriverUseCase>(() =>
        _i878.ListenCurrentRequestServiceDriverUseCase(
            serviceActionService: gh<_i608.IServiceDriverActionService>()));
    gh.factory<_i608.IUpdateDeliveryManProfileUseCase>(() =>
        _i858.UpdateDeliveryManProfileUseCase(
            gh<_i608.IDeliveryManProfileRepository>()));
    gh.factory<_i608.IEnableWakelockUseCase>(
        () => _i502.EnableWakelockUseCase(gh<_i608.IWakelockService>()));
    gh.factory<_i608.IUploadFile>(() => _i105.FirebaseUploadFileService(
        firebaseStorage: gh<_i608.FirebaseStorage>()));
    gh.factory<_i608.IAuthenticationService>(
        () => _i716.FirebaseAuthService(firebaseAuth: gh<_i59.FirebaseAuth>()));
    gh.factory<_i608.IFetchDriverRequestUseCase>(() =>
        _i47.FetchDriverRequestUseCase(
            driverRequestService: gh<_i608.IGetDriverRequestService>()));
    gh.factory<_i608.IGetAddressesByQueryUseCase>(() =>
        _i700.GetAddressesByQueryUseCase(
            gh<_i608.IGetAddressByQueryService>()));
    gh.factory<_i608.IGetAddressByGeopointUseCase>(() =>
        _i700.GetMyAddressByGeopointUseCase(
            gh<_i608.IGetAddressByGeopointService>()));
    gh.factory<_i608.ISendCounterOfferUseCase>(() =>
        _i878.SendCounterOfferUseCase(
            serviceActionService: gh<_i608.IServiceDriverActionService>()));
    gh.factory<_i608.ITravelPointRepository>(
        () => _i477.SqfliteTravelPointRepository(gh<_i779.Database>()));
    gh.factory<_i608.IRechargeBalanceUseCase>(() =>
        _i795.RechargeBalanceUseCase(
            balancePaymentService: gh<_i608.IBalancePaymentService>()));
    gh.factory<_i608.IChatWithClientService>(
        () => _i815.ChatWithClientService(gh<_i608.IChatService>()));
    gh.factory<_i608.IProfileLocationService>(() =>
        _i105.FirebaseProfileService(firestore: gh<_i608.FirebaseFirestore>()));
    gh.factory<_i608.IDisableWakelockUseCase>(
        () => _i502.DisableWakelockUseCase(gh<_i608.IWakelockService>()));
    gh.factory<_i608.IAcceptRequestServiceUseCase>(() =>
        _i878.AcceptRequestServiceUseCase(
            serviceActionService: gh<_i608.IServiceDriverActionService>()));
    gh.factory<_i608.IServiceActionService>(() =>
        _i499.FirebaseServiceActionService(
            firestore: gh<_i608.FirebaseFirestore>()));
    gh.factory<_i608.IGetTermsAndConditionsUseCase>(() =>
        _i795.GetTermsAndConditionsUseCase(
            balancePaymentService: gh<_i608.IBalancePaymentService>()));
    gh.factory<_i608.IListenWakelockUseCase>(
        () => _i502.ListenWakelockUseCase(gh<_i608.IWakelockService>()));
    gh.factory<_i608.IInitializeWakelockUseCase>(
        () => _i502.InitializeWakelockUseCase(gh<_i608.IWakelockService>()));
    gh.factory<_i608.IBackgroundNotificationService>(() =>
        _i315.BackgroundNotificationService(
            flutterLocalNotificationsPlugin:
                gh<_i608.FlutterLocalNotificationsPlugin>()));
    gh.factory<_i608.IDisposeWakelockUseCase>(
        () => _i502.DisposeWakelockUseCase(gh<_i608.IWakelockService>()));
    gh.factory<_i608.IListenAllRequestServiceUseCase>(() =>
        _i878.ListenAllRequestServiceUseCase(
            serviceActionService: gh<_i608.IServiceDriverActionService>()));
    gh.factory<_i608.IUserRepository>(() =>
        _i173.FirebaseUserRepository(firestore: gh<_i608.FirebaseFirestore>()));
    gh.factory<_i608.IGetDriverLocationService>(() =>
        _i499.FirebaseGetDriverLocationService(
            firestore: gh<_i608.FirebaseFirestore>()));
    gh.factory<_i608.IConsultServiceConfigurationService>(() =>
        _i906.FirebaseConsultServiceConfigurationService(
            firestore: gh<_i608.FirebaseFirestore>()));
    gh.factory<_i608.IFindFileUseCase>(
        () => _i514.FindFileUseCase(gh<_i608.IFileSearchService>()));
    gh.factory<_i608.IDriverPaymentService>(() =>
        _i906.FirebaseDriverPaymentService(
          firebaseFirestore: gh<_i608.FirebaseFirestore>(),
          driverBalanceService: gh<_i608.IDriverBalanceService>(),
          configurationService: gh<_i608.IConsultServiceConfigurationService>(),
        ));
    gh.factory<_i608.IProfileAvatarService>(
        () => _i105.FirebaseProfileAvatarService(
              firestore: gh<_i608.FirebaseFirestore>(),
              storage: gh<_i608.FirebaseStorage>(),
              pickImage: gh<_i608.IPickImage>(),
            ));
    gh.factory<_i608.IListenDriverLocationUseCase>(() =>
        _i878.ListenDriverLocationUseCase(
            getDriverLocationService: gh<_i608.IGetDriverLocationService>()));
    gh.factory<_i608.ICallClientService>(
        () => _i343.CallClientService(gh<_i608.ICallService>()));
    gh.factory<_i697.IFinishDriverRequestUseCase>(
        () => _i430.FinishDriverRequestUseCase(
              driverRequestService: gh<_i697.IFinishDriverRequestService>(),
              userService: gh<_i697.IUserRepository>(),
            ));
    gh.factory<_i608.IRegisterWithGoogleUseCase>(() =>
        _i377.RegisterWithGoogleUseCase(
          userService: gh<_i608.IUserRepository>(),
          authenticationService: gh<_i608.IAuthenticationService>(),
          googleAuthenticationService: gh<_i608.IGoogleAuthenticationService>(),
        ));
    gh.factory<_i608.IInitializeBrightnessUseCase>(() =>
        _i162.InitializeBrightnessUseCase(gh<_i608.IBrightnessService>()));
    gh.factory<_i608.IDisposeBrightnessUseCase>(
        () => _i162.DisposeBrightnessUseCase(gh<_i608.IBrightnessService>()));
    gh.factory<_i608.IUpdateDeliveryManProfileAvatarFromGalleryUseCase>(() =>
        _i858.UpdateDeliveryManProfileAvatarFromGalleryUseCase(
            gh<_i608.IDeliveryManProfileAvatarService>()));
    gh.factory<_i608.IGetMyPointsUseCase>(
        () => _i233.GetMyPointsUseCase(gh<_i608.IClientPointsService>()));
    gh.factory<_i608.ISetBrightnessUseCase>(
        () => _i162.SetBrightnessUseCase(gh<_i608.IBrightnessService>()));
    gh.factory<_i608.IResetBrightnessUseCase>(
        () => _i162.ResetBrightnessUseCase(gh<_i608.IBrightnessService>()));
    gh.factory<_i608.ICancelCounterOfferUseCase>(() =>
        _i878.CancelCounterOfferUseCase(
            serviceActionService: gh<_i608.IServiceActionService>()));
    gh.factory<_i608.IDeleteProfileAvatarUseCase>(() =>
        _i879.DeleteProfileAvatarUseCase(
            profileAvatarService: gh<_i608.IProfileAvatarService>()));
    gh.factory<_i608.IUpdateDeliveryManProfileAvatarFromCameraUseCase>(() =>
        _i858.UpdateDeliveryManProfileAvatarFromCameraUseCase(
            gh<_i608.IDeliveryManProfileAvatarService>()));
    gh.factory<_i608.IAcceptCounterOfferUseCase>(() =>
        _i878.AcceptCounterOfferUseCase(
            serviceActionService: gh<_i608.IServiceActionService>()));
    gh.factory<_i608.IUpdateProfileUseCase>(() => _i879.UpdateProfileUseCase(
        userRepository: gh<_i608.IUserRepository>()));
    gh.factory<_i608.IListenBrightnessUseCase>(
        () => _i162.ListenBrightnessUseCase(gh<_i608.IBrightnessService>()));
    gh.factory<_i697.ISendAboutMeSectionUseCase>(
        () => _i430.SendAboutMeSectionUseCase(
              aboutMeSectionService: gh<_i697.IAboutMeSectionService>(),
              userService: gh<_i697.IUserRepository>(),
              uploadFile: gh<_i697.IUploadFile>(),
            ));
    gh.factory<_i608.IChatWithClientUseCase>(() => _i878.ChatWithClientUseCase(
        chatWithClientService: gh<_i608.IChatWithClientService>()));
    gh.factory<_i608.IUpdateProfileAvatarWithGalleryUseCase>(() =>
        _i879.UpdateProfileAvatarWithGalleryUseCase(
            profileAvatarService: gh<_i608.IProfileAvatarService>()));
    gh.factory<_i608.IListenCurrentRequestServiceUseCase>(() =>
        _i878.ListenCurrentRequestServiceUseCase(
            serviceActionService: gh<_i608.IServiceActionService>()));
    gh.factory<_i608.ILogoutUseCase>(
        () => _i377.LogoutUseCase(gh<_i608.IAuthenticationService>()));
    gh.factory<_i608.IListenMyPointsUseCase>(
        () => _i233.ListenMyPointsUseCase(gh<_i608.IClientPointsService>()));
    gh.factory<_i697.ISendTechnicalReviewSectionUseCase>(
        () => _i430.SendTechnicalReviewSectionUseCase(
              technicalReviewSectionService:
                  gh<_i697.ITechnicalReviewSectionService>(),
              userService: gh<_i697.IUserRepository>(),
              uploadFile: gh<_i697.IUploadFile>(),
            ));
    gh.factory<_i608.ICancelRequestServiceUseCase>(() =>
        _i878.CancelRequestServiceUseCase(
            serviceActionService: gh<_i608.IServiceActionService>()));
    gh.factory<_i608.ISendRequestServiceUseCase>(
        () => _i878.SendRequestServiceUseCase(
              serviceActionService: gh<_i608.IServiceActionService>(),
              generateUuid: gh<_i608.IGenerateUuid>(),
            ));
    gh.factory<_i608.IGetServiceCommonOffertsUseCase>(() =>
        _i878.GetServiceCommonOffertsUseCase(
            configurationService:
                gh<_i608.IConsultServiceConfigurationService>()));
    gh.factory<_i608.IListenRequestServiceCounterOffersUseCase>(() =>
        _i878.ListenRequestServiceCounterOffersUseCase(
            serviceActionService: gh<_i608.IServiceActionService>()));
    gh.factory<_i608.ILoginWithFacebookUseCase>(() =>
        _i377.LoginWithFacebookUseCase(
            gh<_i608.IFacebookAuthenticationService>()));
    gh.factory<_i608.IRegisterWithFacebookUseCase>(
        () => _i377.RegisterWithFacebookUseCase(
              userService: gh<_i608.IUserRepository>(),
              authenticationService: gh<_i608.IAuthenticationService>(),
              facebookAuthenticationService:
                  gh<_i608.IFacebookAuthenticationService>(),
            ));
    gh.factory<_i608.IUpdateProfileAvatarWithCameraUseCase>(() =>
        _i879.UpdateProfileAvatarWithCameraUseCase(
            profileAvatarService: gh<_i608.IProfileAvatarService>()));
    gh.factory<_i697.ISendDriverRequestUseCase>(
        () => _i430.SendDriverRequestUseCase(
              driverRequestService: gh<_i697.ISendDriverRequestService>(),
              userService: gh<_i697.IUserRepository>(),
            ));
    gh.factory<_i608.IUpdateProfileLocationDataUseCase>(() =>
        _i878.UpdateProfileLocationDataUseCase(
            profileService: gh<_i608.IProfileLocationService>()));
    gh.factory<_i697.ISendNoCriminalRecordSectionUseCase>(
        () => _i430.SendNoCriminalRecordSectionUseCase(
              noCriminalRecordSectionService:
                  gh<_i697.INoCriminalRecordSectionService>(),
              userService: gh<_i697.IUserRepository>(),
              uploadFile: gh<_i697.IUploadFile>(),
            ));
    gh.factory<_i608.IListenAuthenticationUseCase>(() =>
        _i377.ListenAuthenticationUseCase(gh<_i608.IAuthenticationService>()));
    gh.factory<_i608.IChangeRequestServiceOfferUseCase>(() =>
        _i878.ChangeRequestServiceOfferUseCase(
            changeRequestServiceOfferService:
                gh<_i608.IChangeRequestServiceOfferService>()));
    gh.factory<_i697.ISendDriverLicenseSectionUseCase>(() =>
        _i430.SendDriverLicenseSectionUseCase(
          driverLicenseSectionService: gh<_i697.IDriverLicenseSectionService>(),
          userService: gh<_i697.IUserRepository>(),
          uploadFile: gh<_i697.IUploadFile>(),
        ));
    gh.factory<_i697.ISendAboutCarSectionUseCase>(
        () => _i430.SendAboutCarSectionUseCase(
              aboutCarSectionService: gh<_i697.IAboutCarSectionService>(),
              userService: gh<_i697.IUserRepository>(),
              uploadFile: gh<_i697.IUploadFile>(),
            ));
    gh.factory<_i608.IGetKnownAddressesService>(() =>
        _i1043.SqfliteGetKnownAddressesService(
            gh<_i608.ITravelPointRepository>()));
    gh.factory<_i608.ICallClientUseCase>(() => _i878.CallClientUseCase(
        callClientService: gh<_i608.ICallClientService>()));
    gh.factory<_i608.ISaveAddressService>(() =>
        _i1043.SqfliteSaveAddressService(gh<_i608.ITravelPointRepository>()));
    gh.factory<_i697.ISendOwnerShipCardSectionUseCase>(() =>
        _i430.SendOwnerShipCardSectionUseCase(
          ownerShipCardSectionService: gh<_i697.IOwnerShipCardSectionService>(),
          userService: gh<_i697.IUserRepository>(),
          uploadFile: gh<_i697.IUploadFile>(),
        ));
    gh.factory<_i608.IClientBonificationService>(() =>
        _i906.FirebaseClientBonificationService(
          firebaseFirestore: gh<_i608.FirebaseFirestore>(),
          clientPointsService: gh<_i608.IClientPointsService>(),
          configurationService: gh<_i608.IConsultServiceConfigurationService>(),
        ));
    gh.factory<_i608.IGetUserUseCase>(() => _i377.GetUserUseCase(
          authenticationService: gh<_i608.IAuthenticationService>(),
          userRepository: gh<_i608.IUserRepository>(),
        ));
    gh.factory<_i697.ISendDNISectionUseCase>(() => _i430.SendDNISectionUseCase(
          dniSectionService: gh<_i697.IDNISectionService>(),
          userService: gh<_i697.IUserRepository>(),
          uploadFile: gh<_i697.IUploadFile>(),
        ));
    gh.factory<_i697.ISendSoatSectionUseCase>(
        () => _i430.SendSoatSectionUseCase(
              soatSectionService: gh<_i697.ISoatSectionService>(),
              userService: gh<_i697.IUserRepository>(),
              uploadFile: gh<_i697.IUploadFile>(),
            ));
    gh.factory<_i608.IServiceFinishDriverActionService>(
        () => _i510.FirebaseServiceFinishDriverActionService(
              firebaseFirestore: gh<_i608.FirebaseFirestore>(),
              clientBoniticationService: gh<_i608.IClientBonificationService>(),
              driverPaymentService: gh<_i608.IDriverPaymentService>(),
            ));
    gh.factory<_i608.ISaveAddressUseCase>(
        () => _i700.SaveAddressUseCase(gh<_i608.ISaveAddressService>()));
    gh.factory<_i608.IGetKnownAddressesUseCase>(() =>
        _i700.GetKnownAddressesUseCase(gh<_i608.IGetKnownAddressesService>()));
    gh.factory<_i608.IFinishServiceDriverUseCase>(() =>
        _i878.FinishServiceDriverUseCase(
            serviceActionService:
                gh<_i608.IServiceFinishDriverActionService>()));
    return this;
  }
}

class _$FirebaseAppModule extends _i1048.FirebaseAppModule {}

class _$FirebaseAuthModule extends _i1048.FirebaseAuthModule {}

class _$FirestoreModule extends _i1048.FirestoreModule {}

class _$FirebaseStorageModule extends _i1048.FirebaseStorageModule {}

class _$AppCheckModule extends _i1048.AppCheckModule {}

class _$GoogleSignInModule extends _i1048.GoogleSignInModule {}

class _$FacebookAuthModule extends _i1048.FacebookAuthModule {}

class _$DioModule extends _i1048.DioModule {}

class _$DatabaseModule extends _i1048.DatabaseModule {}

class _$AudioPlayerModule extends _i1048.AudioPlayerModule {}

class _$FlutterLocalNotificationModule
    extends _i1048.FlutterLocalNotificationModule {}

class _$CameraModule extends _i1048.CameraModule {}

class _$PaymentModuleServicesModule
    extends _i1048.PaymentModuleServicesModule {}

class _$BrightnessModule extends _i1048.BrightnessModule {}
