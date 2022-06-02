import 'package:fruit_info/domain/core/interfaces/api_response.dart';
import 'package:fruit_info/domain/core/model/failed_response.dart';
import 'package:fruit_info/domain/core/model/base_response.dart';
import 'package:fruit_info/domain/core/model/fruit/request/fruit_request.dart';
import 'package:fruit_info/domain/core/model/fruit/response/fruit_response.dart';
import 'package:fruit_info/domain/core/network/api_url.dart';
import 'package:fruit_info/domain/core/providers/fruit_provider.dart';
import 'package:fruit_info/infrastructure/widget/fruit_info_dialog.dart';
import 'package:get/get.dart';

class HomeController extends GetxController implements ApiResponse {
  RxBool isLoading = true.obs;
  RxBool isFailed = false.obs;
  late final FruitProvider _fruitProvider = FruitProvider(this);
  FruitRequest fruitRequest = FruitRequest(
      data: FruitRequestData(imageReferences: true, referenceId: "1650165235"));
  RxList<Fruits> fruits = <Fruits>[].obs;
  late final FruitResponse fruitResponse;
  RxString selectedFruit = "".obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() async {
    await _fruitProvider.getFruit(fruitRequest);
    super.onReady();
  }

  void showDialog() {
    Fruits fruitsHighest = fruits.reduce((item1, item2) =>
        (item1.price ?? 0) > (item2.price ?? 0) ? item1 : item2);
    FruitInfoDialog(fruits: fruitsHighest);
  }

  void selectFruit(String selected) {
    switch (selected) {
      case "apple":
        selectedFruit.value = fruitResponse.data?.imagesReferences?.apple ?? "";
        break;
      case "manggo":
        selectedFruit.value =
            fruitResponse.data?.imagesReferences?.manggo ?? "";
        break;
      case "banana":
        selectedFruit.value =
            fruitResponse.data?.imagesReferences?.banana ?? "";
        break;
      case "avocado":
        selectedFruit.value =
            fruitResponse.data?.imagesReferences?.avocado ?? "";
        break;
      case "melon":
        selectedFruit.value = fruitResponse.data?.imagesReferences?.melon ?? "";
        break;
      default:
    }
  }

  @override
  void onClose() {}

  @override
  void onFailedRequest(String path, FailedResponse? failed) {
    isFailed(true);
  }

  @override
  void onFinishRequest(String path) {
    // TODO: implement onFinishRequest
  }

  @override
  void onStartRequest(String path) {
    // TODO: implement onStartRequest
  }

  @override
  void onSuccessRequest(String path, BaseResponse response) {
    switch (path) {
      case ApiUrl.getFruit:
        fruitResponse = response.data;
        fruits.clear();
        fruits.addAll(fruitResponse.data?.fruits ?? []);
        break;
      default:
    }
    isLoading(false);
  }
}
