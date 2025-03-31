// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'github_token_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$GithubTokenState {
  String? get githubToken => throw _privateConstructorUsedError;

  /// Create a copy of GithubTokenState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GithubTokenStateCopyWith<GithubTokenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GithubTokenStateCopyWith<$Res> {
  factory $GithubTokenStateCopyWith(
    GithubTokenState value,
    $Res Function(GithubTokenState) then,
  ) = _$GithubTokenStateCopyWithImpl<$Res, GithubTokenState>;
  @useResult
  $Res call({String? githubToken});
}

/// @nodoc
class _$GithubTokenStateCopyWithImpl<$Res, $Val extends GithubTokenState>
    implements $GithubTokenStateCopyWith<$Res> {
  _$GithubTokenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GithubTokenState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? githubToken = freezed}) {
    return _then(
      _value.copyWith(
            githubToken:
                freezed == githubToken
                    ? _value.githubToken
                    : githubToken // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$GithubTokenStateImplCopyWith<$Res>
    implements $GithubTokenStateCopyWith<$Res> {
  factory _$$GithubTokenStateImplCopyWith(
    _$GithubTokenStateImpl value,
    $Res Function(_$GithubTokenStateImpl) then,
  ) = __$$GithubTokenStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? githubToken});
}

/// @nodoc
class __$$GithubTokenStateImplCopyWithImpl<$Res>
    extends _$GithubTokenStateCopyWithImpl<$Res, _$GithubTokenStateImpl>
    implements _$$GithubTokenStateImplCopyWith<$Res> {
  __$$GithubTokenStateImplCopyWithImpl(
    _$GithubTokenStateImpl _value,
    $Res Function(_$GithubTokenStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GithubTokenState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? githubToken = freezed}) {
    return _then(
      _$GithubTokenStateImpl(
        githubToken:
            freezed == githubToken
                ? _value.githubToken
                : githubToken // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc

class _$GithubTokenStateImpl extends _GithubTokenState {
  _$GithubTokenStateImpl({this.githubToken}) : super._();

  @override
  final String? githubToken;

  @override
  String toString() {
    return 'GithubTokenState(githubToken: $githubToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GithubTokenStateImpl &&
            (identical(other.githubToken, githubToken) ||
                other.githubToken == githubToken));
  }

  @override
  int get hashCode => Object.hash(runtimeType, githubToken);

  /// Create a copy of GithubTokenState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GithubTokenStateImplCopyWith<_$GithubTokenStateImpl> get copyWith =>
      __$$GithubTokenStateImplCopyWithImpl<_$GithubTokenStateImpl>(
        this,
        _$identity,
      );
}

abstract class _GithubTokenState extends GithubTokenState {
  factory _GithubTokenState({final String? githubToken}) =
      _$GithubTokenStateImpl;
  _GithubTokenState._() : super._();

  @override
  String? get githubToken;

  /// Create a copy of GithubTokenState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GithubTokenStateImplCopyWith<_$GithubTokenStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
