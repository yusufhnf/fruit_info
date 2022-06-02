class FruitRequest {
  FruitRequestData? data;

  FruitRequest({this.data});

  FruitRequest.fromJson(Map<String, dynamic> json) {
    data =
        json['data'] != null ? FruitRequestData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class FruitRequestData {
  bool? imageReferences;
  String? referenceId;

  FruitRequestData({this.imageReferences, this.referenceId});

  FruitRequestData.fromJson(Map<String, dynamic> json) {
    imageReferences = json['imageReferences'];
    referenceId = json['referenceId'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['imageReferences'] = imageReferences;
    data['referenceId'] = referenceId;
    return data;
  }
}
