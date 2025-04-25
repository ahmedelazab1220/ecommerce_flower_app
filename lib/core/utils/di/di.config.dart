// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:logger/logger.dart' as _i974;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../../../features/address_details/data/api/address_details_retrofit_client.dart'
    as _i298;
import '../../../features/address_details/data/data_sources/contract/address_details_local_data_source.dart'
    as _i31;
import '../../../features/address_details/data/data_sources/contract/address_details_remote_data_source.dart'
    as _i973;
import '../../../features/address_details/data/data_sources/local/address_details_local_data_source_impl.dart'
    as _i383;
import '../../../features/address_details/data/data_sources/remote/address_details_remote_data_source_impl.dart'
    as _i80;
import '../../../features/address_details/data/repo_impl/address_details_repo_impl.dart'
    as _i31;
import '../../../features/address_details/domain/repo/address_details_repo.dart'
    as _i349;
import '../../../features/address_details/domain/use_cases/add_adderss_use_case.dart'
    as _i1016;
import '../../../features/address_details/domain/use_cases/get_cities_use_case.dart'
    as _i462;
import '../../../features/address_details/domain/use_cases/get_states_use_case.dart'
    as _i16;
import '../../../features/address_details/domain/use_cases/update_address_use_case.dart'
    as _i622;
import '../../../features/address_details/presentation/view_model/address_details_cubit.dart'
    as _i832;
import '../../../features/auth/data/api/auth_retrofit_client.dart' as _i1048;
import '../../../features/auth/data/data_source/contract/auth_local_data_source.dart'
    as _i1015;
import '../../../features/auth/data/data_source/contract/auth_remote_data_source.dart'
    as _i305;
import '../../../features/auth/data/data_source/local/auth_local_data_source_impl.dart'
    as _i241;
import '../../../features/auth/data/data_source/remote/auth_remote_data_source_impl.dart'
    as _i212;
import '../../../features/auth/data/repo_impl/auth_repo_impl.dart' as _i822;
import '../../../features/auth/domain/repo/auth_repo.dart' as _i913;
import '../../../features/auth/domain/use_case/guest_use_case.dart' as _i124;
import '../../../features/auth/domain/use_case/login_use_case.dart' as _i197;
import '../../../features/auth/domain/use_case/register_use_case.dart' as _i336;
import '../../../features/auth/presentation/view_model/login/login_cubit.dart'
    as _i204;
import '../../../features/auth/presentation/view_model/register/register_cubit.dart'
    as _i316;
import '../../../features/cart/data/api/cart_retrofit_client.dart' as _i675;
import '../../../features/cart/data/data_source/contract/cart_remote_datasource.dart'
    as _i12;
import '../../../features/cart/data/data_source/remote/cart_remote_datasource_impl.dart'
    as _i616;
import '../../../features/cart/data/repo_impl/cart_repo_impl.dart' as _i833;
import '../../../features/cart/domain/repo/cart_repo.dart' as _i1033;
import '../../../features/cart/domain/usecase/add_product_to_cart_usecase.dart'
    as _i1010;
import '../../../features/cart/domain/usecase/clear_cart_usecase.dart' as _i407;
import '../../../features/cart/domain/usecase/delete_product_from_cart_usecase.dart'
    as _i715;
import '../../../features/cart/domain/usecase/get_cart_usecase.dart' as _i1039;
import '../../../features/cart/domain/usecase/update_product_in_cart_usecase.dart'
    as _i637;
import '../../../features/cart/presentation/view_model/cart_cubit.dart' as _i99;
import '../../../features/categories/data/api/categories_retrofit_client.dart'
    as _i619;
import '../../../features/categories/data/data_source/contract/categories_remote_data_source.dart'
    as _i691;
import '../../../features/categories/data/data_source/remote/categories_remote_data_source_impl.dart'
    as _i939;
import '../../../features/categories/data/repo_impl/categories_repo_impl.dart'
    as _i427;
import '../../../features/categories/domain/repo/categories_repo.dart' as _i781;
import '../../../features/categories/domain/use_cases/get_categories_use_case.dart'
    as _i1027;
import '../../../features/categories/domain/use_cases/get_products_use_case.dart'
    as _i752;
import '../../../features/categories/presentation/view_model/categories_cubit.dart'
    as _i1008;
