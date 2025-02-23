// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'github_repository.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

GithubRepositoryOwner _$GithubRepositoryOwnerFromJson(
  Map<String, dynamic> json,
) {
  return _GithubRepositoryOwner.fromJson(json);
}

/// @nodoc
mixin _$GithubRepositoryOwner {
  @JsonKey(name: 'avatar_url')
  String get avatarUrl => throw _privateConstructorUsedError;

  /// Serializes this GithubRepositoryOwner to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GithubRepositoryOwner
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GithubRepositoryOwnerCopyWith<GithubRepositoryOwner> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GithubRepositoryOwnerCopyWith<$Res> {
  factory $GithubRepositoryOwnerCopyWith(
    GithubRepositoryOwner value,
    $Res Function(GithubRepositoryOwner) then,
  ) = _$GithubRepositoryOwnerCopyWithImpl<$Res, GithubRepositoryOwner>;
  @useResult
  $Res call({@JsonKey(name: 'avatar_url') String avatarUrl});
}

/// @nodoc
class _$GithubRepositoryOwnerCopyWithImpl<
  $Res,
  $Val extends GithubRepositoryOwner
>
    implements $GithubRepositoryOwnerCopyWith<$Res> {
  _$GithubRepositoryOwnerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GithubRepositoryOwner
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? avatarUrl = null}) {
    return _then(
      _value.copyWith(
            avatarUrl:
                null == avatarUrl
                    ? _value.avatarUrl
                    : avatarUrl // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$GithubRepositoryOwnerImplCopyWith<$Res>
    implements $GithubRepositoryOwnerCopyWith<$Res> {
  factory _$$GithubRepositoryOwnerImplCopyWith(
    _$GithubRepositoryOwnerImpl value,
    $Res Function(_$GithubRepositoryOwnerImpl) then,
  ) = __$$GithubRepositoryOwnerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'avatar_url') String avatarUrl});
}

/// @nodoc
class __$$GithubRepositoryOwnerImplCopyWithImpl<$Res>
    extends
        _$GithubRepositoryOwnerCopyWithImpl<$Res, _$GithubRepositoryOwnerImpl>
    implements _$$GithubRepositoryOwnerImplCopyWith<$Res> {
  __$$GithubRepositoryOwnerImplCopyWithImpl(
    _$GithubRepositoryOwnerImpl _value,
    $Res Function(_$GithubRepositoryOwnerImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GithubRepositoryOwner
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? avatarUrl = null}) {
    return _then(
      _$GithubRepositoryOwnerImpl(
        avatarUrl:
            null == avatarUrl
                ? _value.avatarUrl
                : avatarUrl // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$GithubRepositoryOwnerImpl extends _GithubRepositoryOwner {
  _$GithubRepositoryOwnerImpl({
    @JsonKey(name: 'avatar_url') required this.avatarUrl,
  }) : super._();

  factory _$GithubRepositoryOwnerImpl.fromJson(Map<String, dynamic> json) =>
      _$$GithubRepositoryOwnerImplFromJson(json);

  @override
  @JsonKey(name: 'avatar_url')
  final String avatarUrl;

  @override
  String toString() {
    return 'GithubRepositoryOwner(avatarUrl: $avatarUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GithubRepositoryOwnerImpl &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, avatarUrl);

  /// Create a copy of GithubRepositoryOwner
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GithubRepositoryOwnerImplCopyWith<_$GithubRepositoryOwnerImpl>
  get copyWith =>
      __$$GithubRepositoryOwnerImplCopyWithImpl<_$GithubRepositoryOwnerImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$GithubRepositoryOwnerImplToJson(this);
  }
}

abstract class _GithubRepositoryOwner extends GithubRepositoryOwner {
  factory _GithubRepositoryOwner({
    @JsonKey(name: 'avatar_url') required final String avatarUrl,
  }) = _$GithubRepositoryOwnerImpl;
  _GithubRepositoryOwner._() : super._();

  factory _GithubRepositoryOwner.fromJson(Map<String, dynamic> json) =
      _$GithubRepositoryOwnerImpl.fromJson;

  @override
  @JsonKey(name: 'avatar_url')
  String get avatarUrl;

  /// Create a copy of GithubRepositoryOwner
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GithubRepositoryOwnerImplCopyWith<_$GithubRepositoryOwnerImpl>
  get copyWith => throw _privateConstructorUsedError;
}

GithubRepository _$GithubRepositoryFromJson(Map<String, dynamic> json) {
  return _GithubRepository.fromJson(json);
}

/// @nodoc
mixin _$GithubRepository {
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'full_name')
  String? get fullName => throw _privateConstructorUsedError;
  String? get language => throw _privateConstructorUsedError;
  @JsonKey(name: 'stargazers_count')
  num? get stargazersCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'watchers_count')
  num? get watchersCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'forks_count')
  num? get forksCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'issues_count')
  num? get issuesCount => throw _privateConstructorUsedError;

  /// Serializes this GithubRepository to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GithubRepository
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GithubRepositoryCopyWith<GithubRepository> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GithubRepositoryCopyWith<$Res> {
  factory $GithubRepositoryCopyWith(
    GithubRepository value,
    $Res Function(GithubRepository) then,
  ) = _$GithubRepositoryCopyWithImpl<$Res, GithubRepository>;
  @useResult
  $Res call({
    @JsonKey(name: 'name') String name,
    @JsonKey(name: 'full_name') String? fullName,
    String? language,
    @JsonKey(name: 'stargazers_count') num? stargazersCount,
    @JsonKey(name: 'watchers_count') num? watchersCount,
    @JsonKey(name: 'forks_count') num? forksCount,
    @JsonKey(name: 'issues_count') num? issuesCount,
  });
}

