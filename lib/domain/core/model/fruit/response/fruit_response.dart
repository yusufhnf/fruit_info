class FruitResponse {
  String? message;
  int? code;
  FruitResponseData? data;

  FruitResponse({this.message, this.code, this.data});

  FruitResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    code = json['code'];
    data =
        json['data'] != null ? FruitResponseData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['message'] = message;
    data['code'] = code;
    if (data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class FruitResponseData {
  ImagesReferences? imagesReferences;
  List<Fruits>? fruits;

  FruitResponseData({this.imagesReferences, this.fruits});

  FruitResponseData.fromJson(Map<String, dynamic> json) {
    imagesReferences = json['imagesReferences'] != null
        ? ImagesReferences.fromJson(json['imagesReferences'])
        : null;
    if (json['fruits'] != null) {
      fruits = <Fruits>[];
      json['fruits'].forEach((v) {
        fruits!.add(Fruits.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (imagesReferences != null) {
      data['imagesReferences'] = imagesReferences!.toJson();
    }
    if (fruits != null) {
      data['fruits'] = fruits!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ImagesReferences {
  String? apple;
  String? melon;
  String? manggo;
  String? banana;
  String? avocado;

  ImagesReferences({this.apple, this.melon});

  ImagesReferences.fromJson(Map<String, dynamic> json) {
    apple = json['apple'];
    melon = json['melon'];
    manggo = json['manggo'];
    banana = json['banana'];
    avocado = json['avocado'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['apple'] = apple;
    data['melon'] = melon;
    data['manggo'] = manggo;
    data['banana'] = banana;
    data['avocado'] = avocado;
    return data;
  }
}

class Fruits {
  String? name;
  int? price;

  Fruits({this.name, this.price});

  Fruits.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['price'] = price;
    return data;
  }
}