import '../../../features/change_password/data/api/change_password_retrofit_client.dart'
    as _i436;
import '../../../features/change_password/data/data_source/contract/change_password_remote_data_source.dart'
    as _i120;
import '../../../features/change_password/data/data_source/remote/change_password_data_source_impl.dart'
    as _i6;
import '../../../features/change_password/data/repo_impl/change_password_repo_impl.dart'
    as _i723;
import '../../../features/change_password/domain/repo/change_password_repo.dart'
    as _i472;
import '../../../features/change_password/domain/use_case/change_password_use_case.dart'
    as _i280;
import '../../../features/change_password/presentation/view_model/change_password_cubit.dart'
    as _i744;
import '../../../features/checkout/data/api/checkout_retrofit_client.dart'
    as _i967;
import '../../../features/checkout/data/data_source/contract/checkout_local_data_source.dart'
    as _i119;
import '../../../features/checkout/data/data_source/contract/checkout_remote_data_source.dart'
    as _i766;
import '../../../features/checkout/data/data_source/local/checkout_local_data_source_impl.dart'
    as _i900;
import '../../../features/checkout/data/data_source/remote/checkout_remote_data_source_impl.dart'
    as _i936;
import '../../../features/checkout/data/repo_impl/checkout_repo_impl.dart'
    as _i154;
import '../../../features/checkout/domain/repo/checkout_repo.dart' as _i10;
import '../../../features/checkout/domain/usecase/add_cache_order_use_case.dart'
    as _i1055;
import '../../../features/checkout/domain/usecase/add_credit_order_use_case.dart'
    as _i211;
import '../../../features/checkout/domain/usecase/get_addresses_use_case.dart'
    as _i217;
import '../../../features/checkout/domain/usecase/get_cart_info_use_case.dart'
    as _i370;
import '../../../features/checkout/presentation/view_model/checkout_cubit.dart'
    as _i222;
import '../../../features/edit_profile/data/api/edit_profile_retrofit_client.dart'
    as _i865;
import '../../../features/edit_profile/data/api/upload_file_api_manager.dart'
    as _i891;
import '../../../features/edit_profile/data/api/upload_file_api_manager_impl.dart'
    as _i562;
import '../../../features/edit_profile/data/data_source/contract/edit_profile_remote_data_source.dart'
    as _i592;
import '../../../features/edit_profile/data/data_source/remote/edit_profile_remote_data_source_impl.dart'
    as _i503;
import '../../../features/edit_profile/data/repo_impl/edit_profile_repo_impl.dart'
    as _i192;
import '../../../features/edit_profile/domain/repo/edit_profile_repo.dart'
    as _i1005;
import '../../../features/edit_profile/domain/use_case/edit_profile_use_case.dart'
    as _i1071;
import '../../../features/edit_profile/domain/use_case/upload_profile_image_use_case.dart'
    as _i365;
import '../../../features/edit_profile/presentation/view_model/cubit/edit_profile_cubit.dart'
    as _i4;
import '../../../features/home/data/api/home_retrofit_client.dart' as _i945;
import '../../../features/home/data/data_source/contract/home_local_data_source.dart'
    as _i493;
import '../../../features/home/data/data_source/contract/home_remote_data_source.dart'
    as _i1043;
import '../../../features/home/data/data_source/local/home_local_data_source_impl.dart'
    as _i640;
import '../../../features/home/data/data_source/remote/home_remote_data_source_impl.dart'
    as _i859;
import '../../../features/home/data/repo_impl/home_repo_impl.dart' as _i801;
import '../../../features/home/domain/repo/home_repo.dart' as _i242;
import '../../../features/home/domain/use_case/get_home_data_use_case.dart'
    as _i1065;
import '../../../features/home/presentation/view_model/home_cubit.dart'
    as _i595;
import '../../../features/main_layout/presentation/view_model/cubit/main_layout_cubit.dart'
    as _i393;
import '../../../features/most_selling_products/data/api/best_seller_retrofit_client.dart'
    as _i821;
import '../../../features/most_selling_products/data/data_source/contract/best_seller_remote_data_source.dart'
    as _i488;
import '../../../features/most_selling_products/data/data_source/remote/best_seller_remote_data_source_impl.dart'
    as _i461;
import '../../../features/most_selling_products/data/repo_impl/best_seller_repo_impl.dart'
    as _i688;
