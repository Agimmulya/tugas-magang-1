import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class DetailController extends GetxController {
  final GetStorage data = GetStorage();
  final RxList<IconData> iconWidget =
      RxList([Icons.favorite_border, Icons.favorite]);
  final RxInt iconIndex = RxInt(0);
  late Map<String, dynamic> list = Map();

  void onLike() {
    try {
      if (data.read(Get.arguments)) {
        iconIndex.value = 0;
        print("oke satu");
        list.remove(Get.arguments);
        data.write('jsonFavorite', list);
        print("hapus");
        data.write(Get.arguments, false);
        update();
      } else {
        iconIndex.value = 1;
        data.write(Get.arguments, true);
        list.addAll({Get.arguments: Get.arguments});
        data.write('jsonFavorite', list);
        print(data.read("jsonFavorite"));
        print("Di tambahkan");
        print("oke nol");
        update();
      }
    } catch (e) {
      if (data.read(Get.arguments)) {
        iconIndex.value = 1;
        print("oke satu");
        data.write(Get.arguments, false);
        update();
      } else {
        iconIndex.value = 0;
        data.write(Get.arguments, true);
        print("oke nol");
        update();
      }
    }
  }

  @override
  void onInit() {
    try {
      if (data.read(Get.arguments)) {
        iconIndex.value = 1;
        print("icon true");
        list = data.read('jsonFavorite');
        update();
      } else {
        iconIndex.value = 0;
        list = data.read('jsonFavorite');
        print("icon false");
        update();
      }
    } catch (e) {
      try {
        data.write(Get.arguments, false);
        list = data.read('jsonFavorite');
        print("oke error");
        //ignore: empty_catches
      } catch (e) {}
    }
    super.onInit();
  }
}