/// @nodoc
class _$GithubRepositoryCopyWithImpl<$Res, $Val extends GithubRepository>
    implements $GithubRepositoryCopyWith<$Res> {
  _$GithubRepositoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GithubRepository
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? fullName = freezed,
    Object? language = freezed,
    Object? stargazersCount = freezed,
    Object? watchersCount = freezed,
    Object? forksCount = freezed,
    Object? issuesCount = freezed,
  }) {
    return _then(
      _value.copyWith(
            name:
                null == name
                    ? _value.name
                    : name // ignore: cast_nullable_to_non_nullable
                        as String,
            fullName:
                freezed == fullName
                    ? _value.fullName
                    : fullName // ignore: cast_nullable_to_non_nullable
                        as String?,
            language:
                freezed == language
                    ? _value.language
                    : language // ignore: cast_nullable_to_non_nullable
                        as String?,
            stargazersCount:
                freezed == stargazersCount
                    ? _value.stargazersCount
                    : stargazersCount // ignore: cast_nullable_to_non_nullable
                        as num?,
            watchersCount:
                freezed == watchersCount
                    ? _value.watchersCount
                    : watchersCount // ignore: cast_nullable_to_non_nullable
                        as num?,
            forksCount:
                freezed == forksCount
                    ? _value.forksCount
                    : forksCount // ignore: cast_nullable_to_non_nullable
                        as num?,
            issuesCount:
                freezed == issuesCount
                    ? _value.issuesCount
                    : issuesCount // ignore: cast_nullable_to_non_nullable
                        as num?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$GithubRepositoryImplCopyWith<$Res>
    implements $GithubRepositoryCopyWith<$Res> {
  factory _$$GithubRepositoryImplCopyWith(
    _$GithubRepositoryImpl value,
    $Res Function(_$GithubRepositoryImpl) then,
  ) = __$$GithubRepositoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'name') String name,
    @JsonKey(name: 'full_name') String? fullName,
    String? language,
    @JsonKey(name: 'stargazers_count') num? stargazersCount,
    @JsonKey(name: 'watchers_count') num? watchersCount,
    @JsonKey(name: 'forks_count') num? forksCount,
    @JsonKey(name: 'issues_count') num? issuesCount,
  });
}