import '../../../features/most_selling_products/domain/repo/best_seller_repo.dart'
    as _i58;
import '../../../features/most_selling_products/domain/usecase/get_best_sellers_usecase.dart'
    as _i109;
import '../../../features/most_selling_products/presentation/view_model/best_seller_cubit.dart'
    as _i190;
import '../../../features/notifications/data/api/notification_retrofit_client.dart'
    as _i59;
import '../../../features/notifications/data/data_source/contract/notification_local_data_source.dart'
    as _i637;
import '../../../features/notifications/data/data_source/contract/notification_remote_data_source.dart'
    as _i422;
import '../../../features/notifications/data/data_source/remote/notification_remote_data_source_impl.dart'
    as _i72;
import '../../../features/notifications/data/repo_impl/notification_repo_impl.dart'
    as _i487;
import '../../../features/notifications/domain/repo/notification_repo.dart'
    as _i94;
import '../../../features/notifications/domain/usecase/delete_notification_by_id_use_case.dart'
    as _i973;
import '../../../features/notifications/domain/usecase/get_all_notifications_use_case.dart'
    as _i326;
import '../../../features/notifications/domain/usecase/get_notification_by_id_use_case.dart'
    as _i868;
import '../../../features/occasions/data/api/occasion_retrofit_client.dart'
    as _i1061;
import '../../../features/occasions/data/data_source/contract/occasion_remote_data_source.dart'
    as _i452;
import '../../../features/occasions/data/data_source/occasion_remote_data_source_impl.dart'
    as _i61;
import '../../../features/occasions/data/repo_impl/occasion_repo_impl.dart'
    as _i835;
import '../../../features/occasions/domain/repo/occasion_repo.dart' as _i72;
import '../../../features/occasions/domain/usecase/get_all_occasions_usecase.dart'
    as _i1056;
import '../../../features/occasions/domain/usecase/get_products_by_id_usecase.dart'
    as _i619;
import '../../../features/occasions/presentation/view_model/occasion_cubit.dart'
    as _i41;
import '../../../features/product_details/presentation/view_model/product_details_cubit.dart'
    as _i834;
import '../../../features/profile/data/api/profile_retrofit_client.dart'
    as _i766;
import '../../../features/profile/data/data_source/contract/profile_local_data_source.dart'
    as _i1011;
import '../../../features/profile/data/data_source/contract/profile_remote_data_source.dart'
    as _i939;
import '../../../features/profile/data/data_source/local/profile_local_data_source_impl.dart'
    as _i862;
import '../../../features/profile/data/data_source/remote/profile_remote_data_source_impl.dart'
    as _i1038;
import '../../../features/profile/data/repo_impl/profile_repo_impl.dart'
    as _i1054;
import '../../../features/profile/domain/repo/profile_repo.dart' as _i863;
import '../../../features/profile/domain/usecase/get_user_data_usecase.dart'
    as _i314;
import '../../../features/profile/domain/usecase/guest_mode_use_case.dart'
    as _i405;
import '../../../features/profile/domain/usecase/logout_use_case.dart' as _i238;
import '../../../features/profile/presentation/view_model/profile_cubit.dart'
    as _i782;
import '../../../features/saved_addresses/data/api/saved_addresses_retrofit_client.dart'
    as _i746;
import '../../../features/saved_addresses/data/data_source/contract/saved_addresses_remote_data_source.dart'
    as _i237;
import '../../../features/saved_addresses/data/data_source/remote/saved_addresses_remote_data_source_impl.dart'
    as _i637;
import '../../../features/saved_addresses/data/repo_impl/saved_addresses_repo_impl.dart'
    as _i950;
import '../../../features/saved_addresses/domain/repo/saved_addresses_repo.dart'
    as _i638;
import '../../../features/saved_addresses/domain/use_case/delete_user_address_use_case.dart'
    as _i610;
import '../../../features/saved_addresses/domain/use_case/get_user_saved_addresses_use_case.dart'
    as _i834;
import '../../../features/saved_addresses/presentation/view_model/cubit/saved_address_cubit.dart'
    as _i700;
