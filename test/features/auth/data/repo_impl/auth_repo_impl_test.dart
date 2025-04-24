import 'package:ecommerce_flower_app/core/utils/datasource_excution/api_manager.dart';
import 'package:ecommerce_flower_app/core/utils/datasource_excution/api_result.dart';
import 'package:ecommerce_flower_app/features/auth/data/data_source/contract/auth_local_data_source.dart';
import 'package:ecommerce_flower_app/features/auth/data/data_source/contract/auth_remote_data_source.dart';
import 'package:ecommerce_flower_app/features/auth/data/model/forget_password/forget_password_request_dto.dart';
import 'package:ecommerce_flower_app/features/auth/data/model/forget_password/forget_password_response_dto.dart';
import 'package:ecommerce_flower_app/features/auth/data/model/reset_password/reset_password_request_dto.dart';
import 'package:ecommerce_flower_app/features/auth/data/model/reset_password/reset_password_response_dto.dart';
import 'package:ecommerce_flower_app/features/auth/data/model/verify_reset_code/verify_reset_code_request_dto.dart';
import 'package:ecommerce_flower_app/features/auth/data/model/verify_reset_code/verify_reset_code_response_dto.dart';
import 'package:ecommerce_flower_app/features/auth/data/repo_impl/auth_repo_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'auth_repo_impl_test.mocks.dart';

@GenerateMocks([ApiManager, AuthRemoteDataSource, AuthLocalDataSource])
void main() {
  late AuthRepoImpl authRepoImpl;
  late MockApiManager mockApiManager;
  late MockAuthRemoteDataSource mockAuthRemoteDataSource;
  late MockAuthLocalDataSource mockAuthLocalDataSource;

  setUp(() {
    mockApiManager = MockApiManager();
    mockAuthRemoteDataSource = MockAuthRemoteDataSource();
    mockAuthLocalDataSource = MockAuthLocalDataSource();
    authRepoImpl = AuthRepoImpl(
      mockAuthRemoteDataSource,
      mockAuthLocalDataSource,
      mockApiManager,
    );
  });

  group("Auth Repo Test", () {
    test("Forget Password Test", () async {
      // Arrange
      final requestDto = ForgetPasswordRequestDto(email: "test@example.com");
      when(
        mockAuthRemoteDataSource.forgetPassword(requestDto),
      ).thenAnswer((_) async => ForgetPasswordResponseDto());

      // Act
      final result = await authRepoImpl.forgetPassword(requestDto);

      // Assert
      verify(mockAuthRemoteDataSource.forgetPassword(requestDto)).called(1);
      expect(result, isA<SuccessResult<void>>());
    });

    test("Verify Reset Code Test", () async {
      // Arrange
      final requestDto = VerifyResetCodeRequestDto(resetCode: '123456');
      when(
        mockAuthRemoteDataSource.verifyResetCode(requestDto),
      ).thenAnswer((_) async => VerifyResetCodeResponseDto());

      // Act
      final result = await authRepoImpl.verifyResetCode(requestDto);

      // Assert
      verify(mockAuthRemoteDataSource.verifyResetCode(requestDto)).called(1);
      expect(result, isA<SuccessResult<void>>());
    });

    test("Reset Password Test", () async {
      // Arrange
      final requestDto = ResetPasswordRequestDto(
        email: "test@example.com",
        newPassword: "Test@123",
      );
      when(
        mockAuthRemoteDataSource.resetPassword(requestDto),
      ).thenAnswer((_) async => ResetPasswordResponseDto());

      // Act
      final result = await authRepoImpl.resetPassword(requestDto);

      // Assert
      verify(mockAuthRemoteDataSource.resetPassword(requestDto)).called(1);
      expect(result, isA<SuccessResult<void>>());
    });
  });
}
