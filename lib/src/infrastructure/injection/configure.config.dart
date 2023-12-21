// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:audioplayers/audioplayers.dart' as _i3;
import 'package:dio/dio.dart' as _i5;
import 'package:firebase_app_check/firebase_app_check.dart' as _i8;
import 'package:firebase_auth/firebase_auth.dart' as _i9;
import 'package:firebase_core/firebase_core.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:sqflite/sqflite.dart' as _i4;

import '../../../lib.dart' as _i6;
import '../../application/use_cases/authentication_use_case.dart' as _i26;
import '../../application/use_cases/bonification_use_case.dart' as _i25;
import '../../application/use_cases/driver_request_use_cases.dart' as _i39;
import '../../application/use_cases/fetch_driver_request_use_cases.dart'
    as _i37;
import '../../application/use_cases/find_address_use_cases.dart' as _i24;
import '../../application/use_cases/find_file_use_cases.dart' as _i21;
import '../../application/use_cases/profile_use_case.dart' as _i33;
import '../../application/use_cases/request_service_use_case.dart' as _i41;
import '../../application/use_cases/service_action_use_cases.dart' as _i15;
import '../../src.dart' as _i38;
import '../device/services/background_notification_service.dart' as _i12;
import '../device/services/find_file.dart' as _i20;
import '../device/services/image_picker.dart' as _i29;
import '../device/services/play_sound.dart' as _i30;
import '../device/services/url_launcher_call_service.dart' as _i13;
import '../device/services/whatsapp_chat_message.dart' as _i16;
import '../domain/services/call_client_service.dart' as _i36;
import '../domain/services/chat_client_service.dart' as _i17;
import '../firebase/repositories/firebase_payment_repository.dart' as _i28;
import '../firebase/repositories/firebase_user_repository.dart' as _i35;
import '../firebase/services/firebase_auth_service.dart' as _i11;
import '../firebase/services/firebase_driver_request_service.dart' as _i10;
import '../firebase/services/firebase_finish_service_actions_service.dart'
    as _i19;
import '../firebase/services/firebase_profile_service.dart' as _i31;
import '../firebase/services/firebase_service_action_service.dart' as _i14;
import '../firebase/services/firebase_service_driver_action_service.dart'
    as _i27;
