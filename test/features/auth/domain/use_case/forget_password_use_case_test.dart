import 'package:ecommerce_flower_app/features/auth/domain/use_case/forget_password_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ecommerce_flower_app/core/utils/datasource_excution/api_result.dart';
import 'package:ecommerce_flower_app/features/auth/data/model/forget_password/forget_password_request_dto.dart';
import 'package:ecommerce_flower_app/features/auth/domain/repo/auth_repo.dart';

import 'forget_password_use_case_test.mocks.dart';

@GenerateMocks([AuthRepo])
void main() {
  late ForgetPasswordUseCase forgetPasswordUseCase;
  late MockAuthRepo mockAuthRepo;

  setUp(() {
    mockAuthRepo = MockAuthRepo();
    forgetPasswordUseCase = ForgetPasswordUseCase(mockAuthRepo);
  });

  group("ForgetPasswordUsecase", () {
    test(
      "should return SuccessResult when repository call is successful",
      () async {
        provideDummy<Result<void>>(SuccessResult<void>(null));

        // Arrange
        final requestDto = ForgetPasswordRequestDto(email: "test@example.com");
        when(
          mockAuthRepo.forgetPassword(requestDto),
        ).thenAnswer((_) async => SuccessResult<void>(null));

        // Act
        final result = await forgetPasswordUseCase.call(requestDto);

        // Assert
        verify(mockAuthRepo.forgetPassword(requestDto)).called(1);
        expect(result, isA<SuccessResult<void>>());
      },
    );

    test("should return FailureResult when repository call fails", () async {
      final exception = Exception("An error occurred");
      provideDummy<Result<void>>(FailureResult<void>(exception));
      // Arrange
      final requestDto = ForgetPasswordRequestDto(email: "test@example.com");
      when(
        mockAuthRepo.forgetPassword(any),
      ).thenAnswer((_) async => FailureResult<void>(exception));

      // Act
      final result = await forgetPasswordUseCase.call(requestDto);

      // Assert
      verify(mockAuthRepo.forgetPassword(requestDto)).called(1);
      expect(result, isA<FailureResult<void>>());
    });
  });
}