/// @nodoc
class __$$GithubRepositoryImplCopyWithImpl<$Res>
    extends _$GithubRepositoryCopyWithImpl<$Res, _$GithubRepositoryImpl>
    implements _$$GithubRepositoryImplCopyWith<$Res> {
  __$$GithubRepositoryImplCopyWithImpl(
    _$GithubRepositoryImpl _value,
    $Res Function(_$GithubRepositoryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GithubRepository
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? fullName = freezed,
    Object? language = freezed,
    Object? stargazersCount = freezed,
    Object? watchersCount = freezed,
    Object? forksCount = freezed,
    Object? issuesCount = freezed,
  }) {
    return _then(
      _$GithubRepositoryImpl(
        name:
            null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                    as String,
        fullName:
            freezed == fullName
                ? _value.fullName
                : fullName // ignore: cast_nullable_to_non_nullable
                    as String?,
        language:
            freezed == language
                ? _value.language
                : language // ignore: cast_nullable_to_non_nullable
                    as String?,
        stargazersCount:
            freezed == stargazersCount
                ? _value.stargazersCount
                : stargazersCount // ignore: cast_nullable_to_non_nullable
                    as num?,
        watchersCount:
            freezed == watchersCount
                ? _value.watchersCount
                : watchersCount // ignore: cast_nullable_to_non_nullable
                    as num?,
        forksCount:
            freezed == forksCount
                ? _value.forksCount
                : forksCount // ignore: cast_nullable_to_non_nullable
                    as num?,
        issuesCount:
            freezed == issuesCount
                ? _value.issuesCount
                : issuesCount // ignore: cast_nullable_to_non_nullable
                    as num?,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$GithubRepositoryImpl extends _GithubRepository {
  _$GithubRepositoryImpl({
    @JsonKey(name: 'name') required this.name,
    @JsonKey(name: 'full_name') required this.fullName,
    required this.language,
    @JsonKey(name: 'stargazers_count') required this.stargazersCount,
    @JsonKey(name: 'watchers_count') required this.watchersCount,
    @JsonKey(name: 'forks_count') required this.forksCount,
    @JsonKey(name: 'issues_count') required this.issuesCount,
  }) : super._();

  factory _$GithubRepositoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$GithubRepositoryImplFromJson(json);

  @override
  @JsonKey(name: 'name')
  final String name;
  @override
  @JsonKey(name: 'full_name')
  final String? fullName;
  @override
  final String? language;
  @override
  @JsonKey(name: 'stargazers_count')
  final num? stargazersCount;
  @override
  @JsonKey(name: 'watchers_count')
  final num? watchersCount;
  @override
  @JsonKey(name: 'forks_count')
  final num? forksCount;
  @override
  @JsonKey(name: 'issues_count')
  final num? issuesCount;

  @override
  String toString() {
    return 'GithubRepository(name: $name, fullName: $fullName, language: $language, stargazersCount: $stargazersCount, watchersCount: $watchersCount, forksCount: $forksCount, issuesCount: $issuesCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GithubRepositoryImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.stargazersCount, stargazersCount) ||
                other.stargazersCount == stargazersCount) &&
            (identical(other.watchersCount, watchersCount) ||
                other.watchersCount == watchersCount) &&
            (identical(other.forksCount, forksCount) ||
                other.forksCount == forksCount) &&
            (identical(other.issuesCount, issuesCount) ||
                other.issuesCount == issuesCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    name,
    fullName,
    language,
    stargazersCount,
    watchersCount,
    forksCount,
    issuesCount,
  );

  /// Create a copy of GithubRepository
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GithubRepositoryImplCopyWith<_$GithubRepositoryImpl> get copyWith =>
      __$$GithubRepositoryImplCopyWithImpl<_$GithubRepositoryImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$GithubRepositoryImplToJson(this);
  }
}

abstract class _GithubRepository extends GithubRepository {
  factory _GithubRepository({
    @JsonKey(name: 'name') required final String name,
    @JsonKey(name: 'full_name') required final String? fullName,
    required final String? language,
    @JsonKey(name: 'stargazers_count') required final num? stargazersCount,
    @JsonKey(name: 'watchers_count') required final num? watchersCount,
    @JsonKey(name: 'forks_count') required final num? forksCount,
    @JsonKey(name: 'issues_count') required final num? issuesCount,
  }) = _$GithubRepositoryImpl;
  _GithubRepository._() : super._();

  factory _GithubRepository.fromJson(Map<String, dynamic> json) =
      _$GithubRepositoryImpl.fromJson;

  @override
  @JsonKey(name: 'name')
  String get name;
  @override
  @JsonKey(name: 'full_name')
  String? get fullName;
  @override
  String? get language;
  @override
  @JsonKey(name: 'stargazers_count')
  num? get stargazersCount;
  @override
  @JsonKey(name: 'watchers_count')
  num? get watchersCount;
  @override
  @JsonKey(name: 'forks_count')
  num? get forksCount;
  @override
  @JsonKey(name: 'issues_count')
  num? get issuesCount;

  /// Create a copy of GithubRepository
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GithubRepositoryImplCopyWith<_$GithubRepositoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GithubSearchRepositoriesResponse _$GithubSearchRepositoriesResponseFromJson(
  Map<String, dynamic> json,
) {
  return _GithubSearchRepositoriesResponse.fromJson(json);
}

/// @nodoc
mixin _$GithubSearchRepositoriesResponse {
  @JsonKey(name: 'total_count')
  num get totalCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'incomplete_results')
  bool get imcompleteResults => throw _privateConstructorUsedError;
  List<GithubRepository> get items => throw _privateConstructorUsedError;

  /// Serializes this GithubSearchRepositoriesResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GithubSearchRepositoriesResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GithubSearchRepositoriesResponseCopyWith<GithubSearchRepositoriesResponse>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GithubSearchRepositoriesResponseCopyWith<$Res> {
  factory $GithubSearchRepositoriesResponseCopyWith(
    GithubSearchRepositoriesResponse value,
    $Res Function(GithubSearchRepositoriesResponse) then,
  ) =
      _$GithubSearchRepositoriesResponseCopyWithImpl<
        $Res,
        GithubSearchRepositoriesResponse
      >;
  @useResult
  $Res call({
    @JsonKey(name: 'total_count') num totalCount,
    @JsonKey(name: 'incomplete_results') bool imcompleteResults,
    List<GithubRepository> items,
  });
}

/// @nodoc
class _$GithubSearchRepositoriesResponseCopyWithImpl<
  $Res,
  $Val extends GithubSearchRepositoriesResponse
>
    implements $GithubSearchRepositoriesResponseCopyWith<$Res> {
  _$GithubSearchRepositoriesResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GithubSearchRepositoriesResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalCount = null,
    Object? imcompleteResults = null,
    Object? items = null,
  }) {
    return _then(
      _value.copyWith(
            totalCount:
                null == totalCount
                    ? _value.totalCount
                    : totalCount // ignore: cast_nullable_to_non_nullable
                        as num,
            imcompleteResults:
                null == imcompleteResults
                    ? _value.imcompleteResults
                    : imcompleteResults // ignore: cast_nullable_to_non_nullable
                        as bool,
            items:
                null == items
                    ? _value.items
                    : items // ignore: cast_nullable_to_non_nullable
                        as List<GithubRepository>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$GithubSearchRepositoriesResponseImplCopyWith<$Res>
    implements $GithubSearchRepositoriesResponseCopyWith<$Res> {
  factory _$$GithubSearchRepositoriesResponseImplCopyWith(
    _$GithubSearchRepositoriesResponseImpl value,
    $Res Function(_$GithubSearchRepositoriesResponseImpl) then,
  ) = __$$GithubSearchRepositoriesResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'total_count') num totalCount,
    @JsonKey(name: 'incomplete_results') bool imcompleteResults,
    List<GithubRepository> items,
  });
}

/// @nodoc
class __$$GithubSearchRepositoriesResponseImplCopyWithImpl<$Res>
    extends
        _$GithubSearchRepositoriesResponseCopyWithImpl<
          $Res,
          _$GithubSearchRepositoriesResponseImpl
        >
    implements _$$GithubSearchRepositoriesResponseImplCopyWith<$Res> {
  __$$GithubSearchRepositoriesResponseImplCopyWithImpl(
    _$GithubSearchRepositoriesResponseImpl _value,
    $Res Function(_$GithubSearchRepositoriesResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GithubSearchRepositoriesResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalCount = null,
    Object? imcompleteResults = null,
    Object? items = null,
  }) {
    return _then(
      _$GithubSearchRepositoriesResponseImpl(
        totalCount:
            null == totalCount
                ? _value.totalCount
                : totalCount // ignore: cast_nullable_to_non_nullable
                    as num,
        imcompleteResults:
            null == imcompleteResults
                ? _value.imcompleteResults
                : imcompleteResults // ignore: cast_nullable_to_non_nullable
                    as bool,
        items:
            null == items
                ? _value._items
                : items // ignore: cast_nullable_to_non_nullable
                    as List<GithubRepository>,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$GithubSearchRepositoriesResponseImpl
    extends _GithubSearchRepositoriesResponse {
  _$GithubSearchRepositoriesResponseImpl({
    @JsonKey(name: 'total_count') required this.totalCount,
    @JsonKey(name: 'incomplete_results') required this.imcompleteResults,
    required final List<GithubRepository> items,
  }) : _items = items,
       super._();

  factory _$GithubSearchRepositoriesResponseImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$GithubSearchRepositoriesResponseImplFromJson(json);

  @override
  @JsonKey(name: 'total_count')
  final num totalCount;
  @override
  @JsonKey(name: 'incomplete_results')
  final bool imcompleteResults;
  final List<GithubRepository> _items;
  @override
  List<GithubRepository> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'GithubSearchRepositoriesResponse(totalCount: $totalCount, imcompleteResults: $imcompleteResults, items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GithubSearchRepositoriesResponseImpl &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            (identical(other.imcompleteResults, imcompleteResults) ||
                other.imcompleteResults == imcompleteResults) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    totalCount,
    imcompleteResults,
    const DeepCollectionEquality().hash(_items),
  );

  /// Create a copy of GithubSearchRepositoriesResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GithubSearchRepositoriesResponseImplCopyWith<
    _$GithubSearchRepositoriesResponseImpl
  >
  get copyWith => __$$GithubSearchRepositoriesResponseImplCopyWithImpl<
    _$GithubSearchRepositoriesResponseImpl
  >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GithubSearchRepositoriesResponseImplToJson(this);
  }
}

abstract class _GithubSearchRepositoriesResponse
    extends GithubSearchRepositoriesResponse {
  factory _GithubSearchRepositoriesResponse({
    @JsonKey(name: 'total_count') required final num totalCount,
    @JsonKey(name: 'incomplete_results') required final bool imcompleteResults,
    required final List<GithubRepository> items,
  }) = _$GithubSearchRepositoriesResponseImpl;
  _GithubSearchRepositoriesResponse._() : super._();

  factory _GithubSearchRepositoriesResponse.fromJson(
    Map<String, dynamic> json,
  ) = _$GithubSearchRepositoriesResponseImpl.fromJson;

  @override
  @JsonKey(name: 'total_count')
  num get totalCount;
  @override
  @JsonKey(name: 'incomplete_results')
  bool get imcompleteResults;
  @override
  List<GithubRepository> get items;

  /// Create a copy of GithubSearchRepositoriesResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GithubSearchRepositoriesResponseImplCopyWith<
    _$GithubSearchRepositoriesResponseImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}
