import 'package:ecommerce_flower_app/core/base/base_state.dart';
import 'package:ecommerce_flower_app/core/utils/datasource_excution/api_result.dart';
import 'package:ecommerce_flower_app/core/utils/validator/validator.dart';
import 'package:ecommerce_flower_app/features/auth/data/model/forget_password/forget_password_request_dto.dart';
import 'package:ecommerce_flower_app/features/auth/domain/use_case/forget_password_use_case.dart';
import 'package:ecommerce_flower_app/features/auth/presentation/view_model/forget_password/forget_password_cubit.dart';
import 'package:ecommerce_flower_app/features/auth/presentation/view_model/forget_password/forget_password_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'forget_password_cubit_test.mocks.dart';

@GenerateMocks([ForgetPasswordUseCase, Validator])
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late ForgetPasswordCubit forgetPasswordCubit;
  late MockForgetPasswordUseCase mockForgetPasswordUseCase;
  late MockValidator mockValidator;

  setUp(() {
    mockForgetPasswordUseCase = MockForgetPasswordUseCase();
    mockValidator = MockValidator();
    forgetPasswordCubit = ForgetPasswordCubit(
      mockForgetPasswordUseCase,
      mockValidator,
    );
  });

  group('ForgetPasswordCubit', () {
    test('initial state is ForgetPasswordState with BaseInitialState', () {
      // Arrange
      // Act
      // Assert
      expect(forgetPasswordCubit.state.baseState, isA<BaseInitialState>());
    });

    // when _forgetPassword is successful
    test(
      'doIntent should emit BaseSuccessState when _forgetPassword is successful',
      () async {
        provideDummy<Result<void>>(SuccessResult<void>(null));

        // Arrange
        const email = "test@example.com";
        forgetPasswordCubit.emailController.text = email;
        final requestDto = ForgetPasswordRequestDto(email: email);
        when(mockValidator.validateEmail(email)).thenReturn(null);
        when(
          mockForgetPasswordUseCase.call(
            argThat(
              isA<ForgetPasswordRequestDto>().having(
                (dto) => dto.email,
                'email',
                email,
              ),
            ),
          ),
        ).thenAnswer((_) async => SuccessResult<void>(null));

        // Assert Later
        final expected = [
          predicate<ForgetPasswordState>(
            (state) => state.baseState is BaseLoadingState,
          ),
          predicate<ForgetPasswordState>(
            (state) => state.baseState is BaseSuccessState,
          ),
        ];
        expectLater(forgetPasswordCubit.stream, emitsInOrder(expected));

        // Act
        forgetPasswordCubit.doIntent(ForgetPasswordRequestAction());
      },
    );

    // when _forgetPassword fails
    test(
      'doIntent should emit BaseErrorState when _forgetPassword fails',
      () async {
        final exception = Exception("An error occurred");
        provideDummy<Result<void>>(FailureResult<void>(exception));
        // Arrange
        const email = "";
        forgetPasswordCubit.emailController.text = email;
        final requestDto = ForgetPasswordRequestDto(email: email);
        when(mockValidator.validateEmail(email)).thenReturn("Invalid email");
        when(
          mockForgetPasswordUseCase.call(
            argThat(
              isA<ForgetPasswordRequestDto>().having(
                (dto) => dto.email,
                'email',
                email,
              ),
            ),
          ),
        ).thenAnswer((_) async => FailureResult<void>(exception));
        // Assert Later
        final expected = [
          predicate<ForgetPasswordState>(
            (state) => state.baseState is BaseLoadingState,
          ),
          predicate<ForgetPasswordState>(
            (state) => state.baseState is BaseErrorState,
          ),
        ];
        expectLater(forgetPasswordCubit.stream, emitsInOrder(expected));
        // Act
        forgetPasswordCubit.doIntent(ForgetPasswordRequestAction());
      },
    );

    // when cubit is closed
    test('close should dispose emailController', () async {
      // Arrange
      const email = "test@example.com";
      // Act
      await forgetPasswordCubit.close();

      // Assert
      expect(
        () => forgetPasswordCubit.emailController.text = email,
        throwsA(isA<AssertionError>()),
      );
    });
  });
}
