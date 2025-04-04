import 'package:ecommerce_flower_app/core/utils/datasource_excution/api_result.dart';
import 'package:ecommerce_flower_app/features/auth/data/model/verify_reset_code/verify_reset_code_request_dto.dart';
import 'package:ecommerce_flower_app/features/auth/domain/repo/auth_repo.dart';
import 'package:ecommerce_flower_app/features/auth/domain/usecase/verify_reset_code_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'verify_reset_code_usecase_test.mocks.dart';

@GenerateMocks([AuthRepo])
void main() {
  late VerifyResetCodeUsecase verifyResetCodeUsecase;
  late MockAuthRepo mockAuthRepo;

  setUp(() {
    mockAuthRepo = MockAuthRepo();
    verifyResetCodeUsecase = VerifyResetCodeUsecase(mockAuthRepo);
  });

  group('VerifyResetCodeUsecase', () {
    test('should return success when the code is valid', () async {
      provideDummy<Result<void>>(SuccessResult<void>(null));

      // Arrange
      final requestDto = VerifyResetCodeRequestDto(resetCode: '123456');
      when(
        mockAuthRepo.verifyResetCode(requestDto),
      ).thenAnswer((_) async => SuccessResult<void>(null));

      // Act
      final result = await verifyResetCodeUsecase(requestDto);

      // Assert
      verify(mockAuthRepo.verifyResetCode(requestDto)).called(1);
      expect(result, isA<SuccessResult<void>>());
    });

    test('should return failure when the code is invalid', () async {
      provideDummy<Result<void>>(
        FailureResult<void>(Exception('Invalid code')),
      );
      // Arrange
      final requestDto = VerifyResetCodeRequestDto(resetCode: '123456');
      when(
        mockAuthRepo.verifyResetCode(requestDto),
      ).thenAnswer((_) async => FailureResult<void>(Exception('Invalid code')));

      // Act
      final result = await verifyResetCodeUsecase(requestDto);

      // Assert
      verify(mockAuthRepo.verifyResetCode(requestDto)).called(1);
      expect(result, isA<FailureResult<void>>());
    });
  });
}
