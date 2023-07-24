import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:hex_color_me/hex_color_me.dart';
import 'detail_controller.dart';

class DetailScreen extends GetView<DetailController> {
  DetailScreen({super.key});
  // RxBool isFavorit = false.obs;

  // void favorit() {
  //   isFavorit != isFavorit;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Football'),
        backgroundColor: Colors.blue,
        actions: const [
          // IconButton(
          //     onPressed: () {
          //       favorit();
          //     },
          //     icon: isFavorit
          //         ? Icon(
          //             Icons.favorite_border,
          //           )
          //         : Icon(Icons.favorite)),
        ],
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            // dragStartBehavior: DragStartBehavior.start,
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
                    const Text(
                      'Nama Club : ',
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      controller.data.read('namaklub'),
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Nama Stadion : ',
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      controller.data.read('namastadion'),
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    // TextButton(
                    //   onPressed: () async {
                    //     EasyLoading.show(status: 'loading...');
                    //     Alert(
                    //       context: context,
                    //       image: Image(
                    //         image: NetworkImage(
                    //           saveStorage.read("locstadion"),
                    //         ),
                    //       ),
                    //       desc:
                    //           '${saveStorage.read('kapasitas')}\nKapasitas stadium ${saveStorage.read('fotostadion')}',
                    //     ).show();
                    //     await Future.delayed(
                    //       const Duration(
                    //         seconds: 2,
                    //       ),
                    //     );
                    //     //EasyLoading.dismiss();
                    //   },
                    //   child: Text(
                    //     saveStorage.read('stadion'),
                    //     style: const TextStyle(
                    //       fontSize: 22,
                    //       fontWeight: FontWeight.bold,
                    //       color: Colors.white,
                    //     ),
                    //   ),
                    //)
                  ],
                ),
                const SizedBox(width: 10),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 30, top: 40),
                  child: Text(
                    'Deskripsi Club',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                const Text(
                  '===================================================',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Text(
                    controller.data.read('deskripsi'),
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
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