import '../../functions/initial_route_function.dart' as _i687;
import '../bloc_observer/bloc_observer_service.dart' as _i649;
import '../datasource_excution/api_manager.dart' as _i28;
import '../datasource_excution/dio_module.dart' as _i953;
import '../flutter_secure_storage_module.dart' as _i712;
import '../location_service/location_service.dart' as _i533;
import '../logging/logger_module.dart' as _i470;
import '../shared_features/add_to_cart/data/api/add_to_cart_retrofit_client.dart'
    as _i918;
import '../shared_features/add_to_cart/data/data_source/contract/add_to_cart_local_data_source.dart'
    as _i528;
import '../shared_features/add_to_cart/data/data_source/contract/add_to_cart_remote_data_source.dart'
    as _i664;
import '../shared_features/add_to_cart/data/data_source/local/add_to_cart_local_data_source_impl.dart'
    as _i719;
import '../shared_features/add_to_cart/data/data_source/remote/add_to_cart_remote_data_source_impl.dart'
    as _i338;
import '../shared_features/add_to_cart/data/repo_impl/add_to_cart_repo_impl.dart'
    as _i934;
import '../shared_features/add_to_cart/domain/repo/add_to_cart_repo.dart'
    as _i946;
import '../shared_features/add_to_cart/domain/usecase/add_to_cart_use_case.dart'
    as _i393;
import '../shared_features/add_to_cart/domain/usecase/is_guest_use_case.dart'
    as _i182;
