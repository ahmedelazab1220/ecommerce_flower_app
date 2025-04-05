// Mocks generated by Mockito 5.4.5 from annotations
// in ecommerce_flower_app/test/features/home/data/repo_impl/home_repo_impl_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:ecommerce_flower_app/core/utils/datasource_excution/api_manager.dart'
    as _i3;
import 'package:ecommerce_flower_app/core/utils/datasource_excution/api_result.dart'
    as _i5;
import 'package:ecommerce_flower_app/features/home/data/data_source/contract/home_remote_data_source.dart'
    as _i7;
import 'package:ecommerce_flower_app/features/home/data/models/response/home_response_dto.dart'
    as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i6;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: must_be_immutable
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeHomeResponseDto_0 extends _i1.SmartFake
    implements _i2.HomeResponseDto {
  _FakeHomeResponseDto_0(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

/// A class which mocks [ApiManager].
///
/// See the documentation for Mockito's code generation for more information.
class MockApiManager extends _i1.Mock implements _i3.ApiManager {
  MockApiManager() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i5.Result<T>> execute<T>(_i4.Future<T> Function()? apiCall) =>
      (super.noSuchMethod(
            Invocation.method(#execute, [apiCall]),
            returnValue: _i4.Future<_i5.Result<T>>.value(
              _i6.dummyValue<_i5.Result<T>>(
                this,
                Invocation.method(#execute, [apiCall]),
              ),
            ),
          )
          as _i4.Future<_i5.Result<T>>);
}

/// A class which mocks [HomeRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockHomeRemoteDataSource extends _i1.Mock
    implements _i7.HomeRemoteDataSource {
  MockHomeRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.HomeResponseDto> getHomeData() =>
      (super.noSuchMethod(
            Invocation.method(#getHomeData, []),
            returnValue: _i4.Future<_i2.HomeResponseDto>.value(
              _FakeHomeResponseDto_0(this, Invocation.method(#getHomeData, [])),
            ),
          )
          as _i4.Future<_i2.HomeResponseDto>);
}
