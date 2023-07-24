import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';

import '../../../components/util/helper.dart';
import '../../../components/util/state.dart';
import '../repository/dummy_repository.dart';
import 'dummy_state.dart';

class DummyController extends GetxController {
  final DummyRepository _repository;
  DummyState footballState = DummyFootballIdle();
  RxInt index = 0.obs;
  final data = GetStorage();
  final _logger = Logger();
  DummyController(this._repository);

  @override
  void onInit() {
    _loadAllFootball();
    super.onInit();
  }

  void loadingBarNavigation() {
    _loadAllFootball();
    update();
  }

  void _loadAllFootball() {
    footballState = DummyFootballLoading();
    update();
    _repository.loadFootball(
        response: ResponseHandler(onSuccess: (listFood) {
      footballState = DummyFootballLoadSuccess(listFood);
    }, onFailed: (e, message) {
      _logger.e(e);
      AlertModel.showBasic("Error", message);
      footballState = DummyFootballError();
    }, onDone: () {
      update();
    }));
  }
}
