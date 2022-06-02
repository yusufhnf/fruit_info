import 'package:flutter/material.dart';
import 'package:fruit_info/infrastructure/utils/extension/IntExtension.dart';

import 'package:get/get.dart';

import 'controllers/home.controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
          appBar: AppBar(
            title: const Text('Fruit'),
            centerTitle: true,
          ),
          body: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: controller.isLoading.isTrue
                  ? _loading()
                  : controller.isFailed.isTrue
                      ? _failed()
                      : _result())),
    );
  }

  Widget _loading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _failed() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Failed"),
        ElevatedButton(
            onPressed: () => controller.onReady(), child: const Text("Retry"))
      ],
    );
  }

  Widget _result() {
    return Column(
      children: [
        Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) => ListTile(
                      onTap: () => controller
                          .selectFruit(controller.fruits[index].name ?? ""),
                      title: Text(
                          (controller.fruits[index].name ?? "").toUpperCase()),
                      trailing: Text(
                          (controller.fruits[index].price ?? 0).toRupiah()),
                    ),
                separatorBuilder: (context, index) => const Divider(),
                itemCount: controller.fruits.length)),
        const SizedBox(height: 16),
        Expanded(
            child: Column(
          children: [
            Image.network(
              controller.selectedFruit.isEmpty
                  ? "https://images.pexels.com/photos/1132047/pexels-photo-1132047.jpeg"
                  : controller.selectedFruit.value,
              height: 200,
              errorBuilder: (context, __, ___) =>
                  const Icon(Icons.error_outline),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
                onPressed: () => controller.showDialog(),
                child: const Text("Click me"))
          ],
        ))
      ],
    );
  }
}
