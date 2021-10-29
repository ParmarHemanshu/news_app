import 'package:dio/dio.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/models/source_model.dart';
import 'package:retrofit/http.dart';

part 'api_get_request.g.dart';

@RestApi(baseUrl: "https://newsapi.org/")
abstract class ApiDataGetRequest {
  factory ApiDataGetRequest(Dio dio, {String? baseurl, String? sourceName}) {
    dio.interceptors.add(LogInterceptor(
        requestBody: false, responseBody: true, responseHeader: true));
    dio.options = BaseOptions(
        receiveTimeout: 30000,
        connectTimeout: 30000,
        queryParameters: {
          "apiKey": "a433248c7dab4f9faaaebf72eb123b69",
          "q": sourceName ?? "",
          "pageSize": 10
        });
    return _ApiDataGetRequest(dio, baseUrl: baseurl);
  }

  @GET("/v2/top-headlines/sources/")
  Future<SourceModel> getAllSources();

  @GET("/v2/everything")
  Future<ArticleModel> getArticlesOfSource();
}
