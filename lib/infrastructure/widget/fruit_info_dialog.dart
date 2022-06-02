import 'package:flutter/material.dart';
import 'package:fruit_info/domain/core/model/fruit/response/fruit_response.dart';
import 'package:fruit_info/infrastructure/utils/extension/IntExtension.dart';
import 'package:get/get.dart';

class FruitInfoDialog {
  Fruits fruits;
  FruitInfoDialog({required this.fruits}) {
    _showDialog();
  }

  void _showDialog() {
    showModalBottomSheet(
      context: Get.context!,
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "${fruits.name} total is ${fruits.price?.toRupiah()}",
              ),
              ElevatedButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text("Close"))
            ],
          ),
        );
      },
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24), topRight: Radius.circular(24)),
      ),
      backgroundColor: Colors.white,
    );
  }
}
