// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Result<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data) success,
    required TResult Function(Cause cause, ResultStackTrace stackTrace)
        exception,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(T data)? success,
    TResult Function(Cause cause, ResultStackTrace stackTrace)? exception,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data)? success,
    TResult Function(Cause cause, ResultStackTrace stackTrace)? exception,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Success<T> value) success,
    required TResult Function(Exception<T> value) exception,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Success<T> value)? success,
    TResult Function(Exception<T> value)? exception,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Success<T> value)? success,
    TResult Function(Exception<T> value)? exception,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResultCopyWith<T, $Res> {
  factory $ResultCopyWith(Result<T> value, $Res Function(Result<T>) then) =
      _$ResultCopyWithImpl<T, $Res>;
}

/// @nodoc
class _$ResultCopyWithImpl<T, $Res> implements $ResultCopyWith<T, $Res> {
  _$ResultCopyWithImpl(this._value, this._then);

  final Result<T> _value;
  // ignore: unused_field
  final $Res Function(Result<T>) _then;
}

/// @nodoc
abstract class _$$SuccessCopyWith<T, $Res> {
  factory _$$SuccessCopyWith(
          _$Success<T> value, $Res Function(_$Success<T>) then) =
      __$$SuccessCopyWithImpl<T, $Res>;
  $Res call({T data});
}

/// @nodoc
class __$$SuccessCopyWithImpl<T, $Res> extends _$ResultCopyWithImpl<T, $Res>
    implements _$$SuccessCopyWith<T, $Res> {
  __$$SuccessCopyWithImpl(
      _$Success<T> _value, $Res Function(_$Success<T>) _then)
      : super(_value, (v) => _then(v as _$Success<T>));

  @override
  _$Success<T> get _value => super._value as _$Success<T>;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$Success<T>(
      data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$Success<T> implements Success<T> {
  const _$Success(this.data);

  @override
  final T data;

  @override
  String toString() {
    return 'Result<$T>.success(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Success<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  _$$SuccessCopyWith<T, _$Success<T>> get copyWith =>
      __$$SuccessCopyWithImpl<T, _$Success<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data) success,
    required TResult Function(Cause cause, ResultStackTrace stackTrace)
        exception,
  }) {
    return success(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(T data)? success,
    TResult Function(Cause cause, ResultStackTrace stackTrace)? exception,
  }) {
    return success?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data)? success,
    TResult Function(Cause cause, ResultStackTrace stackTrace)? exception,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Success<T> value) success,
    required TResult Function(Exception<T> value) exception,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Success<T> value)? success,
    TResult Function(Exception<T> value)? exception,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Success<T> value)? success,
    TResult Function(Exception<T> value)? exception,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class Success<T> implements Result<T> {
  const factory Success(final T data) = _$Success<T>;

  T get data;
  @JsonKey(ignore: true)
  _$$SuccessCopyWith<T, _$Success<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ExceptionCopyWith<T, $Res> {
  factory _$$ExceptionCopyWith(
          _$Exception<T> value, $Res Function(_$Exception<T>) then) =
      __$$ExceptionCopyWithImpl<T, $Res>;
  $Res call({Cause cause, ResultStackTrace stackTrace});
}

/// @nodoc
class __$$ExceptionCopyWithImpl<T, $Res> extends _$ResultCopyWithImpl<T, $Res>
    implements _$$ExceptionCopyWith<T, $Res> {
  __$$ExceptionCopyWithImpl(
      _$Exception<T> _value, $Res Function(_$Exception<T>) _then)
      : super(_value, (v) => _then(v as _$Exception<T>));

  @override
  _$Exception<T> get _value => super._value as _$Exception<T>;

  @override
  $Res call({
    Object? cause = freezed,
    Object? stackTrace = freezed,
  }) {
    return _then(_$Exception<T>(
      cause == freezed
          ? _value.cause
          : cause // ignore: cast_nullable_to_non_nullable
              as Cause,
      stackTrace == freezed
          ? _value.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as ResultStackTrace,
    ));
  }
}

/// @nodoc

class _$Exception<T> implements Exception<T> {
  const _$Exception(this.cause, this.stackTrace);

  @override
  final Cause cause;
  @override
  final ResultStackTrace stackTrace;

  @override
  String toString() {
    return 'Result<$T>.exception(cause: $cause, stackTrace: $stackTrace)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Exception<T> &&
            const DeepCollectionEquality().equals(other.cause, cause) &&
            const DeepCollectionEquality()
                .equals(other.stackTrace, stackTrace));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(cause),
      const DeepCollectionEquality().hash(stackTrace));

  @JsonKey(ignore: true)
  @override
  _$$ExceptionCopyWith<T, _$Exception<T>> get copyWith =>
      __$$ExceptionCopyWithImpl<T, _$Exception<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data) success,
    required TResult Function(Cause cause, ResultStackTrace stackTrace)
        exception,
  }) {
    return exception(cause, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(T data)? success,
    TResult Function(Cause cause, ResultStackTrace stackTrace)? exception,
  }) {
    return exception?.call(cause, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data)? success,
    TResult Function(Cause cause, ResultStackTrace stackTrace)? exception,
    required TResult orElse(),
  }) {
    if (exception != null) {
      return exception(cause, stackTrace);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Success<T> value) success,
    required TResult Function(Exception<T> value) exception,
  }) {
    return exception(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Success<T> value)? success,
    TResult Function(Exception<T> value)? exception,
  }) {
    return exception?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Success<T> value)? success,
    TResult Function(Exception<T> value)? exception,
    required TResult orElse(),
  }) {
    if (exception != null) {
      return exception(this);
    }
    return orElse();
  }
}

abstract class Exception<T> implements Result<T> {
  const factory Exception(
      final Cause cause, final ResultStackTrace stackTrace) = _$Exception<T>;

  Cause get cause;
  ResultStackTrace get stackTrace;
  @JsonKey(ignore: true)
  _$$ExceptionCopyWith<T, _$Exception<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
