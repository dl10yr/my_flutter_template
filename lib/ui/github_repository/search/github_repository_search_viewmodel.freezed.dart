// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'github_repository_search_viewmodel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$GithubRepositorySearchState {
  List<GithubRepository> get repositories => throw _privateConstructorUsedError;
  bool get incompleteResults => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;

  /// Create a copy of GithubRepositorySearchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GithubRepositorySearchStateCopyWith<GithubRepositorySearchState>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GithubRepositorySearchStateCopyWith<$Res> {
  factory $GithubRepositorySearchStateCopyWith(
    GithubRepositorySearchState value,
    $Res Function(GithubRepositorySearchState) then,
  ) =
      _$GithubRepositorySearchStateCopyWithImpl<
        $Res,
        GithubRepositorySearchState
      >;
  @useResult
  $Res call({
    List<GithubRepository> repositories,
    bool incompleteResults,
    int page,
  });
}

/// @nodoc
class _$GithubRepositorySearchStateCopyWithImpl<
  $Res,
  $Val extends GithubRepositorySearchState
>
    implements $GithubRepositorySearchStateCopyWith<$Res> {
  _$GithubRepositorySearchStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GithubRepositorySearchState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? repositories = null,
    Object? incompleteResults = null,
    Object? page = null,
  }) {
    return _then(
      _value.copyWith(
            repositories:
                null == repositories
                    ? _value.repositories
                    : repositories // ignore: cast_nullable_to_non_nullable
                        as List<GithubRepository>,
            incompleteResults:
                null == incompleteResults
                    ? _value.incompleteResults
                    : incompleteResults // ignore: cast_nullable_to_non_nullable
                        as bool,
            page:
                null == page
                    ? _value.page
                    : page // ignore: cast_nullable_to_non_nullable
                        as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$GithubRepositorySearchStateImplCopyWith<$Res>
    implements $GithubRepositorySearchStateCopyWith<$Res> {
  factory _$$GithubRepositorySearchStateImplCopyWith(
    _$GithubRepositorySearchStateImpl value,
    $Res Function(_$GithubRepositorySearchStateImpl) then,
  ) = __$$GithubRepositorySearchStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<GithubRepository> repositories,
    bool incompleteResults,
    int page,
  });
}

/// @nodoc
class __$$GithubRepositorySearchStateImplCopyWithImpl<$Res>
    extends
        _$GithubRepositorySearchStateCopyWithImpl<
          $Res,
          _$GithubRepositorySearchStateImpl
        >
    implements _$$GithubRepositorySearchStateImplCopyWith<$Res> {
  __$$GithubRepositorySearchStateImplCopyWithImpl(
    _$GithubRepositorySearchStateImpl _value,
    $Res Function(_$GithubRepositorySearchStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GithubRepositorySearchState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? repositories = null,
    Object? incompleteResults = null,
    Object? page = null,
  }) {
    return _then(
      _$GithubRepositorySearchStateImpl(
        repositories:
            null == repositories
                ? _value._repositories
                : repositories // ignore: cast_nullable_to_non_nullable
                    as List<GithubRepository>,
        incompleteResults:
            null == incompleteResults
                ? _value.incompleteResults
                : incompleteResults // ignore: cast_nullable_to_non_nullable
                    as bool,
        page:
            null == page
                ? _value.page
                : page // ignore: cast_nullable_to_non_nullable
                    as int,
      ),
    );
  }
}

/// @nodoc

class _$GithubRepositorySearchStateImpl
    implements _GithubRepositorySearchState {
  const _$GithubRepositorySearchStateImpl({
    final List<GithubRepository> repositories = const <GithubRepository>[],
    this.incompleteResults = true,
    this.page = 1,
  }) : _repositories = repositories;

  final List<GithubRepository> _repositories;
  @override
  @JsonKey()
  List<GithubRepository> get repositories {
    if (_repositories is EqualUnmodifiableListView) return _repositories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_repositories);
  }

  @override
  @JsonKey()
  final bool incompleteResults;
  @override
  @JsonKey()
  final int page;

  @override
  String toString() {
    return 'GithubRepositorySearchState(repositories: $repositories, incompleteResults: $incompleteResults, page: $page)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GithubRepositorySearchStateImpl &&
            const DeepCollectionEquality().equals(
              other._repositories,
              _repositories,
            ) &&
            (identical(other.incompleteResults, incompleteResults) ||
                other.incompleteResults == incompleteResults) &&
            (identical(other.page, page) || other.page == page));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_repositories),
    incompleteResults,
    page,
  );

  /// Create a copy of GithubRepositorySearchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GithubRepositorySearchStateImplCopyWith<_$GithubRepositorySearchStateImpl>
  get copyWith => __$$GithubRepositorySearchStateImplCopyWithImpl<
    _$GithubRepositorySearchStateImpl
  >(this, _$identity);
}

abstract class _GithubRepositorySearchState
    implements GithubRepositorySearchState {
  const factory _GithubRepositorySearchState({
    final List<GithubRepository> repositories,
    final bool incompleteResults,
    final int page,
  }) = _$GithubRepositorySearchStateImpl;

  @override
  List<GithubRepository> get repositories;
  @override
  bool get incompleteResults;
  @override
  int get page;

  /// Create a copy of GithubRepositorySearchState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GithubRepositorySearchStateImplCopyWith<_$GithubRepositorySearchStateImpl>
  get copyWith => throw _privateConstructorUsedError;
}
