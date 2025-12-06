// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_repository_search_api.dart';

// dart format off

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element,unnecessary_string_interpolations,unused_element_parameter,avoid_unused_constructor_parameters,unreachable_from_main

class _GithubRepositorySearchApi implements GithubRepositorySearchApi {
  _GithubRepositorySearchApi(this._dio, {this.baseUrl, this.errorLogger});

  final Dio _dio;

  String? baseUrl;

  final ParseErrorLogger? errorLogger;

  @override
  Future<GithubSearchRepositoriesResponse> searchRepositories(
    String searchKeyword,
    int page,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'q': searchKeyword,
      r'page': page,
    };
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<GithubSearchRepositoriesResponse>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/search/repositories',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late GithubSearchRepositoriesResponse _value;
    try {
      _value = GithubSearchRepositoriesResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, _result);
      rethrow;
    }
    return _value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(String dioBaseUrl, String? baseUrl) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}

// dart format on

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(githubRepositorySearchApi)
const githubRepositorySearchApiProvider = GithubRepositorySearchApiProvider._();

final class GithubRepositorySearchApiProvider
    extends
        $FunctionalProvider<
          GithubRepositorySearchApi,
          GithubRepositorySearchApi,
          GithubRepositorySearchApi
        >
    with $Provider<GithubRepositorySearchApi> {
  const GithubRepositorySearchApiProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'githubRepositorySearchApiProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$githubRepositorySearchApiHash();

  @$internal
  @override
  $ProviderElement<GithubRepositorySearchApi> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GithubRepositorySearchApi create(Ref ref) {
    return githubRepositorySearchApi(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GithubRepositorySearchApi value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GithubRepositorySearchApi>(value),
    );
  }
}

String _$githubRepositorySearchApiHash() =>
    r'2de41253b561415f03378eb8ae436485e676c55f';
