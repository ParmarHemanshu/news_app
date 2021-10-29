// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_get_request.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _ApiDataGetRequest implements ApiDataGetRequest {
  _ApiDataGetRequest(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://newsapi.org/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<SourceModel> getAllSources() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<SourceModel>(
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '/v2/top-headlines/sources/',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = SourceModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<ArticleModel> getArticlesOfSource() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ArticleModel>(
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '/v2/everything',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ArticleModel.fromJson(_result.data!);
    return value;
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
}
