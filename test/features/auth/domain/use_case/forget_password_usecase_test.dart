import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ecommerce_flower_app/core/utils/datasource_excution/api_result.dart';
import 'package:ecommerce_flower_app/features/auth/data/model/forget_password/forget_password_request_dto.dart';
import 'package:ecommerce_flower_app/features/auth/domain/repo/auth_repo.dart';
import 'package:ecommerce_flower_app/features/auth/domain/usecase/forget_password_usecase.dart';

import 'forget_password_usecase_test.mocks.dart';

@GenerateMocks([AuthRepo])
void main() {
  late ForgetPasswordUsecase forgetPasswordUsecase;
  late MockAuthRepo mockAuthRepo;

  setUp(() {
    mockAuthRepo = MockAuthRepo();
    forgetPasswordUsecase = ForgetPasswordUsecase(mockAuthRepo);
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
        final result = await forgetPasswordUsecase.call(requestDto);

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
      final result = await forgetPasswordUsecase.call(requestDto);

      // Assert
      verify(mockAuthRepo.forgetPassword(requestDto)).called(1);
      expect(result, isA<FailureResult<void>>());
    });
  });
}
