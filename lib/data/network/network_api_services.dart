import 'dart:convert';
import 'dart:io';

import 'package:user_login/data/network/base_api_services.dart';
import 'package:user_login/data/app_expections.dart';
import 'package:http/http.dart' as http;

class NetworkApiServices extends BaseApiServices {
  @override
  Future getGetApiResponnse(String url) async {
    dynamic responseJson;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("Error during communication");
    }
    return responseJson;
  }

  @override
  Future getPostApiResponnse(String url, dynamic data) async {
    dynamic responseJson;
    try {
      final response = await http
          .post(Uri.parse(url), body: data)
          .timeout(const Duration(seconds: 10));
      print(response.toString());
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("Error during communication");
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;

      case 503:
        throw UnauthorizedException(
            "You do have authorization to access the file");

      default:
        throw FetchDataException(
            "Error while communicating with the server with Status Code ${response.statusCode}");
    }
  }
}
