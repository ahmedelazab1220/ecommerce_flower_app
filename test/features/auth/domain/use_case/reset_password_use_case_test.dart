import 'package:ecommerce_flower_app/features/auth/data/model/reset_password/reset_password_request_dto.dart';
import 'package:ecommerce_flower_app/features/auth/domain/use_case/reset_password_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ecommerce_flower_app/core/utils/datasource_excution/api_result.dart';
import 'package:ecommerce_flower_app/features/auth/domain/repo/auth_repo.dart';

import 'reset_password_use_case_test.mocks.dart';

@GenerateMocks([AuthRepo])
void main() {
  late ResetPasswordUseCase resetPasswordUsecase;
  late MockAuthRepo mockAuthRepo;

  setUp(() {
    mockAuthRepo = MockAuthRepo();
    resetPasswordUsecase = ResetPasswordUseCase(mockAuthRepo);
  });

  group("ResetPasswordUsecase", () {
    test(
      "should return SuccessResult when repository call is successful",
      () async {
        provideDummy<Result<void>>(SuccessResult<void>(null));

        // Arrange
        final requestDto = ResetPasswordRequestDto(
          email: "test@example.com",
          newPassword: "Test#123",
        );
        when(
          mockAuthRepo.resetPassword(requestDto),
        ).thenAnswer((_) async => SuccessResult<void>(null));
        // Act
        final result = await resetPasswordUsecase.call(requestDto);

        // Assert
        verify(mockAuthRepo.resetPassword(requestDto)).called(1);
        expect(result, isA<SuccessResult<void>>());
      },
    );

    test("should return FailureResult when repository call fails", () async {
      final exception = Exception("An error occurred");

      provideDummy<Result<void>>(FailureResult<void>(exception));
      // Arrange
      final requestDto = ResetPasswordRequestDto(
        email: "test@example.com",
        newPassword: "Test#123",
      );
      when(
        mockAuthRepo.resetPassword(requestDto),
      ).thenAnswer((_) async => FailureResult<void>(exception));
      // Act
      final result = await resetPasswordUsecase.call(requestDto);
      // Assert
      verify(mockAuthRepo.resetPassword(requestDto)).called(1);
      expect(result, isA<FailureResult<void>>());
    });
  });
}
