import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/utils/datasource_excution/api_constants.dart';
import '../model/delete_notification_by_id_response_dto.dart';
import '../model/get_all_notification_response_dto.dart';
import '../model/get_notification_by_id_response_dto.dart';

part 'notification_retrofit_client.g.dart';

@singleton
@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class NotificationRetrofitClient {
  @factoryMethod
  factory NotificationRetrofitClient(Dio dio) = _NotificationRetrofitClient;

  @GET(ApiConstants.notificationsRoute)
  Future<GetAllNotificationResponseDto> getNotifications();

  @GET("${ApiConstants.notificationsRoute}/{id}")
  Future<GetNotificationByIdResponseDto> getNotificationsById(
    @Path("id") String id,
  );

  @DELETE("${ApiConstants.notificationsRoute}/{id}")
  Future<DeleteNotificationByIdResponseDto> deleteNotification(
    @Path("id") String id,
  );
}
