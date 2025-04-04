import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ecommerce_flower_app/core/utils/datasource_excution/api_constants.dart';
import 'package:ecommerce_flower_app/features/home/data/api/home_retrofit_client.dart';
import 'package:ecommerce_flower_app/features/home/data/data_source/remote/home_remote_data_source_impl.dart';
import 'package:ecommerce_flower_app/features/home/data/models/response/home_response_dto.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'home_remote_data_source_impl_test.mocks.dart';

@GenerateMocks([HomeRetrofitClient])
void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  late HomeRemoteDataSourceImpl dataSource;
  late MockHomeRetrofitClient mockHomeRetrofitClient;

  const String successMessage = "Success";
  const String networkError = "Network error";
  const String type = 'type';
  const String forbidden = 'Forbidden';
  const String notFound = 'Not Found';
  const String statusCode = 'statusCode';
  const String unauthorized = 'Unauthorized';
  const int unauthorizedStatusCode = 401;
  const int forbiddenStatusCode = 403;
  const int clientErrorStatusCode = 404;

  setUp(() {
    mockHomeRetrofitClient = MockHomeRetrofitClient();
    dataSource = HomeRemoteDataSourceImpl(mockHomeRetrofitClient);
  });

  group('getHomeData', () {
    test(
      'should return HomeResponseDto when the call to the remote data source is successful',
      () async {
        // Arrange
        final dummyHomeResponseDto = HomeResponseDto(
          message: successMessage,
          products: [],
          categories: [],
          bestSeller: [],
          occasions: [],
        );

        // Provide a dummy instance of HomeResponseDto
        provideDummy<HomeResponseDto>(dummyHomeResponseDto);

        when(
          mockHomeRetrofitClient.getHomeData(),
        ).thenAnswer((_) async => dummyHomeResponseDto);

        // Act
        final result = await dataSource.getHomeData();

        // Assert
        expect(result, equals(dummyHomeResponseDto));
        expect(result.message, equals(successMessage));
        verify(mockHomeRetrofitClient.getHomeData()).called(1);
        verifyNoMoreInteractions(mockHomeRetrofitClient);
      },
    );

    test('should throw an exception when the API call fails', () async {
      // Arrange: Simulate API failure
      when(mockHomeRetrofitClient.getHomeData()).thenThrow(Exception());

      // Act & Assert: Ensure an exception is thrown
      expect(() => dataSource.getHomeData(), throwsException);
      verify(mockHomeRetrofitClient.getHomeData()).called(1);
      verifyNoMoreInteractions(mockHomeRetrofitClient);
    });

    test(
      'should throw a network error when there is a network failure (SocketException)',
      () async {
        // Arrange: Simulate network failure
        when(
          mockHomeRetrofitClient.getHomeData(),
        ).thenThrow(const SocketException(networkError));

        // Act & Assert: Ensure a SocketException is thrown
        expect(() => dataSource.getHomeData(), throwsA(isA<SocketException>()));
        verify(mockHomeRetrofitClient.getHomeData()).called(1);
        verifyNoMoreInteractions(mockHomeRetrofitClient);
      },
    );

    test(
      'should throw a timeout error when the API call takes longer than the timeout',
      () async {
        // Arrange: Simulate network failure (connection timeout)
        when(mockHomeRetrofitClient.getHomeData()).thenThrow(
          DioException(
            requestOptions: RequestOptions(path: ApiConstants.homeTabRoute),
            type: DioExceptionType.connectionTimeout,
          ),
        );

        // Act & Assert: Ensure a DioError is thrown with the expected type
        expect(
          () => dataSource.getHomeData(),
          throwsA(
            isA<DioException>().having(
              (e) => e.type,
              type,
              DioExceptionType.connectionTimeout,
            ),
          ),
        );

        // Verify the method was called
        verify(mockHomeRetrofitClient.getHomeData()).called(1);
        verifyNoMoreInteractions(mockHomeRetrofitClient);
      },
    );

    test(
      'should throw an error when the API call returns a forbidden error (403)',
      () async {
        // Arrange: Simulate a forbidden error (403)
        when(mockHomeRetrofitClient.getHomeData()).thenThrow(
          DioException(
            requestOptions: RequestOptions(path: ApiConstants.homeTabRoute),
            response: Response(
              requestOptions: RequestOptions(path: ApiConstants.homeTabRoute),
              statusCode: forbiddenStatusCode,
              data: forbidden,
            ),
            type: DioExceptionType.badResponse,
          ),
        );

        // Act & Assert: Ensure a DioError is thrown with the expected type
        expect(
          () => dataSource.getHomeData(),
          throwsA(
            isA<DioException>().having(
              (e) => e.type,
              type,
              DioExceptionType.badResponse,
            ),
          ),
        );

        // Verify the method was called
        verify(mockHomeRetrofitClient.getHomeData()).called(1);
        verifyNoMoreInteractions(mockHomeRetrofitClient);
      },
    );

    test(
      'should throw an error when the API call returns a client error (4xx)',
      () async {
        // Arrange: Simulate a 404 client error
        when(mockHomeRetrofitClient.getHomeData()).thenThrow(
          DioException(
            requestOptions: RequestOptions(path: ApiConstants.homeTabRoute),
            response: Response(
              requestOptions: RequestOptions(path: ApiConstants.homeTabRoute),
              statusCode: clientErrorStatusCode,
              data: notFound,
            ),
            type: DioExceptionType.badResponse,
          ),
        );

        // Act & Assert: Ensure a DioException with status code 404 is thrown
        expect(
          () => dataSource.getHomeData(),
          throwsA(
            isA<DioException>().having(
              (e) => e.response?.statusCode,
              statusCode,
              clientErrorStatusCode,
            ),
          ),
        );

        // Verify the method was called
        verify(mockHomeRetrofitClient.getHomeData()).called(1);
        verifyNoMoreInteractions(mockHomeRetrofitClient);
      },
    );

    test(
      'should throw an error when the API call returns an authentication error (401)',
      () async {
        // Arrange: Simulate an authentication error (401 Unauthorized)
        when(mockHomeRetrofitClient.getHomeData()).thenThrow(
          DioException(
            requestOptions: RequestOptions(path: ApiConstants.homeTabRoute),
            response: Response(
              requestOptions: RequestOptions(path: ApiConstants.homeTabRoute),
              statusCode: unauthorizedStatusCode,
              data: unauthorized,
            ),
            type: DioExceptionType.badResponse,
          ),
        );

        // Act & Assert: Ensure a DioException with status code 401 is thrown
        expect(
          () => dataSource.getHomeData(),
          throwsA(
            isA<DioException>().having(
              (e) => e.response?.statusCode,
              statusCode,
              unauthorizedStatusCode,
            ),
          ),
        );

        // Verify the method was called
        verify(mockHomeRetrofitClient.getHomeData()).called(1);
        verifyNoMoreInteractions(mockHomeRetrofitClient);
      },
    );

    test(
      'should handle missing fields in the API response gracefully',
      () async {
        // Arrange: Simulate an API response with missing fields (e.g., message)
        final incompleteResponse = HomeResponseDto(
          message: "",
          products: [],
          categories: [],
          bestSeller: [],
          occasions: [],
        );

        when(mockHomeRetrofitClient.getHomeData()).thenAnswer(
          (_) async => incompleteResponse, // Simulate incomplete response
        );

        // Act
        final result = await dataSource.getHomeData();

        // Assert: Ensure the result handles missing fields correctly
        expect(result.message, isEmpty);
        expect(result.products, isEmpty);
        expect(result.categories, isEmpty);
        expect(result.bestSeller, isEmpty);
        expect(result.occasions, isEmpty);
        verify(mockHomeRetrofitClient.getHomeData()).called(1);
        verifyNoMoreInteractions(mockHomeRetrofitClient);
      },
    );
  });
}