import '../firebase/services/firebase_upload_file_service.dart' as _i34;
import '../firebase/services/firebase_user_bonification_service.dart' as _i18;
import '../google/services/google_find_address_service.dart' as _i23;
import '../sqflite/repositories/sqflite_travel_point_repository.dart' as _i32;
import '../sqflite/services/find_known_address_service.dart' as _i40;
import '../uuid/generate_uuid_service.dart' as _i22;
import 'dependecies.dart' as _i42;

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
    gh.lazySingleton<_i3.AudioPlayer>(() => audioPlayerModule.audioPlayer);
    await gh.lazySingletonAsync<_i4.Database>(
      () => databaseModule.database,
      preResolve: true,
    );
    gh.lazySingleton<_i5.Dio>(() => dioModule.dio);
    await gh.lazySingletonAsync<_i6.FacebookAuth>(
      () => facebookAuthModule.facebookAuth,
      preResolve: true,
    );
    await gh.factoryAsync<_i7.FirebaseApp>(
      () => firebaseAppModule.firebaseAppForPasswordReset,
      instanceName: 'FirebaseAppForPasswordReset',
      preResolve: true,
    );
    await gh.factoryAsync<_i7.FirebaseApp>(
      () => firebaseAppModule.firebaseApp,
      preResolve: true,
    );
    await gh.lazySingletonAsync<_i8.FirebaseAppCheck>(
      () => appCheckModule.appCheck,
      preResolve: true,
    );
    await gh.lazySingletonAsync<_i9.FirebaseAuth>(
      () => firebaseAuthModule.firebaseAuth,
      preResolve: true,
    );
    await gh.lazySingletonAsync<_i9.FirebaseAuth>(
      () => firebaseAuthModule.firebaseAuthForPasswordReset,
      instanceName: 'FirebaseAuthForPasswordReset',
      preResolve: true,
    );
    await gh.lazySingletonAsync<_i6.FirebaseFirestore>(
      () => firestoreModule.firestore,
      preResolve: true,
    );
    await gh.lazySingletonAsync<_i6.FirebaseStorage>(
      () => firebaseStorageModule.firebaseStorage,
      preResolve: true,
    );
    await gh.lazySingletonAsync<_i6.FlutterLocalNotificationsPlugin>(
      () => flutterLocalNotificationModule.flutterLocalNotificationsPlugin,
      preResolve: true,
    );
    await gh.lazySingletonAsync<_i6.GoogleSignIn>(
      () => googleSignInModule.googleSignIn,
      preResolve: true,
    );
    gh.factory<_i6.IAboutCarSectionService>(() =>
        _i10.FirebaseAboutCarSectionService(
            firebaseFirestore: gh<_i6.FirebaseFirestore>()));
    gh.factory<_i6.IAboutMeSectionService>(() =>
        _i10.FirebaseAboutMeSectionService(
            firebaseFirestore: gh<_i6.FirebaseFirestore>()));
    gh.factory<_i6.IAuthenticationService>(
        () => _i11.FirebaseAuthService(firebaseAuth: gh<_i9.FirebaseAuth>()));
    gh.factory<_i6.IBackgroundNotificationService>(() =>
        _i12.BackgroundNotificationService(
            flutterLocalNotificationsPlugin:
                gh<_i6.FlutterLocalNotificationsPlugin>()));
    gh.lazySingleton<_i6.ICallService>(() => _i13.UrlLauncherCallService());
    gh.factory<_i6.IChangeRequestServiceOfferService>(() =>
        _i14.FirebaseChangeRequestServiceOfferService(
            firestore: gh<_i6.FirebaseFirestore>()));
    gh.factory<_i6.IChangeRequestServiceOfferUseCase>(() =>
        _i15.ChangeRequestServiceOfferUseCase(
            changeRequestServiceOfferService:
                gh<_i6.IChangeRequestServiceOfferService>()));
    gh.lazySingleton<_i6.IChatService>(() => _i16.WhatsappChatMessageService());
    gh.factory<_i6.IChatWithClientService>(
        () => _i17.ChatWithClientService(gh<_i6.IChatService>()));
    gh.factory<_i6.IChatWithClientUseCase>(() => _i15.ChatWithClientUseCase(
        chatWithClientService: gh<_i6.IChatWithClientService>()));
    gh.factory<_i6.IClientPointsService>(() => _i18.FirebaseClientPointsService(
        firebaseFirestore: gh<_i6.FirebaseFirestore>()));
    gh.factory<_i6.IConsultServiceConfigurationService>(() =>
        _i19.FirebaseConsultServiceConfigurationService(
            firestore: gh<_i6.FirebaseFirestore>()));
    gh.factory<_i6.IDNISectionService>(() => _i10.FirebaseDNISectionService(
        firebaseFirestore: gh<_i6.FirebaseFirestore>()));
    gh.factory<_i6.IDriverBalanceService>(() =>
        _i18.FirebaseDriverBalanceService(
            firebaseFirestore: gh<_i6.FirebaseFirestore>()));
    gh.factory<_i6.IDriverLicenseSectionService>(() =>
        _i10.FirebaseDriverLicenseSectionService(
            firebaseFirestore: gh<_i6.FirebaseFirestore>()));
    gh.factory<_i6.IDriverPaymentService>(() =>
        _i19.FirebaseDriverPaymentService(
          firebaseFirestore: gh<_i6.FirebaseFirestore>(),
          driverBalanceService: gh<_i6.IDriverBalanceService>(),
          configurationService: gh<_i6.IConsultServiceConfigurationService>(),
        ));
    gh.factory<_i6.IFacebookAuthenticationService>(
        () => _i11.FirebaseFacebookAuthenticationService(
              firebaseAuth: gh<_i9.FirebaseAuth>(),
              facebookLogin: gh<_i6.FacebookAuth>(),
            ));
    gh.factory<_i6.IFileSearchService>(() => _i20.FindFileService());
    gh.factory<_i6.IFindFileUseCase>(
        () => _i21.FindFileUseCase(gh<_i6.IFileSearchService>()));
    gh.factory<_i6.IFinishDriverRequestService>(() =>
        _i10.FirebaseFinishDriverRequestService(
            firebaseFirestore: gh<_i6.FirebaseFirestore>()));
    gh.factory<_i6.IGenerateUuid>(() => _i22.GenerateUuidService());
    gh.factory<_i6.IGetAddressByGeopointService>(
        () => _i23.GoogleGetAddressByGeopointService(gh<_i5.Dio>()));
    gh.factory<_i6.IGetAddressByGeopointUseCase>(() =>
        _i24.GetMyAddressByGeopointUseCase(
            gh<_i6.IGetAddressByGeopointService>()));
    gh.factory<_i6.IGetAddressByQueryService>(
        () => _i23.GoogleFindAddressService(gh<_i5.Dio>()));
    gh.factory<_i6.IGetAddressesByQueryUseCase>(() =>
        _i24.GetAddressesByQueryUseCase(gh<_i6.IGetAddressByQueryService>()));
    gh.factory<_i6.IGetDriverLocationService>(() =>
        _i14.FirebaseGetDriverLocationService(
            firestore: gh<_i6.FirebaseFirestore>()));
    gh.factory<_i6.IGetDriverRequestService>(() =>
        _i10.FirebaseGetDriverRequestService(
            firebaseFirestore: gh<_i6.FirebaseFirestore>()));
    gh.factory<_i6.IGetMyPointsUseCase>(
        () => _i25.GetMyPointsUseCase(gh<_i6.IClientPointsService>()));
    gh.factory<_i6.IGetServiceCommonOffertsUseCase>(() =>
        _i15.GetServiceCommonOffertsUseCase(
            configurationService:
                gh<_i6.IConsultServiceConfigurationService>()));
    gh.factory<_i6.IGoogleAuthenticationService>(
        () => _i11.FirebaseGoogleAuthenticationService(
              firebaseAuth: gh<_i9.FirebaseAuth>(),
              googleSignIn: gh<_i6.GoogleSignIn>(),
            ));
    gh.factory<_i6.IListenAuthenticationUseCase>(() =>
        _i26.ListenAuthenticationUseCase(gh<_i6.IAuthenticationService>()));
    gh.factory<_i6.IListenDriverLocationUseCase>(() =>
        _i15.ListenDriverLocationUseCase(
            getDriverLocationService: gh<_i6.IGetDriverLocationService>()));
    gh.factory<_i6.IListenMyBalanceUseCase>(
        () => _i25.ListenMyBalanceUseCase(gh<_i6.IDriverBalanceService>()));
    gh.factory<_i6.IListenMyPointsUseCase>(
        () => _i25.ListenMyPointsUseCase(gh<_i6.IClientPointsService>()));
    gh.factory<_i6.ILoginWithFacebookUseCase>(() =>
        _i26.LoginWithFacebookUseCase(
            gh<_i6.IFacebookAuthenticationService>()));
    gh.factory<_i6.ILoginWithGoogleUseCase>(() =>
        _i26.LoginWithGoogleUseCase(gh<_i6.IGoogleAuthenticationService>()));
    gh.factory<_i6.ILogoutUseCase>(
        () => _i26.LogoutUseCase(gh<_i6.IAuthenticationService>()));
    gh.factory<_i6.IMarkAsViewedRequestServiceService>(() =>
        _i27.FirebaseMarkAsViewedRequestServiceService(
            firebaseFirestore: gh<_i6.FirebaseFirestore>()));
    gh.factory<_i6.IMarkAsViewedRequestServiceUseCase>(() =>
        _i15.MarkAsViewedRequestServiceUseCase(
            markAsViewedRequestServiceService:
                gh<_i6.IMarkAsViewedRequestServiceService>()));
    gh.factory<_i6.INoCriminalRecordSectionService>(() =>
        _i10.FirebaseNoCriminalRecordSectionService(
            firebaseFirestore: gh<_i6.FirebaseFirestore>()));
    gh.factory<_i6.IOwnerShipCardSectionService>(() =>
        _i10.FirebaseOwnerShipSectionService(
            firebaseFirestore: gh<_i6.FirebaseFirestore>()));
    gh.factory<_i6.IPaymentRepository>(
        () => _i28.FirebasePaymentRepository(gh<_i6.FirebaseFirestore>()));
    gh.factory<_i6.IPickImage>(() => _i29.CroppPickImageUtility());
    gh.factory<_i6.IPlaySound>(() => _i30.AudioPlayerPlaySound());
    gh.factory<_i6.IProfileAvatarService>(
        () => _i31.FirebaseProfileAvatarService(
              firestore: gh<_i6.FirebaseFirestore>(),
              storage: gh<_i6.FirebaseStorage>(),
              pickImage: gh<_i6.IPickImage>(),
            ));
    gh.factory<_i6.IProfileLocationService>(() =>
        _i31.FirebaseProfileService(firestore: gh<_i6.FirebaseFirestore>()));
    gh.factory<_i6.ISendDriverRequestService>(() =>
        _i10.FirebaseSendDriverRequestService(
            firebaseFirestore: gh<_i6.FirebaseFirestore>()));
    gh.factory<_i6.IServiceActionService>(() =>
        _i14.FirebaseServiceActionService(
            firestore: gh<_i6.FirebaseFirestore>()));
    gh.factory<_i6.IServiceDriverActionService>(() =>
        _i27.FirebaseServiceDriverActionService(
            firebaseFirestore: gh<_i6.FirebaseFirestore>()));
    gh.factory<_i6.ISoatSectionService>(() => _i10.FirebaseSoatSectionService(
        firebaseFirestore: gh<_i6.FirebaseFirestore>()));
    gh.factory<_i6.ITechnicalReviewSectionService>(() =>
        _i10.FirebaseTechnicalReviewSectionService(
            firebaseFirestore: gh<_i6.FirebaseFirestore>()));
    gh.factory<_i6.ITravelPointRepository>(
        () => _i32.SqfliteTravelPointRepository(gh<_i4.Database>()));
    gh.factory<_i6.IUpdateProfileAvatarWithCameraUseCase>(() =>
        _i33.UpdateProfileAvatarWithCameraUseCase(
            profileAvatarService: gh<_i6.IProfileAvatarService>()));
    gh.factory<_i6.IUpdateProfileAvatarWithGalleryUseCase>(() =>
        _i33.UpdateProfileAvatarWithGalleryUseCase(
            profileAvatarService: gh<_i6.IProfileAvatarService>()));
    gh.factory<_i6.IUpdateProfileLocationDataUseCase>(() =>
        _i15.UpdateProfileLocationDataUseCase(
            profileService: gh<_i6.IProfileLocationService>()));
    gh.factory<_i6.IUploadFile>(() => _i34.FirebaseUploadFileService(
        firebaseStorage: gh<_i6.FirebaseStorage>()));
    gh.factory<_i6.IUserRepository>(() =>
        _i35.FirebaseUserRepository(firestore: gh<_i6.FirebaseFirestore>()));
    gh.factory<_i6.IAcceptCounterOfferUseCase>(() =>
        _i15.AcceptCounterOfferUseCase(
            serviceActionService: gh<_i6.IServiceActionService>()));
    gh.factory<_i6.IAcceptRequestServiceUseCase>(() =>
        _i15.AcceptRequestServiceUseCase(
            serviceActionService: gh<_i6.IServiceDriverActionService>()));
    gh.factory<_i6.ICallClientService>(
        () => _i36.CallClientService(gh<_i6.ICallService>()));
    gh.factory<_i6.ICallClientUseCase>(() => _i15.CallClientUseCase(
        callClientService: gh<_i6.ICallClientService>()));
    gh.factory<_i6.ICancelCounterOfferUseCase>(() =>
        _i15.CancelCounterOfferUseCase(
            serviceActionService: gh<_i6.IServiceActionService>()));
    gh.factory<_i6.ICancelRequestServiceUseCase>(() =>
        _i15.CancelRequestServiceUseCase(
            serviceActionService: gh<_i6.IServiceActionService>()));
    gh.factory<_i6.IClientBonificationService>(() =>
        _i19.FirebaseClientBonificationService(
          firebaseFirestore: gh<_i6.FirebaseFirestore>(),
          clientPointsService: gh<_i6.IClientPointsService>(),
          configurationService: gh<_i6.IConsultServiceConfigurationService>(),
        ));
    gh.factory<_i6.IDeleteProfileAvatarUseCase>(() =>
        _i33.DeleteProfileAvatarUseCase(
            profileAvatarService: gh<_i6.IProfileAvatarService>()));
    gh.factory<_i6.IFetchDriverRequestUseCase>(() =>
        _i37.FetchDriverRequestUseCase(
            driverRequestService: gh<_i6.IGetDriverRequestService>()));
    gh.factory<_i38.IFinishDriverRequestUseCase>(
        () => _i39.FinishDriverRequestUseCase(
              driverRequestService: gh<_i38.IFinishDriverRequestService>(),
              userService: gh<_i38.IUserRepository>(),
            ));
    gh.factory<_i6.IGetKnownAddressesService>(() =>
        _i40.SqfliteGetKnownAddressesService(gh<_i6.ITravelPointRepository>()));
    gh.factory<_i6.IGetKnownAddressesUseCase>(() =>
        _i24.GetKnownAddressesUseCase(gh<_i6.IGetKnownAddressesService>()));
    gh.factory<_i6.IGetPaymentsUseCase>(
        () => _i41.GetPaymentsUseCase(gh<_i6.IPaymentRepository>()));
    gh.factory<_i6.IGetUserUseCase>(() => _i26.GetUserUseCase(
          authenticationService: gh<_i6.IAuthenticationService>(),
          userRepository: gh<_i6.IUserRepository>(),
        ));
    gh.factory<_i6.IListenAllRequestServiceUseCase>(() =>
        _i15.ListenAllRequestServiceUseCase(
            serviceActionService: gh<_i6.IServiceDriverActionService>()));
    gh.factory<_i6.IListenCurrentRequestServiceDriverUseCase>(() =>
        _i15.ListenCurrentRequestServiceDriverUseCase(
            serviceActionService: gh<_i6.IServiceDriverActionService>()));
    gh.factory<_i6.IListenCurrentRequestServiceUseCase>(() =>
        _i15.ListenCurrentRequestServiceUseCase(
            serviceActionService: gh<_i6.IServiceActionService>()));
    gh.factory<_i6.IListenRequestServiceCounterOffersUseCase>(() =>
        _i15.ListenRequestServiceCounterOffersUseCase(
            serviceActionService: gh<_i6.IServiceActionService>()));
    gh.factory<_i6.IRegisterWithFacebookUseCase>(
        () => _i26.RegisterWithFacebookUseCase(
              userService: gh<_i6.IUserRepository>(),
              authenticationService: gh<_i6.IAuthenticationService>(),
              facebookAuthenticationService:
                  gh<_i6.IFacebookAuthenticationService>(),
            ));
    gh.factory<_i6.IRegisterWithGoogleUseCase>(() =>
        _i26.RegisterWithGoogleUseCase(
          userService: gh<_i6.IUserRepository>(),
          authenticationService: gh<_i6.IAuthenticationService>(),
          googleAuthenticationService: gh<_i6.IGoogleAuthenticationService>(),
        ));
    gh.factory<_i6.ISaveAddressService>(
        () => _i40.SqfliteSaveAddressService(gh<_i6.ITravelPointRepository>()));
    gh.factory<_i6.ISaveAddressUseCase>(
        () => _i24.SaveAddressUseCase(gh<_i6.ISaveAddressService>()));
    gh.factory<_i38.ISendAboutCarSectionUseCase>(
        () => _i39.SendAboutCarSectionUseCase(
              aboutCarSectionService: gh<_i38.IAboutCarSectionService>(),
              userService: gh<_i38.IUserRepository>(),
              uploadFile: gh<_i38.IUploadFile>(),
            ));
    gh.factory<_i38.ISendAboutMeSectionUseCase>(
        () => _i39.SendAboutMeSectionUseCase(
              aboutMeSectionService: gh<_i38.IAboutMeSectionService>(),
              userService: gh<_i38.IUserRepository>(),
              uploadFile: gh<_i38.IUploadFile>(),
            ));
    gh.factory<_i6.ISendCounterOfferUseCase>(() => _i15.SendCounterOfferUseCase(
        serviceActionService: gh<_i6.IServiceDriverActionService>()));
    gh.factory<_i38.ISendDNISectionUseCase>(() => _i39.SendDNISectionUseCase(
          dniSectionService: gh<_i38.IDNISectionService>(),
          userService: gh<_i38.IUserRepository>(),
          uploadFile: gh<_i38.IUploadFile>(),
        ));
    gh.factory<_i38.ISendDriverLicenseSectionUseCase>(() =>
        _i39.SendDriverLicenseSectionUseCase(
          driverLicenseSectionService: gh<_i38.IDriverLicenseSectionService>(),
          userService: gh<_i38.IUserRepository>(),
          uploadFile: gh<_i38.IUploadFile>(),
        ));
    gh.factory<_i38.ISendDriverRequestUseCase>(
        () => _i39.SendDriverRequestUseCase(
              driverRequestService: gh<_i38.ISendDriverRequestService>(),
              userService: gh<_i38.IUserRepository>(),
            ));
    gh.factory<_i38.ISendNoCriminalRecordSectionUseCase>(
        () => _i39.SendNoCriminalRecordSectionUseCase(
              noCriminalRecordSectionService:
                  gh<_i38.INoCriminalRecordSectionService>(),
              userService: gh<_i38.IUserRepository>(),
              uploadFile: gh<_i38.IUploadFile>(),
            ));
    gh.factory<_i38.ISendOwnerShipCardSectionUseCase>(() =>
        _i39.SendOwnerShipCardSectionUseCase(
          ownerShipCardSectionService: gh<_i38.IOwnerShipCardSectionService>(),
          userService: gh<_i38.IUserRepository>(),
          uploadFile: gh<_i38.IUploadFile>(),
        ));
    gh.factory<_i6.ISendRequestServiceUseCase>(
        () => _i15.SendRequestServiceUseCase(
              serviceActionService: gh<_i6.IServiceActionService>(),
              generateUuid: gh<_i6.IGenerateUuid>(),
            ));
    gh.factory<_i38.ISendSoatSectionUseCase>(() => _i39.SendSoatSectionUseCase(
          soatSectionService: gh<_i38.ISoatSectionService>(),
          userService: gh<_i38.IUserRepository>(),
          uploadFile: gh<_i38.IUploadFile>(),
        ));
    gh.factory<_i38.ISendTechnicalReviewSectionUseCase>(
        () => _i39.SendTechnicalReviewSectionUseCase(
              technicalReviewSectionService:
                  gh<_i38.ITechnicalReviewSectionService>(),
              userService: gh<_i38.IUserRepository>(),
              uploadFile: gh<_i38.IUploadFile>(),
            ));
    gh.factory<_i6.IServiceFinishDriverActionService>(
        () => _i27.FirebaseServiceFinishDriverActionService(
              firebaseFirestore: gh<_i6.FirebaseFirestore>(),
              clientBoniticationService: gh<_i6.IClientBonificationService>(),
              driverPaymentService: gh<_i6.IDriverPaymentService>(),
            ));
    gh.factory<_i6.IUpdateProfileUseCase>(() =>
        _i33.UpdateProfileUseCase(userRepository: gh<_i6.IUserRepository>()));
    gh.factory<_i6.IFinishServiceDriverUseCase>(() =>
        _i15.FinishServiceDriverUseCase(
            serviceActionService: gh<_i6.IServiceFinishDriverActionService>()));
    return this;
  }
}

class _$AudioPlayerModule extends _i42.AudioPlayerModule {}

class _$DatabaseModule extends _i42.DatabaseModule {}

class _$DioModule extends _i42.DioModule {}

class _$FacebookAuthModule extends _i42.FacebookAuthModule {}

class _$FirebaseAppModule extends _i42.FirebaseAppModule {}

class _$AppCheckModule extends _i42.AppCheckModule {}

class _$FirebaseAuthModule extends _i42.FirebaseAuthModule {}

class _$FirestoreModule extends _i42.FirestoreModule {}

class _$FirebaseStorageModule extends _i42.FirebaseStorageModule {}

class _$FlutterLocalNotificationModule
    extends _i42.FlutterLocalNotificationModule {}

class _$GoogleSignInModule extends _i42.GoogleSignInModule {}
