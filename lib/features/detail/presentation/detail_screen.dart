import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:hex_color_me/hex_color_me.dart';
import 'detail_controller.dart';

class DetailScreen extends GetView<DetailController> {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Favorit'),
        backgroundColor: Colors.blue,
        actions: [
          Obx(() => IconButton(
                icon: Icon(
                  // ignore: invalid_use_of_protected_member
                  controller.iconWidget.value[controller.iconIndex.value],
                  color: Colors.white,
                ),
                onPressed: () {
                  controller.onLike();
                },
              ))
        ],
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20),
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    height: 160,
                    width: 150,
                    decoration: BoxDecoration(
                      color: HexColor(controller.data.read('warna')),
                      boxShadow: [
                        BoxShadow(
                          spreadRadius: 3,
                          blurRadius: 4,
                          offset: const Offset(7, 9),
                          color: Colors.grey.withOpacity(
                            0.4,
                          ),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Image.network(
                        controller.data.read('logoklub'),
                        width: 130,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 30),
                Column(
                  children: [
                    Text(
                      'Nama Club : ',
                      style: TextStyle(
                        fontSize: 17,
                        color: HexColor(controller.data.read('warna')),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      controller.data.read('namaklub'),
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: HexColor(controller.data.read('warna')),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Nama Stadion : ',
                      style: TextStyle(
                        fontSize: 17,
                        color: HexColor(controller.data.read('warna')),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      controller.data.read('namastadion'),
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: HexColor(controller.data.read('warna')),
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 10),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30, top: 40),
                  child: Text(
                    'Deskripsi Club',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: HexColor(controller.data.read('warna')),
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  '===================================================',
                  style: TextStyle(
                    fontSize: 14,
                    color: HexColor(controller.data.read('warna')),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Text(
                    controller.data.read('deskripsi'),
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: HexColor(controller.data.read('warna')),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
