import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';
import '../../../features/detail/presentation/detail_controller.dart';
import '../../../features/dummy/model/dummy_model.dart';
import '../../../components/util/helper.dart';
import '../../../components/util/state.dart';
import '../model/dummy_model.dart';
import '../repository/dummy_repository.dart';
import 'dummy_state.dart';

class DummyController extends GetxController {
  TextEditingController controllerText = TextEditingController();
  List<SampleModel> allClub = [];
  RxList<SampleModel> filterClub = RxList<SampleModel>();

  late Map<String, dynamic> favorite = Map();

  final DummyRepository _repository;
  DummyState footballState = DummyFootballIdle();
  RxInt index = 0.obs;
  final GetStorage data = GetStorage();
  final _logger = Logger();
  DummyController(this._repository);
  int ec = 0;

  @override
  void onInit() {
    _loadAllFootball();
    print('ini adalah penampungan data favorit ${data.read('jsonFavorite')}');

    try {
      favorite = data.read('jsonFavorite');
      // ignore: empty_catches
    } catch (e) {}
    super.onInit();
  }

  @override
  void dispose() {
    try {
      favorite = data.read('jsonFavorite');
      // ignore: empty_catches
    } catch (e) {}
    super.dispose();
  }

  void loadingBarNavigation() {
    _loadAllFootball();
    update();
  }

  void seacrh(String seacrhText) {
    if (seacrhText.isEmpty) {
      filterClub.value = allClub;
    } else {
      filterClub.value = allClub.where((klub) {
        return klub.name!.toLowerCase().contains(seacrhText.toLowerCase());
      }).toList();
    }
    update();
  }

  void _loadAllFootball() {
    footballState = DummyFootballLoading();
    update();
    _repository.loadFootball(
        response: ResponseHandler(onSuccess: (listFootball) {
      allClub = listFootball;
      footballState = DummyFootballLoadSuccess(listFootball);
      filterClub.value = listFootball;
    }, onFailed: (e, message) {
      _logger.e(e);
      AlertModel.showBasic("Error", message);
      footballState = DummyFootballError();
    }, onDone: () {
      update();
    }));
  }
}
