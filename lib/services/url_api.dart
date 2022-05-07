import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shortener_nu/models/error_model.dart';
import 'package:shortener_nu/models/only_url_model.dart';
import 'package:shortener_nu/models/response_model.dart';
import 'package:shortener_nu/models/url_model.dart';
import 'package:shortener_nu/utils/constants/api_strings.dart';

class URLShortenerAPI {
  String url = dotenv.env['API_URL'].toString();
  var dio = Dio();
  //Url Shortener Send URL and get shortener alias + shortener.

  Future<ResponseModel> shortenerURL(String urlString) async {
    Response response = await dio.post(url + APIStrings.shortenuUrl, data: {
      'url': urlString,
    });
    //Response parser
    if (response.statusCode! >= 200 && response.statusCode! < 400) {
      ResponseModel<URLInfoModel> responseData = ResponseModel<URLInfoModel>(
        model: URLInfoModel.fromJson(response.data),
      );
      return responseData;
    } else if (response.statusCode! >= 400 && response.statusCode! <= 500) {
      ResponseModel<ErrorModel> responseData =
          ResponseModel<ErrorModel>(model: ErrorModel.fromJson(response.data));
      return responseData;
    } else {
      final String responseString = response.statusMessage.toString();
      throw Exception(
        responseString,
      );
    }
  }

// Get URL usign alias

  Future<ResponseModel> getUrl(String alias) async {
    Response response = await dio.get(url + APIStrings.getUrlByAlias + alias);

    if (response.statusCode! >= 200 && response.statusCode! < 400) {
      ResponseModel<OnlyURLModel> responseData = ResponseModel<OnlyURLModel>(
        model: OnlyURLModel.fromJson(response.data),
      );
      return responseData;
    } else if (response.statusCode! >= 400 && response.statusCode! <= 500) {
      ResponseModel<ErrorModel> responseData =
          ResponseModel<ErrorModel>(model: ErrorModel.fromJson(response.data));
      return responseData;
    } else {
      final String responseString = response.statusMessage.toString();
      throw Exception(
        responseString,
      );
    }
  }
}
