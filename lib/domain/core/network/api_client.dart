import 'dart:convert';

import 'package:fruit_info/domain/core/network/api_url.dart';
import 'package:fruit_info/infrastructure/utils/extension/list_print.dart';
import 'package:get/get.dart';

import '../../../config.dart';
import '../../../infrastructure/utils/helpers/helpers.dart';
import '../model/failed_response.dart';

class ApiClient extends GetConnect {
  FailedResponse? failed;
  Map? body;
  Map<String, dynamic>? params;

  @override
  void onInit() {
    httpClient.baseUrl = ApiUrl.baseUrl;
    httpClient.defaultContentType = "application/json";
    httpClient.timeout = const Duration(seconds: 60);
    httpClient.addRequestModifier<dynamic>((request) async {
      if (PrefHelper.to.getToken() != null) {
        request.headers
            .addAll({"Authorization": "Bearer ${PrefHelper.to.getToken()}"});
      }
      request.headers.addAll({
        "Accept": "application/json",
        "x-api-key": ConfigEnvironments.getEnvironments()["api-key"] ?? ""
      });
      return request;
    });
    httpClient.addResponseModifier((request, response) async {
      try {
        const JsonEncoder encoder = JsonEncoder.withIndent('  ');
        final String prettyJson = encoder.convert(response.body);
        log.d(
          // ignore: unnecessary_null_comparison
          "REQUEST ► ︎ ${request.method} ${request.method.toUpperCase()} ${request.url}\n\n"
          "Headers:\n"
          "${request.headers.getAllString()}\n"
          "Request Param: \n ${params.toString()}\n"
          "Request Body: \n ${body.toString()}\n"
          "Response Body ${response.statusCode} : $prettyJson",
        );
        if (!response.isOk) {
          failed = FailedResponse.fromJson(response.body);
        }
      } on Exception catch (e) {
        log.d("error $e");
        failed = FailedResponse(code: 500, message: e.toString(), error: true);
      }
      return response;
    });
    super.onInit();
  }
}
