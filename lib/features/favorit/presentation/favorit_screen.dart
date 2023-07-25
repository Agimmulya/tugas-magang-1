import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../dummy/presentation/dummy_controller.dart';

class FavoritScreen extends GetView<DummyController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DummyController>(
      builder: (ctr) {
        if (controller.favorite.isEmpty) {
          print('ini adalah leng ${controller.favorite.length}');
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 50,
                ),
                const Text(
                  "tidak ada klub favorit",
                  style: TextStyle(fontSize: 20),
                )
              ],
            ),
          );
        } else {
          return ListView.builder(
            itemCount: controller.favorite.length,
            itemBuilder: (context, index) {
              String key = controller.favorite.keys.elementAt(index);
              dynamic value = controller.favorite[key];
              return ListTile(
                onTap: () {
                  print(controller.data.read("jsonFavorite"));
                },
                leading: const Icon(
                  Icons.favorite,
                  color: Colors.red,
                ),
                title: Text(value),
                subtitle: Text("Tersimpan"),
              );
            },
          );
        }
      },
    );
  }
}
