class FailedResponse {
  FailedResponse({
    this.code,
    this.error,
    this.message,
  });

  FailedResponse.fromJson(dynamic json) {
    code = json['code'];
    error = json['error'];
    message = json['message'];
  }
  int? code;
  bool? error;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = code;
    map['error'] = error;
    map['message'] = message;
    return map;
  }
}