import '../shared_preference_module.dart' as _i60;
import '../validator/validator.dart' as _i468;

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
    final sharedPreferenceModule = _$SharedPreferenceModule();
    final secureStorageModule = _$SecureStorageModule();
    final loggerModule = _$LoggerModule();
    final dioModule = _$DioModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => sharedPreferenceModule.sharedPreferences,
      preResolve: true,
    );
    gh.factory<_i393.MainLayoutCubit>(() => _i393.MainLayoutCubit());
    gh.singleton<_i28.ApiManager>(() => _i28.ApiManager());
    gh.singleton<_i533.LocationService>(() => _i533.LocationService());
    gh.lazySingleton<_i558.FlutterSecureStorage>(
        () => secureStorageModule.storage);
    gh.lazySingleton<_i974.Logger>(() => loggerModule.loggerProvider);
    gh.lazySingleton<_i974.PrettyPrinter>(() => loggerModule.prettyPrinter);
    gh.lazySingleton<_i468.Validator>(() => _i468.Validator());
    gh.factory<_i493.HomeLocalDataSource>(
        () => _i640.HomeLocalDataSourceImpl());
    gh.singleton<_i649.BlocObserverService>(
        () => _i649.BlocObserverService(gh<_i974.Logger>()));
    gh.factory<_i119.CheckoutLocalDataSource>(
        () => _i900.CheckoutLocalDataSourceImpl());
    gh.lazySingleton<_i31.AddressDetailsLocalDataSource>(
        () => _i383.AddressDetailsLocalDataSourceImpl());
    gh.factory<_i528.AddToCartLocalDataSource>(() =>
        _i719.AddToCartLocalDataSourceImpl(gh<_i558.FlutterSecureStorage>()));
    gh.factory<_i687.RouteInitializer>(() => _i687.RouteInitializer(
        sharedPreferences: gh<_i460.SharedPreferences>()));
    gh.factory<_i1011.ProfileLocalDataSource>(
        () => _i862.ProfileLocalDataSourceImpl(
              gh<_i558.FlutterSecureStorage>(),
              gh<_i460.SharedPreferences>(),
            ));
    gh.lazySingleton<_i361.Dio>(
        () => dioModule.provideDio(gh<_i558.FlutterSecureStorage>()));
    gh.factory<_i1015.AuthLocalDataSource>(() => _i241.AuthLocalDataSourceImpl(
          gh<_i558.FlutterSecureStorage>(),
          gh<_i460.SharedPreferences>(),
        ));
    gh.factory<_i891.UploadFileApiManager>(
        () => _i562.UploadFileApiManagerImpl(gh<_i361.Dio>()));
    gh.lazySingleton<_i298.AddressDetailsRetrofitClient>(
        () => _i298.AddressDetailsRetrofitClient(gh<_i361.Dio>()));
    gh.lazySingleton<_i436.ChangePasswordRetrofitClient>(
        () => _i436.ChangePasswordRetrofitClient(gh<_i361.Dio>()));
    gh.singleton<_i918.AddToCartRetrofitClient>(
        () => _i918.AddToCartRetrofitClient(gh<_i361.Dio>()));
    gh.singleton<_i1048.AuthRetrofitClient>(
        () => _i1048.AuthRetrofitClient(gh<_i361.Dio>()));
    gh.singleton<_i675.CartRetrofitClient>(
        () => _i675.CartRetrofitClient(gh<_i361.Dio>()));
    gh.singleton<_i619.CategoriesRetrofitClient>(
        () => _i619.CategoriesRetrofitClient(gh<_i361.Dio>()));
    gh.singleton<_i967.CheckoutRetrofitClient>(
        () => _i967.CheckoutRetrofitClient(gh<_i361.Dio>()));
    gh.singleton<_i945.HomeRetrofitClient>(
        () => _i945.HomeRetrofitClient(gh<_i361.Dio>()));
    gh.singleton<_i821.BestSellerRetrofitClient>(
        () => _i821.BestSellerRetrofitClient(gh<_i361.Dio>()));
    gh.singleton<_i59.NotificationRetrofitClient>(
        () => _i59.NotificationRetrofitClient(gh<_i361.Dio>()));
    gh.singleton<_i1061.OccasionRetrofitClient>(
        () => _i1061.OccasionRetrofitClient(gh<_i361.Dio>()));
    gh.singleton<_i766.ProfileRetrofitClient>(
        () => _i766.ProfileRetrofitClient(gh<_i361.Dio>()));
    gh.factory<_i865.EditProfileRetrofitClient>(
        () => _i865.EditProfileRetrofitClient(gh<_i361.Dio>()));
    gh.factory<_i746.SavedAddressesRetrofitClient>(
        () => _i746.SavedAddressesRetrofitClient(gh<_i361.Dio>()));
    gh.singleton<_i691.CategoriesRemoteDataSource>(() =>
        _i939.CategoriesRemoteDataSourceImpl(
            gh<_i619.CategoriesRetrofitClient>()));
    gh.factory<_i664.AddToCartRemoteDataSource>(() =>
        _i338.AddToCartRemoteDataSourceImpl(
            gh<_i918.AddToCartRetrofitClient>()));
    gh.lazySingleton<_i120.ChangePasswordRemoteDataSource>(() =>
        _i6.ChangePasswordDataSourceImpl(
            gh<_i436.ChangePasswordRetrofitClient>()));
    gh.lazySingleton<_i973.AddressDetailsRemoteDataSource>(() =>
        _i80.AddressDetailsRemoteDataSourceImpl(
            gh<_i298.AddressDetailsRetrofitClient>()));
    gh.factory<_i452.OccasionRemoteDataSource>(() =>
        _i61.OccasionRemoteDataSourceImpl(gh<_i1061.OccasionRetrofitClient>()));
    gh.factory<_i766.CheckoutRemoteDataSource>(() =>
        _i936.CheckoutRemoteDataSourceImpl(gh<_i967.CheckoutRetrofitClient>()));
    gh.singleton<_i1043.HomeRemoteDataSource>(
        () => _i859.HomeRemoteDataSourceImpl(gh<_i945.HomeRetrofitClient>()));
    gh.lazySingleton<_i349.AddressDetailsRepo>(
        () => _i31.AddressDetailsRepoImpl(
              gh<_i973.AddressDetailsRemoteDataSource>(),
              gh<_i28.ApiManager>(),
              gh<_i31.AddressDetailsLocalDataSource>(),
            ));
    gh.factory<_i305.AuthRemoteDataSource>(
        () => _i212.AuthRemoteDataSourceImpl(gh<_i1048.AuthRetrofitClient>()));
    gh.factory<_i422.NotificationRemoteDataSource>(() =>
        _i72.NotificationRemoteDataSourceImpl(
            gh<_i59.NotificationRetrofitClient>()));
    gh.factory<_i488.BestSellerRemoteDataSource>(() =>
        _i461.BestSellerRemoteDataSourceImpl(
            gh<_i821.BestSellerRetrofitClient>()));
    gh.factory<_i72.OccasionRepo>(() => _i835.OccasionRepoImpl(
          gh<_i28.ApiManager>(),
          gh<_i452.OccasionRemoteDataSource>(),
        ));
    gh.factory<_i10.CheckoutRepo>(() => _i154.CheckoutRepoImpl(
          gh<_i28.ApiManager>(),
          gh<_i766.CheckoutRemoteDataSource>(),
        ));
    gh.factory<_i58.BestSellerRepo>(() => _i688.BestSellerRepoImpl(
          gh<_i488.BestSellerRemoteDataSource>(),
          gh<_i28.ApiManager>(),
        ));
    gh.factory<_i939.ProfileRemoteDataSource>(() =>
        _i1038.ProfileRemoteDataSourceImpl(gh<_i766.ProfileRetrofitClient>()));
    gh.factory<_i242.HomeRepo>(() => _i801.HomeRepoImpl(
          gh<_i1043.HomeRemoteDataSource>(),
          gh<_i28.ApiManager>(),
        ));
    gh.factory<_i12.CartRemoteDataSource>(
        () => _i616.CartRemoteDatasourceImpl(gh<_i675.CartRetrofitClient>()));
    gh.factory<_i592.EditProfileRemoteDataSource>(
        () => _i503.EditProfileRemoteDataSourceImpl(
              gh<_i865.EditProfileRetrofitClient>(),
              gh<_i891.UploadFileApiManager>(),
            ));
    gh.factory<_i946.AddToCartRepo>(() => _i934.AddToCartRepoImpl(
          gh<_i28.ApiManager>(),
          gh<_i664.AddToCartRemoteDataSource>(),
          gh<_i528.AddToCartLocalDataSource>(),
        ));
    gh.factory<_i94.NotificationRepo>(() => _i487.NotificationRepoImpl(
          gh<_i422.NotificationRemoteDataSource>(),
          gh<_i637.NotificationLocalDataSource>(),
          gh<_i28.ApiManager>(),
        ));
    gh.factory<_i1055.AddCacheOrderUseCase>(
        () => _i1055.AddCacheOrderUseCase(gh<_i10.CheckoutRepo>()));
    gh.factory<_i211.AddCreditOrderUseCase>(
        () => _i211.AddCreditOrderUseCase(gh<_i10.CheckoutRepo>()));
    gh.factory<_i217.GetAddressesUseCase>(
        () => _i217.GetAddressesUseCase(gh<_i10.CheckoutRepo>()));
    gh.factory<_i370.GetCartInfoUseCase>(
        () => _i370.GetCartInfoUseCase(gh<_i10.CheckoutRepo>()));
    gh.factory<_i237.SavedAddressesRemoteDataSource>(() =>
        _i637.SavedAddressesRemoteDataSourceImpl(
            gh<_i746.SavedAddressesRetrofitClient>()));
    gh.lazySingleton<_i472.ChangePasswordRepo>(
        () => _i723.ChangePasswordRepoImpl(
              gh<_i120.ChangePasswordRemoteDataSource>(),
              gh<_i28.ApiManager>(),
            ));
    gh.singleton<_i781.CategoriesRepo>(() => _i427.CategoriesRepoImpl(
          gh<_i691.CategoriesRemoteDataSource>(),
          gh<_i28.ApiManager>(),
        ));
    gh.factory<_i973.DeleteNotificationByIdUseCase>(
        () => _i973.DeleteNotificationByIdUseCase(gh<_i94.NotificationRepo>()));
    gh.factory<_i326.GetAllNotificationsUseCase>(
        () => _i326.GetAllNotificationsUseCase(gh<_i94.NotificationRepo>()));
    gh.factory<_i868.GetNotificationByIdUseCase>(
        () => _i868.GetNotificationByIdUseCase(gh<_i94.NotificationRepo>()));
    gh.factory<_i1005.EditProfileRepo>(() => _i192.EditProfileRepoImpl(
          gh<_i592.EditProfileRemoteDataSource>(),
          gh<_i28.ApiManager>(),
        ));
    gh.factory<_i1016.AddAddressUseCase>(
        () => _i1016.AddAddressUseCase(gh<_i349.AddressDetailsRepo>()));
    gh.factory<_i622.UpdateAddressUseCase>(
        () => _i622.UpdateAddressUseCase(gh<_i349.AddressDetailsRepo>()));
    gh.lazySingleton<_i462.GetCitiesUseCase>(
        () => _i462.GetCitiesUseCase(gh<_i349.AddressDetailsRepo>()));
    gh.lazySingleton<_i16.GetStatesUseCase>(
        () => _i16.GetStatesUseCase(gh<_i349.AddressDetailsRepo>()));
    gh.factory<_i1033.CartRepo>(() => _i833.CartRepoImpl(
          gh<_i12.CartRemoteDataSource>(),
          gh<_i28.ApiManager>(),
        ));
    gh.factory<_i863.ProfileRepo>(() => _i1054.ProfileRepoImpl(
          gh<_i28.ApiManager>(),
          gh<_i939.ProfileRemoteDataSource>(),
          gh<_i1011.ProfileLocalDataSource>(),
        ));
    gh.factory<_i913.AuthRepo>(() => _i822.AuthRepoImpl(
          gh<_i305.AuthRemoteDataSource>(),
          gh<_i1015.AuthLocalDataSource>(),
          gh<_i28.ApiManager>(),
        ));
    gh.factory<_i832.AddressDetailsCubit>(() => _i832.AddressDetailsCubit(
          gh<_i1016.AddAddressUseCase>(),
          gh<_i622.UpdateAddressUseCase>(),
          gh<_i462.GetCitiesUseCase>(),
          gh<_i16.GetStatesUseCase>(),
          gh<_i468.Validator>(),
        ));
    gh.factory<_i1056.GetAllOccasionsUsecase>(
        () => _i1056.GetAllOccasionsUsecase(gh<_i72.OccasionRepo>()));
    gh.factory<_i619.GetProductsByIdUsecase>(
        () => _i619.GetProductsByIdUsecase(gh<_i72.OccasionRepo>()));
    gh.factory<_i41.OccasionCubit>(() => _i41.OccasionCubit(
          gh<_i1056.GetAllOccasionsUsecase>(),
          gh<_i619.GetProductsByIdUsecase>(),
        ));
    gh.factory<_i197.LoginUseCase>(
        () => _i197.LoginUseCase(gh<_i913.AuthRepo>()));
    gh.factory<_i1065.GetHomeDataUseCase>(
        () => _i1065.GetHomeDataUseCase(gh<_i242.HomeRepo>()));
    gh.factory<_i109.GetBestSellersUsecase>(
        () => _i109.GetBestSellersUsecase(gh<_i58.BestSellerRepo>()));
    gh.factory<_i1071.EditProfileUseCase>(
        () => _i1071.EditProfileUseCase(gh<_i1005.EditProfileRepo>()));
    gh.factory<_i365.UploadProfileImageUseCase>(
        () => _i365.UploadProfileImageUseCase(gh<_i1005.EditProfileRepo>()));
    gh.factory<_i638.SavedAddressesRepo>(() => _i950.SavedAddressesRepoImpl(
          gh<_i237.SavedAddressesRemoteDataSource>(),
          gh<_i28.ApiManager>(),
        ));
    gh.factory<_i280.ChangePasswordUseCase>(
        () => _i280.ChangePasswordUseCase(gh<_i472.ChangePasswordRepo>()));
    gh.factory<_i222.CheckoutCubit>(() => _i222.CheckoutCubit(
          gh<_i217.GetAddressesUseCase>(),
          gh<_i1055.AddCacheOrderUseCase>(),
          gh<_i211.AddCreditOrderUseCase>(),
          gh<_i370.GetCartInfoUseCase>(),
          gh<_i468.Validator>(),
        ));
    gh.factory<_i190.BestSellerCubit>(
        () => _i190.BestSellerCubit(gh<_i109.GetBestSellersUsecase>()));
    gh.factory<_i744.ChangePasswordCubit>(() => _i744.ChangePasswordCubit(
          gh<_i280.ChangePasswordUseCase>(),
          gh<_i468.Validator>(),
        ));
    gh.factory<_i314.GetUserDataUsecase>(
        () => _i314.GetUserDataUsecase(gh<_i863.ProfileRepo>()));
    gh.factory<_i405.GuestModeUseCase>(
        () => _i405.GuestModeUseCase(gh<_i863.ProfileRepo>()));
    gh.factory<_i238.LogoutUseCase>(
        () => _i238.LogoutUseCase(gh<_i863.ProfileRepo>()));
    gh.factory<_i1027.GetCategoriesUseCase>(
        () => _i1027.GetCategoriesUseCase(gh<_i781.CategoriesRepo>()));
    gh.factory<_i752.GetProductsUseCase>(
        () => _i752.GetProductsUseCase(gh<_i781.CategoriesRepo>()));
    gh.factory<_i595.HomeCubit>(() => _i595.HomeCubit(
          gh<_i1065.GetHomeDataUseCase>(),
          gh<_i533.LocationService>(),
        ));
    gh.factory<_i393.AddToCartUseCase>(
        () => _i393.AddToCartUseCase(gh<_i946.AddToCartRepo>()));
    gh.factory<_i182.IsGuestUseCase>(
        () => _i182.IsGuestUseCase(gh<_i946.AddToCartRepo>()));
    gh.factory<_i4.EditProfileCubit>(() => _i4.EditProfileCubit(
          gh<_i1071.EditProfileUseCase>(),
          gh<_i365.UploadProfileImageUseCase>(),
          gh<_i468.Validator>(),
        ));
    gh.factory<_i124.GuestUseCase>(
        () => _i124.GuestUseCase(gh<_i913.AuthRepo>()));
    gh.factory<_i1010.AddProductToCartUsecase>(
        () => _i1010.AddProductToCartUsecase(gh<_i1033.CartRepo>()));
    gh.factory<_i407.ClearCartUsecase>(
        () => _i407.ClearCartUsecase(gh<_i1033.CartRepo>()));
    gh.factory<_i715.DeleteProductFromCartUsecase>(
        () => _i715.DeleteProductFromCartUsecase(gh<_i1033.CartRepo>()));
    gh.factory<_i1039.GetCartUsecase>(
        () => _i1039.GetCartUsecase(gh<_i1033.CartRepo>()));
    gh.factory<_i637.UpdateProductInCartUsecase>(
        () => _i637.UpdateProductInCartUsecase(gh<_i1033.CartRepo>()));
    gh.factory<_i336.RegisterUseCase>(
        () => _i336.RegisterUseCase(gh<_i913.AuthRepo>()));
    gh.factory<_i316.RegisterCubit>(() => _i316.RegisterCubit(
          gh<_i336.RegisterUseCase>(),
          gh<_i468.Validator>(),
        ));
    gh.factory<_i610.DeleteUserAddressUseCase>(
        () => _i610.DeleteUserAddressUseCase(gh<_i638.SavedAddressesRepo>()));
    gh.factory<_i834.GetUserSavedAddressesUseCase>(() =>
        _i834.GetUserSavedAddressesUseCase(gh<_i638.SavedAddressesRepo>()));
    gh.factory<_i1008.CategoriesCubit>(() => _i1008.CategoriesCubit(
          gh<_i1027.GetCategoriesUseCase>(),
          gh<_i752.GetProductsUseCase>(),
        ));
    gh.factory<_i782.ProfileCubit>(() => _i782.ProfileCubit(
          gh<_i314.GetUserDataUsecase>(),
          gh<_i238.LogoutUseCase>(),
          gh<_i405.GuestModeUseCase>(),
        ));
    gh.factory<_i834.ProductDetailsCubit>(
        () => _i834.ProductDetailsCubit(gh<_i393.AddToCartUseCase>()));
    gh.factory<_i204.LoginCubit>(() => _i204.LoginCubit(
          gh<_i197.LoginUseCase>(),
          gh<_i124.GuestUseCase>(),
          gh<_i468.Validator>(),
        ));
    gh.factory<_i99.CartCubit>(() => _i99.CartCubit(
          gh<_i1039.GetCartUsecase>(),
          gh<_i407.ClearCartUsecase>(),
          gh<_i1010.AddProductToCartUsecase>(),
          gh<_i637.UpdateProductInCartUsecase>(),
          gh<_i715.DeleteProductFromCartUsecase>(),
          gh<_i182.IsGuestUseCase>(),
        ));
    gh.factory<_i700.SavedAddressCubit>(() => _i700.SavedAddressCubit(
          gh<_i834.GetUserSavedAddressesUseCase>(),
          gh<_i610.DeleteUserAddressUseCase>(),
        ));
    return this;
  }
}

class _$SharedPreferenceModule extends _i60.SharedPreferenceModule {}

class _$SecureStorageModule extends _i712.SecureStorageModule {}

class _$LoggerModule extends _i470.LoggerModule {}

class _$DioModule extends _i953.DioModule {}
