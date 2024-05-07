import 'package:user_login/data/network/base_api_services.dart';
import 'package:user_login/data/network/network_api_services.dart';
import 'package:user_login/resources/urls.dart';

class AuthRepository {
  final BaseApiServices apiServices = NetworkApiServices();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response =
          apiServices.getPostApiResponnse(AppUrl.loginApiEndpointUrl, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> registerApi(dynamic data) async {
    try {
      dynamic response = await apiServices.getPostApiResponnse(
          AppUrl.registerApiEndpointUrl, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
