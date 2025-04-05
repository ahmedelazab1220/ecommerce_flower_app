import 'package:ecommerce_flower_app/core/utils/datasource_excution/api_manager.dart';
import 'package:ecommerce_flower_app/core/utils/datasource_excution/api_result.dart';
import 'package:ecommerce_flower_app/features/home/data/data_source/contract/home_remote_data_source.dart';
import 'package:ecommerce_flower_app/features/home/data/repo_impl/home_repo_impl.dart';
import 'package:ecommerce_flower_app/features/home/domain/entity/home_response_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../constants_test.dart';
import '../models/home_model_test.dart';
import 'home_repo_impl_test.mocks.dart';

@GenerateMocks([ApiManager, HomeRemoteDataSource])
void main() {
  late HomeRepoImpl homeRepoImpl;
  late MockApiManager mockApiManager;
  late MockHomeRemoteDataSource mockHomeRemoteDataSource;

  setUp(() {
    mockApiManager = MockApiManager();
    mockHomeRemoteDataSource = MockHomeRemoteDataSource();
    homeRepoImpl = HomeRepoImpl(mockHomeRemoteDataSource, mockApiManager);
  });

  group('getHomeData', () {
    test(
      'should return success Result<HomeResponseEntity> when data is fetched and mapped correctly',
      () async {
        // Arrange
        final dto = HomeModelTest.success();

        var actualresult = SuccessResult<HomeResponseEntity>(dto.toEntity());
        provideDummy<Result<HomeResponseEntity>>(actualresult);

        when(
          mockHomeRemoteDataSource.getHomeData(),
        ).thenAnswer((_) async => dto);

        when(mockApiManager.execute<HomeResponseEntity>(any)).thenAnswer((
          invocation,
        ) async {
          final callback =
              invocation.positionalArguments.first
                  as Future<HomeResponseEntity> Function();
          return SuccessResult(await callback());
        });

        // Act
        final result = await homeRepoImpl.getHomeData();

        // Assert
        expect(result, isA<SuccessResult<HomeResponseEntity>>());
        expect(actualresult.data.message, equals(ConstantsTest.successMessage));
        verify(mockHomeRemoteDataSource.getHomeData()).called(1);
        verify(mockApiManager.execute<HomeResponseEntity>(any)).called(1);
      },
    );

    test('should return FailureResult when API manager throws error', () async {
      // Arrange
      var actualresult = FailureResult<HomeResponseEntity>(
        Exception(ConstantsTest.apiError),
      );
      provideDummy<Result<HomeResponseEntity>>(actualresult);

      when(
        mockApiManager.execute<HomeResponseEntity>(any),
      ).thenAnswer((_) async => actualresult);

      when(mockHomeRemoteDataSource.getHomeData()).thenThrow(Exception());

      final result = await homeRepoImpl.getHomeData();

      expect(result, isA<FailureResult<HomeResponseEntity>>());
      verify(mockApiManager.execute<HomeResponseEntity>(any)).called(1);
      verifyNever(mockHomeRemoteDataSource.getHomeData());
    });

    test(
      'should return FailureResult when HomeRemoteDataSource throws',
      () async {
        // Arrange
        var actualresult = FailureResult<HomeResponseEntity>(
          Exception(ConstantsTest.networkError),
        );

        provideDummy<Result<HomeResponseEntity>>(actualresult);

        when(
          mockHomeRemoteDataSource.getHomeData(),
        ).thenThrow(Exception(ConstantsTest.networkError));

        when(mockApiManager.execute<HomeResponseEntity>(any)).thenAnswer((
          invocation,
        ) async {
          final callback =
              invocation.positionalArguments.first
                  as Future<HomeResponseEntity> Function();

          try {
            final result = await callback();
            return SuccessResult(result);
          } catch (e) {
            return actualresult;
          }
        });

        // Act
        final result = await homeRepoImpl.getHomeData();

        // Assert
        expect(result, isA<FailureResult<HomeResponseEntity>>());
        final failure = result as FailureResult<HomeResponseEntity>;
        expect(
          failure.exception.toString(),
          equals('${ConstantsTest.exception}: ${ConstantsTest.networkError}'),
        );

        // Verify interactions
        verify(mockHomeRemoteDataSource.getHomeData()).called(1);
        verify(mockApiManager.execute<HomeResponseEntity>(any)).called(1);
      },
    );
  });
}
