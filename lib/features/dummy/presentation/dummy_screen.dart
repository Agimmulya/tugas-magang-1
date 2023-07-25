import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';
import '../../../components/config/app_route.dart';
import '../../../features/dummy/presentation/dummy_controller.dart';
import '../../favorit/presentation/favorit_screen.dart';
import '../model/dummy_model.dart';
import 'dummy_controller.dart';
import '../../detail/presentation/detail_screen.dart';
import 'dummy_favorit.dart';
import 'dummy_state.dart';

class DummyScreen extends GetView<DummyController> {
  const DummyScreen({Key? key}) : super(key: key);

  // RxInt _currentIndex = 0.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: _body(),
      bottomNavigationBar: _buildBarNavigation(),
    );
  }

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      //title: const Text("Football"),
      backgroundColor: Colors.blue,
      toolbarHeight: 80,
      flexibleSpace: Center(
        child: Container(
          margin: const EdgeInsets.only(left: 20, right: 20),
          child: TextField(
            style: const TextStyle(fontSize: 16, color: Colors.white),
            cursorColor: Colors.white,
            controller: controller.controllerText,
            onChanged: (text) {
              controller.seacrh(text);
            },
          ),
        ),
      ),
    );
  }

  Widget _body() {
    return GetBuilder<DummyController>(
      builder: (ctrl) {
        final state = controller.footballState;

        if (state is DummyFootballLoading) {
          return _loading();
        }

        if (state is DummyFootballLoadSuccess) {
          if (controller.index.value == 0) {
            return _contentBody(state.listFootball);
          } else {
            return FavoritScreen();
          }
        }

        return Container();
      },
    );
  }

  Widget _buildBarNavigation() {
    return Obx(
      () => BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: '',
          ),
        ],
        currentIndex: controller.index.value,
        selectedItemColor: Colors.blue,
        onTap: (i) {
          controller.loadingBarNavigation();
          controller.index.value = i;
        },
      ),
    );
  }

  Widget _loading() => const Center(child: CircularProgressIndicator());

  Widget _contentBody(List<SampleModel> listData) {
    return GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 1.0,
        padding: const EdgeInsets.all(8.0),
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
        children: controller.filterClub
            .map((football) => _itemFootball(football))
            .toList());
  }

  Widget _itemFootball(SampleModel klub) {
    return GestureDetector(
      onTap: () {
        controller.data.write('namaklub', klub.name!);
        controller.data.write('logoklub', klub.image!);
        controller.data.write('deskripsi', klub.desc!);
        controller.data.write('namastadion', klub.nameStadium!);
        controller.data.write('warna', klub.warna!);
        controller.data.write('dataFavorit', klub);
        //print("ini adalah ${jsonEncode(klub)}");

        Get.toNamed(AppRoute.detail,
            arguments: controller.data.read('namaklub'));
      },
      child: GridTile(
        // footer: GridTileBar(
        //   backgroundColor: Colors.black45,
        //   title: Text(klub.name!),
        // ),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                blurRadius: 5,
                spreadRadius: 1,
                offset: const Offset(1, 3),
              ),
            ],
          ),
          child: Hero(
            tag: klub.name!,
            child: CachedNetworkImage(
              imageUrl: klub.image!,
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
      ),
    );
  }
}
