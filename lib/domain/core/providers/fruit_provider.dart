import 'package:fruit_info/domain/core/model/fruit/request/fruit_request.dart';
import 'package:fruit_info/domain/core/model/fruit/response/fruit_response.dart';
import 'package:fruit_info/domain/core/network/api_client.dart';
import 'package:get/get_connect/http/src/multipart/form_data.dart';

import '../interfaces/api_response.dart';
import '../model/base_response.dart';
import '../model/failed_response.dart';
import '../network/api_url.dart';

class FruitProvider extends ApiClient {
  final ApiResponse apiResponse;

  FruitProvider(this.apiResponse) {
    super.onInit();
  }

  Future<void> getFruit(FruitRequest fruitRequest) async {
    String path = ApiUrl.getFruit;
    apiResponse.onStartRequest(path);
    Map<String, dynamic> body = fruitRequest.toJson();
    super.body = body;
    var response = await post(path, FormData(body));
    apiResponse.onFinishRequest(path);
    if (response.isOk) {
      final result = FruitResponse.fromJson(response.body);
      apiResponse.onSuccessRequest(path, BaseResponse<FruitResponse>(result));
    } else {
      apiResponse.onFailedRequest(path, FailedResponse.fromJson(response.body));
    }
  }
}
